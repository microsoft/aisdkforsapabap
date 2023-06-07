INTERFACE zif_peng_azoai_sdk_config
  PUBLIC .


  "! <p class="shorttext synchronized" lang="en">Returns the Azure Open AI API Base URL</p>
  "!
  "! @parameter api_base                     | <p class="shorttext synchronized" lang="en">API Base URL</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK Exception</p>
  METHODS get_apibase
    RETURNING
      VALUE(api_base) TYPE string
    RAISING
      zcx_peng_azoai_sdk_exception .
  "! <p class="shorttext synchronized" lang="en">Returns the Azure Open AI API Version</p>
  "!
  "! @parameter api_version                  | <p class="shorttext synchronized" lang="en">API Version</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK Exception</p>
  METHODS get_apiversion
    RETURNING
      VALUE(api_version) TYPE string
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Returns the API Type</p>
  "!
  "! @parameter api_type | <p class="shorttext synchronized" lang="en">API Type</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_apitype
    RETURNING
      VALUE(api_type) TYPE string
    RAISING
      zcx_peng_azoai_sdk_exception .
  "! <p class="shorttext synchronized" lang="en">Returns the Authentication Header for Azure Open AI API</p>
  "!
  "! @parameter auth_header                  | <p class="shorttext synchronized" lang="en">Authorization Header</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK Exception</p>
  METHODS get_authheader
    RETURNING
      VALUE(auth_header) TYPE ihttpnvp
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Gets parameter value from addiitonal params set</p>
  "!
  "! @parameter param_name | <p class="shorttext synchronized" lang="en"></p>
  "! @parameter parm_value | <p class="shorttext synchronized" lang="en"></p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_single_parameter
    IMPORTING
      param_name        TYPE string
    RETURNING
      VALUE(parm_value) TYPE string
    RAISING
      zcx_peng_azoai_sdk_exception .


  "! <p class="shorttext synchronized" lang="en">Get all parameters for this working instance</p>
  "! Parameters are passed through factory, during initial SDK instance request. This method
  "! returns all the parameters thus passed. This will be used during call back for organization
  "! specific checks.
  "! @parameter param_tab | <p class="shorttext synchronized" lang="en"></p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_all_parameters
    RETURNING
      VALUE(param_tab) TYPE tihttpnvp
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Returns the current working run profile</p>
  "!
  "! @parameter run_profile | <p class="shorttext synchronized" lang="en"></p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_runprofile
    RETURNING
      VALUE(run_profile) TYPE ztaisdkrunprofil
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Returns an instance of Run profile handler</p>
  "!
  "! @parameter profile_handler | <p class="shorttext synchronized" lang="en"></p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_runprofile_handler
    RETURNING
      VALUE(profile_handler) TYPE REF TO zcl_peng_azoai_centralcontrol
    RAISING
      zcx_peng_azoai_sdk_exception .


  "! <p class="shorttext synchronized" lang="en">Gets the provider for access points</p>
  "! For each API type, there are specific access points based on AI engine documentation.
  "! This method returns the abstraction layer which will then be used for accessing these
  "! end points during runtime.
  "! @parameter url_provider | <p class="shorttext synchronized" lang="en"></p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_accesspoint_provider
    RETURNING
      VALUE(url_provider) TYPE REF TO zcl_peng_aisdk_templprovider
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Initialization of Config Component</p>
  "!
  "! @parameter api_version                  | <p class="shorttext synchronized" lang="en">API Version</p>
  "! @parameter api_base                     | <p class="shorttext synchronized" lang="en">API Base</p>
  "! @parameter api_type                     | <p class="shorttext synchronized" lang="en">API Type</p>
  "! @parameter api_key                      | <p class="shorttext synchronized" lang="en">API Key</p>
  "! @parameter sdkprofile                   | <p class="shorttext synchronized" lang="en">SDK Profile ID as provided by organization SDK administrator</p>
  "! @parameter init_params                  | <p class="shorttext synchronized" lang="en">Additional parameters as specified by organization policies</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK Exception</p>
  METHODS initialize_config
    IMPORTING
      !api_version TYPE string
      !api_base    TYPE string
      !api_type    TYPE string
      !api_key     TYPE string
      sdkprofile   TYPE zde_azoaisdk_profileid DEFAULT 'DEFAULT'
      init_params  TYPE tihttpnvp OPTIONAL
    RAISING
      zcx_peng_azoai_sdk_exception .
ENDINTERFACE.
