CLASS zcl_peng_azoai_sdk_v1_file DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_file_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      zif_peng_azoai_sdk_comp_files~delete REDEFINITION,
      zif_peng_azoai_sdk_comp_files~get REDEFINITION,
      zif_peng_azoai_sdk_comp_files~get_content REDEFINITION,
      zif_peng_azoai_sdk_comp_files~import REDEFINITION,
      zif_peng_azoai_sdk_comp_files~list REDEFINITION,
      zif_peng_azoai_sdk_comp_files~upload REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_v1_file IMPLEMENTATION.
  METHOD zif_peng_azoai_sdk_comp_files~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~delete
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Deletes the file
*
* Deletes the file with the given file-id. Deletion is also allowed if a file was used, e.g., as training
* file in a fine-tune job.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    DATA:
        dummy TYPE string.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-delete
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete
                                                                                         )   "'{endpoint}/openai/files/{file-id}?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-fileid value = fileid  ) ) "File ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

    lo_http_rest->if_rest_client~delete( ).

*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = json
      CHANGING
        iov_result        = dummy
        iov_error         = error
    ).


  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_files~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~get
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets details for a single file
*
* Gets details for a single file specified by the given file-id including status, size, purpose, etc.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-get
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-get
                                                                                         )   "'{endpoint}/openai/files/{file-id}?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-fileid value = fileid  ) ) "File ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

    lo_http_rest->if_rest_client~get( ).

*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = json
      CHANGING
        iov_result        = file
        iov_error         = error
    ).

  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_files~get_content.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~get_content
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the content of the file specified by the given file-id
*
* Gets the content of the file specified by the given file-id. Files can be user uploaded content or generated
* by the service like result metrics of a fine-tune job.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    DATA:
        dummy TYPE string.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-get_content
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_content
                                                                                         )   "'{endpoint}/openai/files/{file-id}/content?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-fileid value = fileid  ) ) "File ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

    lo_http_rest->if_rest_client~get( ).

*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = content
      CHANGING
        iov_result        = dummy
        iov_error         = error
    ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_files~import.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~import
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates new file by importing data from a provided url
*
* Creates a new file entity by importing data from a provided url. Uploaded files can, for example, be used for
* training or evaluating fine-tuned models.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    DATA:
        l_import TYPE zif_peng_azoai_sdk_types=>ty_file_import.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-import
    ).

    l_import = import_info.
    IF l_import-purpose IS INITIAL.
      l_import-purpose = zif_peng_azoai_sdk_constants=>c_filepurpose-finetune.
    ENDIF.

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-import
                                                                                         )   "'{endpoint}/openai/files/import?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).
    DATA(post_data) = to_lower( /ui2/cl_json=>serialize( data = l_import ) ) .
    lo_request->set_string_data( iv_data = post_data ).

*   Trigger the network operation.
    lo_http_rest->if_rest_client~post( io_entity = lo_request ).


*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = json
      CHANGING
        iov_result        = file
        iov_error         = error
    ).

  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_files~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~list
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets a list of all files
*
* Gets a list of all files. These include user uploaded content like files with purpose "fine-tune" for training
* or validation of fine-tunes models as well as files that are generated by the service such as "fine-tune-results"
* which contains various metrics for the corresponding fine-tune job.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-list
    ).


* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-list
                                                                                         )   "'{endpoint}/openai/files?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

    lo_http_rest->if_rest_client~get( ).

*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = json
      CHANGING
        iov_result        = filelist
        iov_error         = error
    ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_files~upload.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FILE
* Method         : zif_peng_azoai_sdk_comp_files~upload
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates a new file entity by uploading data
*
* Creates a new file entity by uploading data from SAP Application Server. Uploaded files can, for example,
* be used for training or evaluating fine-tuned models.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

    DATA:
        post_data TYPE string.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-upload
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-upload
                                                                                         )
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Generate a boundary literal.
    TRY.
        DATA(guid) = cl_system_uuid=>if_system_uuid_static~create_uuid_x16( ).
      CATCH cx_root.
        guid = '---GopalNair'.
    ENDTRY.
    DATA(boundary) =  replace( val = zif_peng_azoai_sdk_constants=>c_file_upload_boundary sub = '{guid}' with = CONV string( guid )  ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = |multipart/form-data; boundary={ boundary }| ).


*   Multipart/form0data specification (RFC2388) : https://www.ietf.org/rfc/rfc2388.txt
    CLEAR post_data.
    post_data = |--{ boundary }{ cl_abap_char_utilities=>cr_lf }|.
    post_data = |{ post_data }Content-Disposition: form-data; name="file"; filename={ filename }{ cl_abap_char_utilities=>cr_lf }|.
    post_data = |{ post_data }Content-Type: text/jsonl{ cl_abap_char_utilities=>cr_lf }{ cl_abap_char_utilities=>cr_lf }|.
    LOOP AT jsonldata ASSIGNING FIELD-SYMBOL(<fs_training_data>).
      post_data = |{ post_data }\{"prompt":"{ <fs_training_data>-prompt }", "completion":"{ <fs_training_data>-completion }"\}{ cl_abap_char_utilities=>cr_lf }|.
    ENDLOOP.

    post_data = |{ post_data }--{ boundary }{ cl_abap_char_utilities=>cr_lf }|.
    post_data = |{ post_data }Content-Disposition: form-data; name="purpose"{ cl_abap_char_utilities=>cr_lf }{ cl_abap_char_utilities=>cr_lf }|.
    post_data = |{ post_data }fine-tune{ cl_abap_char_utilities=>cr_lf }|.
    post_data = |{ post_data }--{ boundary }--|.

*   Set the data into request body.
    lo_request->set_string_data( iv_data = post_data ).

*   Trigger the network operation.
    lo_http_rest->if_rest_client~post( io_entity = lo_request ).


*   Get Status, results and error if any from helper layer.
    _objsdkhelper->do_receive(
      EXPORTING
        ivobj_http_client = lo_http
        ivobj_http_rest   = lo_http_rest
      IMPORTING
        ov_statuscode     = statuscode
        ov_statusdescr    = statusreason
        ov_jsonstring     = json
      CHANGING
        iov_result        = file
        iov_error         = error
    ).

  ENDMETHOD.

ENDCLASS.
