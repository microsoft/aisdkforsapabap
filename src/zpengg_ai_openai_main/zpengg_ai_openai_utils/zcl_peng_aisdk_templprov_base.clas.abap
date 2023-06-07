CLASS zcl_peng_aisdk_templprov_base DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_aisdk_endpt_provider .
  PROTECTED SECTION.
    DATA:
      _version                TYPE string,
      _additional_init_params TYPE tihttpnvp,
      _t_endpoint_dictionary  TYPE zif_peng_azoai_sdk_typinternal=>tty_endpoint_url_info.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_aisdk_templprov_base IMPLEMENTATION.
  METHOD zif_peng_aisdk_endpt_provider~get_endpoint_template.
*****************************************************************************************************************
* Class          : ZCL_PENG_AISDK_TEMPLPROV_BASE
* Method         : zif_peng_aisdk_endpt_provider~get_endpoint_template
* Created by     : Gopal Nair
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the URL end point for a specific Component/Operation
* This method returns the specific end point URL for an operation on an AI engine.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************

*   Check if the component type + operation combo has an access URL available. If not, raise exception and exit.

    IF line_exists( _t_endpoint_dictionary[ version = _version component_type = component operation = operation ] ).
      endpoint_template = _t_endpoint_dictionary[ version = _version component_type = component operation = operation ]-access_url.
    ELSE.
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid = zcx_peng_azoai_sdk_exception=>not_implemented.

    ENDIF.
  ENDMETHOD.

  METHOD zif_peng_aisdk_endpt_provider~initialize.
*****************************************************************************************************************
* Class          : ZCL_PENG_AISDK_TEMPLPROV_BASE
* Method         : zif_peng_aisdk_endpt_provider~initialize
* Created by     : GONAIR (Gopal Nair)
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Initialize the URL provider
* This method is called by AI SDK core to initialize the URL provider. It passes in a version ID.
* The version may/maynot play a role in the URL end point, but its there to use.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
    _version = api_version.
    _additional_init_params = additional_params.
  ENDMETHOD.

ENDCLASS.
