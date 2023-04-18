CLASS zcl_peng_azoai_sdk_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en">Returns an instance of AZOAI SDK Factory</p>
    "!
    "! @parameter r_result | <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS get_instance
      RETURNING
        VALUE(r_result) TYPE REF TO zcl_peng_azoai_sdk_factory.

    METHODS:
      "! <p class="shorttext synchronized" lang="en">INTERNAL ONLY - Constructor</p>
      "! The Factory instance can only be created using the method : get_instance(), which inturn
      "! triggers the constructor.
      constructor,
      "! <p class="shorttext synchronized" lang="en">Returns an SDK instance appropriate for the version</p>
      "! Azure Open AI is rapidly evolving with versions being added. For a version, this method instantiates
      "! the SDK and returns the instance.
      "! @parameter api_version | <p class="shorttext synchronized" lang="en">API Version</p>
      "! @parameter api_base | <p class="shorttext synchronized" lang="en">API Base URL</p>
      "! @parameter api_type | <p class="shorttext synchronized" lang="en">API Type</p>
      "! @parameter api_key | <p class="shorttext synchronized" lang="en">API Key</p>
      "! @parameter sdkprofile | <p class="shorttext synchronized" lang="en">SDK Profile ID as provided by organization SDK administrator</p>
      "! @parameter params | <p class="shorttext synchronized" lang="en">Additional parameters as specified by organization policies</p>
      "! @parameter sdk | <p class="shorttext synchronized" lang="en">Instance of SDK</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">Exception if SDK creation failed.</p>
      get_sdk
        IMPORTING
                  api_version TYPE string
                  api_base    TYPE string
                  api_type    TYPE string
                  api_key     TYPE string
                  sdkprofile  TYPE zde_azoaisdk_profileid DEFAULT 'DEFAULT'
                  params      TYPE tihttpnvp OPTIONAL
        RETURNING VALUE(sdk)  TYPE REF TO zif_peng_azoai_sdk
        RAISING
                  zcx_peng_azoai_sdk_exception.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
        _objhelper TYPE REF TO zcl_peng_azoai_sdk_helper.
ENDCLASS.



CLASS zcl_peng_azoai_sdk_factory IMPLEMENTATION.

  METHOD constructor.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FACTORY
* Method         : constructor
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* INTERNAL ONLY - Constructor
*
* The Factory instance can only be created using the method : get_instance(), which inturn triggers the constructor.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _objhelper = zcl_peng_azoai_sdk_helper=>get_instance( ).
  ENDMETHOD.

  METHOD get_instance.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FACTORY
* Method         : get_instance
* Created by     : Gopal Nair
* Date           : Mar 22, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of AZOAI SDK Factory
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 22, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    CREATE OBJECT r_result.

  ENDMETHOD.
  METHOD get_sdk.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_FACTORY
* Method         : get_sdk
* Created by     : Gopal Nair
* Date           : Mar 22, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an SDK instance appropriate for the version
* Azure Open AI is rapidly evolving with versions being added. For a version, this method instantiates the SDK
* and returns the instance.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 22, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    DATA:
        objconfig TYPE REF TO zif_peng_azoai_sdk_config.

*   Get component names for the requested version. If the version is not supported for the specific api type, an exception is raised.
*   Here, we are only interested in Core Components, namely - Config, and Main SDK. This is to seed the spin up process.
*   The actual sub-components, like Model..etc, will be spun up within SDK instantiation/initialization.
    DATA(components) = _objhelper->get_components_for_version(
                                                                api_type = api_type
                                                                api_version = api_version
                                                                filter = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                                                ).

*  Here, we are not really going to check if an instance is available, since this point is where pretty much everything is spinning up.
*  Hence, we (sort of) break the rule of - if an instance is present in the component list, then use it - Rather, we blindly create new instance.
*  In future, we may modify this to allow injection of components.
    DATA(config_class_name) = to_upper( components[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-config ]-component_class_name ) .
    CREATE OBJECT objconfig TYPE (config_class_name).
    objconfig->initialize_config(
      EXPORTING
        api_version = api_version " API Version
        api_base    = api_base    " API Base
        api_type    = api_type    " API Type
        api_key     = api_key     " API Key
        sdkprofile  = sdkprofile  "SDK Run Profile
        init_params = params      "Additional initialization parameters - To be used for organization specific logic for central controlling.
    ).

*   Check with central control if SDK instantiation is permitted. if not permitted, an exception will be raised by enterprise specific implementation
*   which will then boil up to invoker.
    objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~start_sdk(
      EXPORTING
        api_version = api_version              " API Version
        api_base    = api_base                 " API Base URL
        api_type    = api_type                 " API Type
        sdkprofile  = objconfig->get_runprofile( )
        init_params = params                 " Other Initialization Parameters
    ).



*   Create an instance of SDK.
    DATA(sdk_class_name) = to_upper( components[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk ]-component_class_name ).
    CREATE OBJECT sdk TYPE (sdk_class_name).
    sdk->initialize( config = objconfig ).


  ENDMETHOD.

ENDCLASS.
