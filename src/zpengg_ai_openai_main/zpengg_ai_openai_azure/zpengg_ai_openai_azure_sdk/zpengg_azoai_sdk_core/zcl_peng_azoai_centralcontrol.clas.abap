CLASS zcl_peng_azoai_centralcontrol DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_centralcontrol .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_centralcontrol IMPLEMENTATION.
  METHOD zif_peng_azoai_centralcontrol~start_sdk.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_CENTRALCONTROL
* Method         : zif_peng_azoai_centralcontrol~start_sdk
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Check if SDK use is permitted
* Fired before SDK is initialized. To prevent SDK usage, raise the exception.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

  ENDMETHOD.

  METHOD zif_peng_azoai_centralcontrol~initialize_sdkcomponent.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_CENTRALCONTROL
* Method         : zif_peng_azoai_centralcontrol~initialize_sdkcomponent
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Check if an SDK component is permitted
*
* This method is called prior to initializing a specific component of the SDK, such as a model, deployment, completions,
* file, finetuning, or embeddings. It takes in the component_type parameter, which specifies the type of component to be
* initialized. If the component initialization must not be performed, raise the zcx_peng_azoai_sdk_exception (or a sub-class of it)
* exception.
*
* Note:If additional information (eg: API Type, or initialization parameters) are needed to make the determination, be
* sure to store away parameters passed during "start_sdk()" call into class attributes.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

  ENDMETHOD.

  METHOD zif_peng_azoai_centralcontrol~perform_operation.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_CENTRALCONTROL
* Method         : zif_peng_azoai_centralcontrol~perform_operation
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Check if a specific operation on a component is permitted
*
* This method is used to perform an operation on a specific component of the SDK. It takes in the component_type
* and operation parameters, which specify the type of component and the operation to be performed, respectively.
* If the operation should not be performed, raise the zcx_peng_azoai_sdk_exception (or sub-class of it) exception.
*
* Note: This will be the first call to this handler class, and the only time the api parameters and initialization
* parameter (init_params) will be passed in. If that information is required for further checks (eg: initialize_sdkcomponent,
* perform_operation) the implementation of the handler must put these values into an attribute of the object, so that
* it can be used later, since the instance of the handler used to call each of these methods remains the same.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

  ENDMETHOD.

ENDCLASS.
