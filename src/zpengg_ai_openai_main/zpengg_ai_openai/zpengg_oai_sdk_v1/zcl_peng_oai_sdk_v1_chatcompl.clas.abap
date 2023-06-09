CLASS zcl_peng_oai_sdk_v1_chatcompl DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_ai_sdk_chatcompl_base
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS zif_peng_ai_sdk_comp_chatcompl~create REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_oai_sdk_v1_chatcompl IMPLEMENTATION.
  METHOD zif_peng_ai_sdk_comp_chatcompl~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AI_SDK_V1_CHATCOMPLET
* Method         : zif_peng_ai_sdk_comp_chatcompl~create
* Created by     : GONAIR (Gopal Nair)
* Date           : June 9, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Performs a Chat completion based on prompts and other parameters.
*
* A Completion operation is about asking the AI engine something, and getting a response. The asking part of this
* interaction is called "prompts". Prompt Engineering is used to create prompts which will guide the AI engine to
* understand exactly what you are asking for, and respond meaningfully for the context of the question.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* June 9, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
    TYPES: BEGIN OF ty_oai_chatcompletioninput,
             model TYPE string.
             INCLUDE TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_input.
           TYPES: END OF ty_oai_chatcompletioninput.


    DATA:
        l_chatcompletions_create TYPE ty_oai_chatcompletioninput.

*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-create
    ).

    MOVE-CORRESPONDING prompts TO l_chatcompletions_create.


*   If there are no prompts entered by the user, then put in 1 entry with empty string.
    IF l_chatcompletions_create-messages[] IS INITIAL.
      RETURN.
    ENDIF.

    l_chatcompletions_create-model = deploymentid.

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-create
                                                                                         )   "{endpoint}/openai/deployments/{deployment-id}/chat/completions?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).
    DATA(post_data) = to_lower( /ui2/cl_json=>serialize( data = l_chatcompletions_create compress = /ui2/cl_json=>c_bool-true ) ) .
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
