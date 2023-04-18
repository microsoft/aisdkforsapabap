CLASS zcl_peng_azoai_sdk_model_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_comp_model .

    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_peng_azoai_sdk_model_base IMPLEMENTATION.

  METHOD constructor.
    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-model. "Model Component.
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_model~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_MODEL_BASE
* Method         : zif_peng_azoai_sdk_comp_model~get
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_model~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_MODEL_BASE
* Method         : zif_peng_azoai_sdk_comp_model~list
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.
ENDCLASS.
