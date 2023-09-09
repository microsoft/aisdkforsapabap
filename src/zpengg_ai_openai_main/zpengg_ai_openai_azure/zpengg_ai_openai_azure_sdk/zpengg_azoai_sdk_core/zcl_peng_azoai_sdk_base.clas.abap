"! <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK Base Class</p>
CLASS zcl_peng_azoai_sdk_base DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk .
  PROTECTED SECTION.
    DATA:
      _objconfig       TYPE REF TO zif_peng_azoai_sdk_config,
      _objhelper       TYPE REF TO zcl_peng_azoai_sdk_helper,
      _t_subcomponents TYPE zif_peng_azoai_sdk_typinternal=>tty_component_init_param.

    METHODS:
      "! <p class="shorttext synchronized" lang="en">Check if a component is safe to access</p>
      "! This method is called prior to accessing a sub-component object from the main SDK instance,
      "! and checks if its OK to access the component.
      "! @parameter component_type | <p class="shorttext synchronized" lang="en"></p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      _check_component_safety
        IMPORTING
          component_type TYPE string
        RAISING
          zcx_peng_azoai_sdk_exception .

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_base IMPLEMENTATION.


  METHOD zif_peng_azoai_sdk~initialize.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~initialize
* Created by     : Gopal Nair
* Date           : Mar 25, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Initialize the SDK (Internal use Only)
* This implementation will only be called if the sub-classes has not overridden the initialize method. The
* expectation, when working on SDK improvements, is for sub-classes to provide the actual implementation of
* initialization, and register the sub-class name with spinup routine that is triggered from factory class.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 25, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk~model.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~model
* Created by     : Gopal Nair
* Date           : Mar 25, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation of SDK base class will only be triggered if sub-classes have not implemented the
* retriever method. This may be because, its either still in development, or the underlying AI engine does not
* support the operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 25, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.
  METHOD zif_peng_azoai_sdk~deployments.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~deployments
* Created by     : Gopal Nair
* Date           : Mar 25, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation of SDK base class will only be triggered if sub-classes have not implemented the
* retriever method. This may be because, its either still in development, or the underlying AI engine does not
* support the operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 25, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~completions.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~completions
* Created by     : Gopal Nair
* Date           : Mar 25, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation of SDK base class will only be triggered if sub-classes have not implemented the
* retriever method. This may be because, its either still in development, or the underlying AI engine does not
* support the operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 25, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~files.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~files
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation of SDK base class will only be triggered if sub-classes have not implemented the
* retriever method. This may be because, its either still in development, or the underlying AI engine does not
* support the operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~finetunes.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : zif_peng_azoai_sdk~finetunes
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* This implementation of SDK base class will only be triggered if sub-classes have not implemented the
* retriever method. This may be because, its either still in development, or the underlying AI engine does not
* support the operation.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

  METHOD _check_component_safety.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_BASE
* Method         : _check_component_safety
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Check if a component is safe to access
*
* This method is called prior to accessing a sub-component object from the main SDK instance, and checks if
* its OK to access the component.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
* Sep 7, 2023 // Gopal Nair // Adjusted message emitted during safety check.
*****************************************************************************************************************

*   If the component line does not exist (which is from config layer), then, the component use is not permitted
*   due to version or environment restriction. Issue an appropriate exception.
    IF NOT line_exists( _t_subcomponents[ component_type = component_type ] ).
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid   = zcx_peng_azoai_sdk_exception=>not_impl_for_version
          iv_attr1 = |{ component_type }|.
    ENDIF.

*   If the component line exists, BUT, an instance does not exist, then it is because the component use is not
*   permitted due to enterprise control. Issue an appropriate exception here.
    IF _t_subcomponents[ component_type = component_type ]-component_instance IS INITIAL.
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid   = zcx_peng_azoai_sdk_exception=>component_use_not_permitted
          iv_attr1 = |{ component_type }|.
    ENDIF.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~chat_completions.
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~embeddings.
    _objhelper->raise_feature_notimpl_ex( ).
  ENDMETHOD.

ENDCLASS.
