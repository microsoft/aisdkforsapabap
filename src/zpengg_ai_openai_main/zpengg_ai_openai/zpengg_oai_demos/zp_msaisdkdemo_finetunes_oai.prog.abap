*&---------------------------------------------------------------------*
*& Report ZP_MSAISDKDEMO_FINETUNES_OAI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZP_MSAISDKDEMO_FINETUNES_OAI.
INCLUDE zp_msaisdkdemo_params_top_oai.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )



DATA:
  upload_data             TYPE zif_peng_azoai_sdk_types=>tty_file_upload,
  uploaded_file_info      TYPE zif_peng_azoai_sdk_types=>ty_file_get,
  finetunes_create        TYPE zif_peng_azoai_sdk_types=>ty_finetune_create,
  finetunes_create_result TYPE zif_peng_azoai_sdk_types=>ty_finetune_result,
  finetunes_list          TYPE zif_peng_azoai_sdk_types=>ty_finetune_list,
  finetunes_get_result    TYPE zif_peng_azoai_sdk_types=>ty_finetune_result,
  finetunes_events        TYPE zif_peng_azoai_sdk_types=>ty_finetune_events,
  finetunes_cancel_result TYPE zif_peng_azoai_sdk_types=>ty_finetune_result,
  delete_result           TYPE string.


START-OF-SELECTION.

  TRY.
* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-openai
                                                            api_key     = p_key
                                                          ).

************************** Creating a New Fine Tune Job ******************
* FineTunes - Create
* To start a Fine Tune, we need 2 things.
*   1) A Training File  - Which we will create using upload functionality of SDK
*   2) A Base Model     - This is the model that we will train to create a new fine-tuned model.
*
* Step #1 : Creating a Training File.
* As the first step, we prepare the data. In the below example, 2 hard-coded texts with sentiments are used as samples.
* In a real use case, these values may be a result of programmatic extraction of data from SAP Application server.
      upload_data = VALUE #(
                            ( prompt = 'Overjoyed with the new iPhone! ->' completion = 'positive' )
                            ( prompt = '@contoso_basketball disappoint for a third straight night. ->' completion = 'negative' )
                            ).

* With data prepared, perform upload. For purpose of this demo, we are naming the file "Demo_File_Upload.jsonl" - but this
* can be changed to anything depending on use case.
      sdk_instance->files( )->upload(
        EXPORTING
          filename     = 'Demo_File_Upload.jsonl'     "File Name
          jsonldata    = upload_data                  " JSONL data to upload
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          file         = uploaded_file_info           " ABAP Ready uploaded file information.
          error        = error                        " ABAP Ready error details
      ).

      BREAK-POINT.


* Step #2 : With the file uploaded and (!!! THIS IS IMPORTANT !!!) status as "Success" - We will create a new fine-tune
*
* !!!! A COMMON MISTAKE !!!
* SIDE NOTE : This part - of file status needing to be "Success" - is probably going to trip many developers. It should be noted
*             that when a file is uploaded, it takes some time for AI Engine/Portal to actually consume and commit the file and makes
*             it available for fine-tuning. This is indicated with the "Status" fileld. Hence, a WAIT, or some other mechanism must
*             be used in a real program to detect status of "Succeeded" and then proceed with fine-tune creation.
* Create a new FineTune.
      finetunes_create-model = 'curie'.
      finetunes_create-training_file = uploaded_file_info-id.
      sdk_instance->finetunes( )->create(
        EXPORTING
          finetune_create = finetunes_create
*          finetune_create = value #( model = 'curie' training_file = uploaded_file_info-id ) "Modern ABAP Syntax Alternative
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          finetune     = finetunes_create_result      " ABAP Ready Fine Tune Creation result
          error        = error                        " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** List All Fine Tunes *********************************
* FineTunes - List

      sdk_instance->finetunes( )->list(
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          finetune_list = finetunes_list              " ABAP Ready Fine Tunes List
          error         = error                       " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** Get details of a specific FineTune Job  *************
* FineTunes - Get
* In below code, we are going to get details about the fine-tune job that we created
*
* !!!Remember!!! - Fine Tunes are kind of like Batch Jobs, and it may take 30 minutes to 1 hour
* for a fine-tune job to finish. Here, for demo purposes, we are simply retrieving the
* fine tune job that was just created. In a real program using fine-tuning capabilities,
* it would be something like an ABAP Daemon or APC program - or even a batch job program
* which would periodically check a list of fine-tunes and, as an example - notify about
* the status (eg: completion).
* Get details of a fine tune ID.
      sdk_instance->finetunes( )->get(
        EXPORTING
          finetuneid   = finetunes_create_result-id
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          finetune     = finetunes_get_result        " ABAP Ready Fine Tunes GET operation result
          error        = error                       " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** Get Events from a Fine Tune Job **********************
* FineTunes - Get Events
* As a fine-tune job progresses, there are events logged at each of key stages.
* These events indicate progress and current stage
* Get Events of a fine tune ID.
      sdk_instance->finetunes( )->get_events(
        EXPORTING
          finetuneid        = finetunes_create_result-id
        IMPORTING
          statuscode        = status_code         " Status Code
          statusreason      = status_reason       " HTTP status description
          json              = returnjson          " JSON String returned from AI Resource
          finetune_events   = finetunes_events    " ABAP Ready Fine Tunes Events List
          error             = error               " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** Cancel A Fine Tune Job ******************************
* Finetunes - Cancel
* Cancel the fine tuning job
      sdk_instance->finetunes( )->cancel(
        EXPORTING
          finetuneid         = finetunes_create_result-id                  " The identifier of the fine-tune job
        IMPORTING
          statuscode         = status_code              " Status Code
          statusreason       = status_reason            " Status Reason
          json               = returnjson               " JSON string with information about operation
          finetune_cancelled = finetunes_cancel_result  " ABAP Ready fine-tune cancellation details
          error              = error                    " ABAP Ready error details
      ).


********************************************************************************
      BREAK-POINT.

************************** Delete File and Fine Tune ********************************
*File / Fine Tunes - Delete
      sdk_instance->finetunes( )->delete(
        EXPORTING
          finetuneid   = finetunes_create_result-id                 " The identifier of the fine-tune job
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = delete_result                " JSON string with information about operation - Current AI engines does not provide any results. Hence, this will be blank.
          error        = error                        " ABAP Ready error details

      ).
*      CATCH zcx_peng_azoai_sdk_exception. " MSPENG:Azure Open AI ABAP SDK Exception

      sdk_instance->files( )->delete(
        EXPORTING
          fileid       = uploaded_file_info-id        " The identifier of the file.
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = delete_result                " JSON string with information about operation - Current AI engines does not provide any results. Hence, this will be blank.
          error        = error                        " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

    CATCH zcx_peng_azoai_sdk_exception INTO DATA(ex). " MSPENG:Azure Open AI ABAP SDK Exception
      MESSAGE ex TYPE 'I'.
  ENDTRY.
