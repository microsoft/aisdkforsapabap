INTERFACE zif_peng_azoai_centralcontrol
  PUBLIC .

  METHODS:
    "! <p class="shorttext synchronized" lang="en">Check if SDK use is permitted</p>
    "! Fired before SDK is initialized. To prevent SDK usage, raise the exception.
    "! <br/><br/>
    "! <strong>Note</strong>: This will be the first call to this handler class, and the only
    "! time the api parameters and initialization parameter (init_params) will be passed in.
    "! If that information is required for further checks (eg: initialize_sdkcomponent, perform_operation)
    "! the implementation of the handler must put these values into an attribute of the object, so that
    "! it can be used later, since the instance of the handler used to call each of these methods remains
    "! the same.
    "! @parameter api_version | <p class="shorttext synchronized" lang="en">API Version</p>
    "! @parameter api_base | <p class="shorttext synchronized" lang="en">API Base URL</p>
    "! @parameter api_type | <p class="shorttext synchronized" lang="en">API Type</p>
    "! @parameter init_params | <p class="shorttext synchronized" lang="en">Other Initialization Parameters</p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    start_sdk
      IMPORTING
        api_version TYPE string
        api_base    TYPE string
        api_type    TYPE string
        sdkprofile  TYPE ztaisdkrunprofil
        init_params TYPE tihttpnvp
      RAISING
        zcx_peng_azoai_sdk_exception,

    "! <p class="shorttext synchronized" lang="en">Check if an SDK component is permitted</p>
    "!  This method is called prior to initializing a specific component of the SDK, such as a model, deployment,
    "! completions, file, finetuning, or embeddings. It takes in the component_type parameter,
    "! which specifies the type of component to be initialized. If the component initialization must not be
    "! performed, raise the zcx_peng_azoai_sdk_exception (or a sub-class of it) exception.
    "! <br/><br/>
    "! <strong>Note</strong>:If additional information (eg: API Type, or initialization parameters) are needed
    "! to make the determination, be sure to store away parameters passed during "start_sdk()" call into class attributes.
    "! @parameter component_type | <p class="shorttext synchronized" lang="en">Component Type</p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    initialize_sdkcomponent
      IMPORTING
        component_type TYPE string   "See zif_peng_azoai_sdk_constants=>c_component_identifiers --> MODEL / DEPLOYMENT / COMPLETIONS / FILE / FINETUNING / EMBEDDINGS
      RAISING
        zcx_peng_azoai_sdk_exception,

    "! <p class="shorttext synchronized" lang="en">Check if a specific operation on a component is permitted</p>
    "! This method is used to perform an operation on a specific component of the SDK. It takes in the component_type
    "! and operation parameters, which specify the type of component and the operation to be performed, respectively.
    "! If the operation should not be performed, raise the zcx_peng_azoai_sdk_exception (or sub-class of it) exception.
    "! <br/><br/>
    "! <strong>Note</strong>: This will be the first call to this handler class, and the only
    "! time the api parameters and initialization parameter (init_params) will be passed in.
    "! If that information is required for further checks (eg: initialize_sdkcomponent, perform_operation)
    "! the implementation of the handler must put these values into an attribute of the object, so that
    "! it can be used later, since the instance of the handler used to call each of these methods remains
    "! the same.
    "! @parameter component_type | <p class="shorttext synchronized" lang="en">Component Type</p>
    "! @parameter operation | <p class="shorttext synchronized" lang="en">Operation to be performed</p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    perform_operation
      IMPORTING
        component_type TYPE string
        operation      TYPE string
      RAISING
        zcx_peng_azoai_sdk_exception.



ENDINTERFACE.
