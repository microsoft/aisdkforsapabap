CLASS zcl_peng_ai_sdk_chatcompl_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_ai_sdk_comp_chatcompl.
    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_ai_sdk_chatcompl_base IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions.
  ENDMETHOD.



  METHOD zif_peng_ai_sdk_comp_chatcompl~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AI_SDK_CHATCOMPL_BASE
* Method         : zif_peng_ai_sdk_comp_chatcompl~create
* Created by     : GONAIR (Gopal Nair)
* Date           : May 7, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This method implementation will only be triggered if sub-classes did not override the create method. This
* can happen if the underlying AI engine does not support completion create operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* May 7, 2023 // GONAIR // Initial Version
*****************************************************************************************************************

    _not_implemented( ).
  ENDMETHOD.

ENDCLASS.
