CLASS zcl_peng_azoai_sdk_fintun_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_comp_fintun .
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_fintun_base IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning.
  ENDMETHOD.
  METHOD zif_peng_azoai_sdk_comp_fintun~cancel.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~cancel
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

  METHOD zif_peng_azoai_sdk_comp_fintun~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~create
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

  METHOD zif_peng_azoai_sdk_comp_fintun~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~delete
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

  METHOD zif_peng_azoai_sdk_comp_fintun~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~get
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

  METHOD zif_peng_azoai_sdk_comp_fintun~get_events.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~get_events
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

  METHOD zif_peng_azoai_sdk_comp_fintun~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FINTUN_BASE
* Method         : zif_peng_azoai_sdk_comp_fintun~list
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
