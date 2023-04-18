CLASS zcl_peng_azoai_sdk_file_base DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_component
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_comp_files.
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_file_base IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    _component_type = zif_peng_azoai_sdk_constants=>c_component_type-file.
  ENDMETHOD.
  METHOD zif_peng_azoai_sdk_comp_files~delete.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~delete
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

  METHOD zif_peng_azoai_sdk_comp_files~get.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~get
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

  METHOD zif_peng_azoai_sdk_comp_files~get_content.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~get_content
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

  METHOD zif_peng_azoai_sdk_comp_files~import.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~import
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

  METHOD zif_peng_azoai_sdk_comp_files~list.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~list
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

  METHOD zif_peng_azoai_sdk_comp_files~upload.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FILE_BASE
* Method         : zif_peng_azoai_sdk_comp_files~upload
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
