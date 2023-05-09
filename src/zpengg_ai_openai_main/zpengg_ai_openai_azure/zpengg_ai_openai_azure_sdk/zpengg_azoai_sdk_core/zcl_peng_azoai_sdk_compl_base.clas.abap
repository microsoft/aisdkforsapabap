CLASS zcl_peng_azoai_sdk_compl_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_comp_compl.
    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_compl_base IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions.
  ENDMETHOD.



  METHOD zif_peng_azoai_sdk_comp_compl~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_COMPL_BASE
* Method         : zif_peng_azoai_sdk_comp_compl~create
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This method implementation will only be triggered if sub-classes did not override the create method. This
* can happen if the underlying AI engine does not support completion create operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.

ENDCLASS.
