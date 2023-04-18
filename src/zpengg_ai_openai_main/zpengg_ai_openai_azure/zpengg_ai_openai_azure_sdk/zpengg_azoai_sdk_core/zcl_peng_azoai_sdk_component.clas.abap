CLASS zcl_peng_azoai_sdk_component DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_component .
  PROTECTED SECTION.
    DATA:
      _objsdkhelper TYPE REF TO zcl_peng_azoai_sdk_helper.

    DATA:
      _objconfig      TYPE REF TO zif_peng_azoai_sdk_config,
      _objsdk         TYPE REF TO zif_peng_azoai_sdk,
      _component_type TYPE string.    " see : zif_peng_azoai_sdk_constants=>c_component_type

    METHODS:
      "! <p class="shorttext synchronized" lang="en">Raises a Not-Implemented exception.</p>
      "!
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      _not_implemented FINAL
        RAISING
          zcx_peng_azoai_sdk_exception.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_peng_azoai_sdk_component IMPLEMENTATION.
  METHOD zif_peng_azoai_sdk_component~initialize_component.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_COMPONENT
* Method         : zif_peng_azoai_sdk_component~initialize_component
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* INTERNAL USE ONLY
*
* Initializes an SDK component, and registered sub-objects into the instance.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    TRY.
*  Initialize the component. This is called from SDK during spinning up.
*   Set up helper
        _objsdkhelper   =  zcl_peng_azoai_sdk_helper=>get_instance( ).
*   Set up config layer.
        _objconfig      ?=  component_set[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-config ]-component_instance.
*   Set up loop back to SDK parent object.
        _objsdk         ?=  component_set[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk ]-component_instance.

      CATCH cx_root.
        RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
          EXPORTING
            textid = zcx_peng_azoai_sdk_exception=>component_init_failed.

    ENDTRY.
  ENDMETHOD.

  METHOD _not_implemented.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_COMPONENT
* Method         : _not_implemented
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Raises a Not-Implemented exception.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    IF _objsdkhelper IS INITIAL.
      _objsdkhelper = zcl_peng_azoai_sdk_helper=>get_instance( ).
    ENDIF.
*   Delegate exception generation to helper.
    _objsdkhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

ENDCLASS.
