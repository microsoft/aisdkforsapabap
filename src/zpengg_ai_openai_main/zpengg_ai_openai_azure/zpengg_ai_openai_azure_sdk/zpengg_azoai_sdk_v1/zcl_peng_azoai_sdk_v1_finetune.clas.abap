CLASS zcl_peng_azoai_sdk_v1_finetune DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_fintun_base
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      zif_peng_azoai_sdk_comp_fintun~cancel     REDEFINITION,
      zif_peng_azoai_sdk_comp_fintun~create     REDEFINITION,
      zif_peng_azoai_sdk_comp_fintun~delete     REDEFINITION,
      zif_peng_azoai_sdk_comp_fintun~get        REDEFINITION,
      zif_peng_azoai_sdk_comp_fintun~get_events REDEFINITION,
      zif_peng_azoai_sdk_comp_fintun~list       REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PENG_AZOAI_SDK_V1_FINETUNE IMPLEMENTATION.


  METHOD zif_peng_azoai_sdk_comp_fintun~cancel.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~cancel
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Cancels the processing of the fine-tune job
*
* Cancels the processing of the fine-tune job specified by the given fine-tune-id.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-cancel
    ).

* Get the actual URL and HTTP communication objects from helper layer
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-cancel
                                                                                         )   "{endpoint}/openai/fine-tunes/{fine-tune-id}/cancel?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-finetuneid value = finetuneid  ) ) "Fine Tune ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).
    DATA(post_data) = || .
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
        iov_result        =  finetune_cancelled
        iov_error         = error
    ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_fintun~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~create
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates a job that fine-tunes a specified model
*
* Creates a job that fine-tunes a specified model from a given training file. Response includes details of the
* enqueued job including job status and hyper parameters. The name of the fine-tuned model is added to the response
* once complete.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-create
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-create
                                                                                         )   "'{endpoint}/openai/fine-tunes?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).

    DATA(post_data) = /ui2/cl_json=>serialize( data = finetune_create compress = /ui2/cl_json=>c_bool-true pretty_name = /ui2/cl_json=>pretty_mode-low_case ).
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
        iov_result        = finetune
        iov_error         = error
    ).

  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_fintun~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~delete
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Deletes the fine-tune job
*
* Deletes the fine-tune job specified by the given fine-tune-id.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
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
                                                                                         )   "'{endpoint}/openai/fine-tunes/{fine-tune-id}?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-finetuneid value = finetuneid   ) ) "Fine Tune ID.
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


  METHOD zif_peng_azoai_sdk_comp_fintun~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~get
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets details for a single fine-tune job
*
* Gets details for a single fine-tune job specified by the given fine-tune-id. The details contain the base model,
* training and validation files, hyper parameters, time stamps, status and events. Events are created when the job
* status changes, e.g. running or complete, and when results are uploaded.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
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
                                                                                         )   "'{endpoint}/openai/fine-tunes/{fine-tune-id}?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-finetuneid value = finetuneid  ) ) "Fine Tune ID.
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
        iov_result        = finetune
        iov_error         = error
    ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_fintun~get_events.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~get_events
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the events for the fine-tune job
*
* Gets the events for the fine-tune job specified by the given fine-tune-id. Events are created when the job status
* changes, e.g. running or complete, and when results are uploaded.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 7, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-get_events
    ).

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_events
                                                                                         )   "'{endpoint}/openai/fine-tunes/{fine-tune-id}/events?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-finetuneid value = finetuneid  ) ) "Fine Tune ID.
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
        iov_result        = finetune_events
        iov_error         = error
    ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_fintun~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_FINETUNE
* Method         : zif_peng_azoai_sdk_comp_fintun~list
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets a list of all fine-tune jobs
*
* Gets a list of all fine-tune jobs owned by the Azure OpenAI resource. The details that are returned for each
* fine-tune job contain besides its identifier the base model, training and validation files, hyper parameters,
* time stamps, status and events. Events are created when the job status changes, e.g. running or complete, and
* when results are uploaded.
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
                                                                                         )   "'{endpoint}/openai/fine-tunes?api-version={version}'
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
        iov_result        = finetune_list
        iov_error         = error
    ).
  ENDMETHOD.
ENDCLASS.
