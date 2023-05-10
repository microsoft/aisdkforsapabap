CLASS zcl_peng_azoai_sdk_deploy_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_comp_deploy.
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_deploy_base IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment.

  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_comp_deploy~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_DEPLOY_BASE
* Method         : zif_peng_azoai_sdk_comp_deploy~get
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_deploy~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_DEPLOY_BASE
* Method         : zif_peng_azoai_sdk_comp_deploy~list
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.
  METHOD zif_peng_azoai_sdk_comp_deploy~create.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_DEPLOY_BASE
* Method         : zif_peng_azoai_sdk_comp_deploy~create
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_comp_deploy~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_DEPLOY_BASE
* Method         : zif_peng_azoai_sdk_comp_deploy~delete
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation will only be triggered if sub-classes did not override it.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _not_implemented( ).
  ENDMETHOD.

ENDCLASS.
