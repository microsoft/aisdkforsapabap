CLASS zcl_peng_azoai_sdk_v1_deploy DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_deploy_base
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      zif_peng_azoai_sdk_comp_deploy~get      REDEFINITION,
      zif_peng_azoai_sdk_comp_deploy~list     REDEFINITION,
      zif_peng_azoai_sdk_comp_deploy~create   REDEFINITION,
      zif_peng_azoai_sdk_comp_deploy~delete   REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_v1_deploy IMPLEMENTATION.

  METHOD zif_peng_azoai_sdk_comp_deploy~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_DEPLOY
* Method         : zif_peng_azoai_sdk_comp_deploy~get
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets a specific Deployment
*
* Returns deployment details specified by deploymentid parameter. An error is returned, if a deployment with the
* id is not found, or could not be retrived.
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
                                                                                         )   "{endpoint}/openai/deployments/{deployment-id}?api-version={version}
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-deploymentid value = deploymentid ) ) "Deployment ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Perform the communication operation (HTTP GET).
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
        iov_result        = deployment
        iov_error         = error
    ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_deploy~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_DEPLOY
* Method         : zif_peng_azoai_sdk_comp_deploy~list
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* List all deployments
*
* Returns a list of all deployments.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
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
                                                                                         )   "{endpoint}/openai/deployments?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).


*   Perform the communication operation (HTTP GET).
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
        iov_result        = deployments
        iov_error         = error
    ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_deploy~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_DEPLOY
* Method         : zif_peng_azoai_sdk_comp_deploy~create
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates a new deployment based on an existing model.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the operation is permitted for the run profile by asking profile handler.
    _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~perform_operation(
      EXPORTING
        component_type = _component_type
        operation      = zif_peng_azoai_sdk_constants=>c_component_operations-create
    ).

    DATA:
        l_deploy_create TYPE zif_peng_azoai_sdk_types=>ty_deployments_create.

    l_deploy_create = iv_deployment_info.

*   Adjust default values if needed.
    IF l_deploy_create-scale_settings-scale_type IS INITIAL.
      l_deploy_create-scale_settings-scale_type = 'standard'.
    ENDIF.

* Get the actual URL and HTTP communication objects from helper layer.
    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-create
                                                                                         )   "'{endpoint}/openai/deployments?api-version={version}'
        ivobj_config           = _objconfig
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Prepare the body and set it
    DATA(lo_request) = lo_http_rest->if_rest_client~create_request_entity( ).
    lo_request->set_content_type( iv_media_type = 'application/json' ).
    DATA(post_data) = to_lower( /ui2/cl_json=>serialize( data = l_deploy_create ) ) .
    lo_request->set_string_data( iv_data = post_data ).

*   Trigger the POST request.
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
        iov_result        = deployment
        iov_error         = error
    ).


  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_deploy~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_DEPLOY
* Method         : zif_peng_azoai_sdk_comp_deploy~delete
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Deletes an existing deployment, as specified by the deployment ID parameter.
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
                                                                                         )   "{endpoint}/openai/deployments/{deployment-id}?api-version={version}
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-deploymentid value = deploymentid ) ) "Deployment ID.
      IMPORTING
        ov_url                 = DATA(actual_url)
        ovobj_http             = DATA(lo_http)
        ovobj_http_rest        = DATA(lo_http_rest)
    ).

*   Perform the communication operation (HTTP DELETE).
    lo_http_rest->if_rest_client~delete( ).

*   For Delete operation, there is no return - so pass in dummy for it.
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


ENDCLASS.
