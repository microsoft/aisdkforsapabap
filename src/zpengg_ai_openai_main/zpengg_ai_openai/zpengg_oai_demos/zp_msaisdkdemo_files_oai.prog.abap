*&---------------------------------------------------------------------*
*& Report ZP_MSAISDKDEMO_FILES_OAI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_msaisdkdemo_files_oai.
INCLUDE zp_msaisdkdemo_params_top_oai.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )


DATA:
  upload_data        TYPE zif_peng_azoai_sdk_types=>tty_file_upload,
  import_location    TYPE zif_peng_azoai_sdk_types=>ty_file_import,
  uploaded_file_info TYPE zif_peng_azoai_sdk_types=>ty_file_get,
  imported_file_info TYPE zif_peng_azoai_sdk_types=>ty_file_get,
  file_list          TYPE zif_peng_azoai_sdk_types=>ty_file_list,
  get_file_info      TYPE zif_peng_azoai_sdk_types=>ty_file_get,
  file_content       TYPE string,
  delete_result      TYPE string.

START-OF-SELECTION.

  TRY.
* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-openai
                                                            api_key     = p_key
                                                          ).

************************** Creating a New File through Upload ******************
* File - Upload
* The file capability is primarily used for preparing training data that is required
* for fine-tunes. Fine Tunes allow creation of custom models trained with enterprise
* specific data for targetted AI capabilities.
*
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
********************************************************************************
      BREAK-POINT.


************************** List All Files  *************************************
* File - List
* Retrieves the list of files currently available. Open file_list variable to see
* the previous 2 operation files listed.
*
* The STATUS field in file_list shows if the file upload was successful/running/failed.
* NOTE : A file can be used for fine-tuning only after the status shows "succeeded". There is a
*        delay between uploading, and the file is consumed by AI portal to get it ready for fine-tuning.
*        Developers should have their code to check the file status before using it for fine-tuning.
      sdk_instance->files( )->list(
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          filelist     = file_list                    " ABAP Ready list of files
          error        = error                        " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** Get details of a specific file **********************
* File - Get
* Gets information about the file that was uploaded previously. The fileid parameter
* specifies which file to get information for.

* Get file details that was created with upload.
      sdk_instance->files( )->get(
        EXPORTING
          fileid       = uploaded_file_info-id               " The identifier of the file.
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          file         = get_file_info                " ABAP Ready File Information
          error        = error                        " ABAP Ready error details
      ).


********************************************************************************
      BREAK-POINT.

************************** Get contents of a specific file *********************
* File - Get Content
* Gets content of the file that was uploaded previously. The fileid parameter
* specifies which file to get contents for. "file_content" variable will hold
* the contents of the file.

* Get file details that was created with upload.
      sdk_instance->files( )->get_content(
        EXPORTING
          fileid       = uploaded_file_info-id        " The identifier of the file.
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          content      = file_content                 " Content of the file
          error        = error                        " ABAP Ready error details
      ).

********************************************************************************
      BREAK-POINT.

************************** Delete specific File ********************************
*File - Delete
* We are now going to delete the files that were uploaded, and imported. Note that
* even though the import failed, it still created a file object in AI portal. Its
* worth noting that the term "file" in this context represents a data object, as
* opposed to a "file" we are used to in our computers. This data object can either
* have "successful" status, or can have a "failed" status.

      sdk_instance->files( )->delete(
        EXPORTING
          fileid       = uploaded_file_info-id        " The identifier of the file.
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = delete_result                " JSON string with information about operation - Current AI engines does not provide any results. Hence, this will be blank.
          error        = error                        " ABAP Ready error details
      ).

      sdk_instance->files( )->delete(
        EXPORTING
          fileid       = imported_file_info-id        " The identifier of the file.
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
