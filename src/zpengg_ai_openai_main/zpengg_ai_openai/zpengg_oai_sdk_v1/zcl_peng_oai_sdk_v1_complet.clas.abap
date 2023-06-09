CLASS zcl_peng_oai_sdk_v1_complet DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_compl_base
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS zif_peng_azoai_sdk_comp_compl~create REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_oai_sdk_v1_complet IMPLEMENTATION.
  METHOD zif_peng_azoai_sdk_comp_compl~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_COMPLET
* Method         : zif_peng_azoai_sdk_comp_compl~create
* Created by     : Gopal Nair
* Date           : June 9, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Performs a completion based on prompts and other parameters.
*
* A Completion operation is about asking the AI engine something, and getting a response. The asking part of this
* interaction is called "prompts". Prompt Engineering is used to create prompts which will guide the AI engine to
* understand exactly what you are asking for, and respond meaningfully for the context of the question.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* June 9, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    TYPES: BEGIN OF ty_oai_completioninput,
             model TYPE string.
             INCLUDE TYPE zif_peng_azoai_sdk_types=>ty_completion_input.
           TYPES: END OF ty_oai_completioninput.


    DATA:
      l_completions_oai    TYPE ty_oai_completioninput.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-create
    ).

    MOVE-CORRESPONDING prompts TO l_completions_oai.


*    l_completions_create = prompts.

*   If there are no prompts entered by the user, then put in 1 entry with empty string.
    IF l_completions_oai-prompt[] IS INITIAL.
      RETURN.
    ENDIF.

*   Set a default max token count, if not set.
    IF l_completions_oai-max_tokens IS INITIAL.
      l_completions_oai-max_tokens = 16.
    ENDIF.

*   Set default number of responses as 1, if not set.
    IF l_completions_oai-n IS INITIAL.
      l_completions_oai-n = 1.
    ENDIF.

*   Set the user info of invoker. This is for mis-use prevention feature available in Azure Open AI.
    l_completions_oai-user = sy-uname.

*   Adjustment for Open AI format for completion.
    l_completions_oai-model = deploymentid.



* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-create
                                                                                         )
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).
    DATA(post_data) = /ui2/cl_json=>serialize( data     = l_completions_oai
                                               compress = abap_true
                                               pretty_name = /ui2/cl_json=>pretty_mode-low_case
                                             ) .
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
        iov_result        = response
        iov_error         = error
    ).


  ENDMETHOD.

ENDCLASS.
