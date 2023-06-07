CLASS zcl_peng_azoai_sdk_v1_model DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_model_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      zif_peng_azoai_sdk_comp_model~get       REDEFINITION,
      zif_peng_azoai_sdk_comp_model~list      REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_peng_azoai_sdk_v1_model IMPLEMENTATION.


  METHOD zif_peng_azoai_sdk_comp_model~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_MODEL
* Method         : zif_peng_azoai_sdk_comp_model~get
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Get details of a single model.
*
* Get details of a specific model, as specified in model ID parameter.
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

    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-get
                                                                                         )  "'{endpoint}/openai/models/{model-id}?api-version={version}'
        ivobj_config           = _objconfig
        ivt_templatecomponents = VALUE #(  ( name = zif_peng_azoai_sdk_uripatterns=>template_ids-modelid value = iv_modelid ) ) "model ID.
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
        ov_statuscode     = ov_statuscode
        ov_statusdescr    = ov_statusreason
        ov_jsonstring     = ov_json
      CHANGING
        iov_result        = ov_model
        iov_error         = ov_error
    ).

  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_model~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_MODEL
* Method         : zif_peng_azoai_sdk_comp_model~list
* Created by     : Gopal Nair
* Date           : Apr 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* List all models available
*
* Provides a list of all models available for deployment.
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

    _objsdkhelper->get_httpobjs_from_uripattern(
      EXPORTING
        uri_pattern            = _objconfig->get_accesspoint_provider( )->get_urltemplate(
                                                                                            component = _component_type
                                                                                            operation = zif_peng_azoai_sdk_constants=>c_component_operations-list
                                                                                         )  "'{endpoint}/openai/models/{model-id}?api-version={version}'
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
        ov_statuscode     = ov_statuscode
        ov_statusdescr    = ov_statusreason
        ov_jsonstring     = ov_json
      CHANGING
        iov_result        = ov_model
        iov_error         = ov_error
    ).


  ENDMETHOD.
ENDCLASS.
