CLASS zcl_peng_azoai_sdk_config_base DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_peng_azoai_sdk_config .



  PROTECTED SECTION.
    DATA:
      _objhelper           TYPE REF TO zcl_peng_azoai_sdk_helper,
      _objtemplateprovider TYPE REF TO zcl_peng_aisdk_templprovider,
      _run_profile         TYPE ztaisdkrunprofil,
      _obj_profilehandler  TYPE REF TO zcl_peng_azoai_centralcontrol,
      _api_version         TYPE string,
      _api_base            TYPE string,
      _api_type            TYPE string ,   "Defined in zif_peng_azoai_sdk_constants=>C_APITYPE
      _api_key             TYPE string,    "Holds the API key or Auth Token
      _auth_header         TYPE ihttpnvp,  "Authentication header - Set based on _api_type being set
      _t_other_params      TYPE tihttpnvp. "Other parameters - primarily for user specific needs.

    METHODS:
      "! <p class="shorttext synchronized" lang="en">Loads the SDK run profile from Configuration DB</p>
      "! Organizations using the SDK can impose policies on its useage using run-profiles. This method
      "! loads the run-profile settings from the configuration DB : ZTAISDKRUNPROFIL, and can be maintained
      "! using Transaction code : ZAISDK_CONFIG.
      "! @parameter profile_id | <p class="shorttext synchronized" lang="en">Profile ID</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      _load_runprofile
        IMPORTING
          profile_id TYPE zde_azoaisdk_profileid
        RAISING
          zcx_peng_azoai_sdk_exception.

  PRIVATE SECTION.
    "! <p class="shorttext synchronized" lang="en">Determines the run profile to use</p>
    "! The determination logic for a profile ID follows the following in sequence, and the first successful
    "! attempts resolves the profile ID determination.
    "! <ol>
    "!  <li>Checks if an entry exists with exact profile ID and System ID</li>
    "!  <li>Checks if an entry exists with exact profile ID and blank/wildcard System ID.</li>
    "!  <li>Checks if an entry exists with DEFAULT profile ID and System ID</li>
    "!  <li>Checks if an entry exists with DEFAULT profile ID and blank/wildcard System ID</li>
    "! </ol>
    "! <br/>
    "! If all the above sequence of checks fails, then the hard-coded internal profile is loaded for SDK working.
    "! With the internal profile, all operations are permitted without restrictions.
    "!
    "! @parameter profile_id | <p class="shorttext synchronized" lang="en"></p>
    METHODS _determine_runprofile
      IMPORTING
        profile_id TYPE zde_azoaisdk_profileid.

ENDCLASS.



CLASS zcl_peng_azoai_sdk_config_base IMPLEMENTATION.


  METHOD zif_peng_azoai_sdk_config~get_apibase.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_apibase
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
    api_base = _api_base.
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_config~get_apiversion.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_apiversion
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
    api_version = _api_version.
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_config~get_authheader.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_authheader
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
    auth_header = _auth_header.
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_config~initialize_config.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~initialize_config
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
*    _objhelper->raise_feature_notimpl_ex( ).
    _objtemplateprovider = NEW zcl_peng_aisdk_templprovider(
                                                              api_version       = api_version
                                                              api_type          = api_type
                                                            ).


  ENDMETHOD.


  METHOD zif_peng_azoai_sdk_config~get_single_parameter.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_parameter
* Created by     : Gopal Nair
* Date           : Mar 31, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets parameter value from addiitonal params set
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 31, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

*   NOTE : These paraemters are in addition to the core required parameters like api key, URL..etc.
*          and provides a way in which end users and organizations can mandate set of values to be
*          passed to the SDK during usage. These in turn will be made available in call back checks
*          so that organizations can centrally control use cases (or deny specific things..etc).

*   Check if the requested parameter exists. if not, raise a param missing exception.
    IF NOT line_exists( _t_other_params[ param_name ] ).
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid   = zcx_peng_azoai_sdk_exception=>param_missing
          iv_attr1 = CONV #( param_name ).
    ENDIF.

*   Return the requested parameter.
    parm_value = _t_other_params[ param_name ]-value.

  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_config~get_apitype.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_apitype
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns the API Type
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    api_type = _api_type.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_config~get_all_parameters.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_all_parameters
* Created by     : Gopal Nair
* Date           : Apr 4, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Get all parameters for this working instance
* Parameters are passed through factory, during initial SDK instance request. This method returns all the
* parameters thus passed. This will be used during call back for organization specific checks.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 4, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    param_tab = _t_other_params.
  ENDMETHOD.

  METHOD _load_runprofile.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : _load_runprofile
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Loads the SDK run profile from Configuration DB
* Organizations using the SDK can impose policies on its useage using run-profiles. This method loads the
* run-profile settings from the configuration DB : ZTAISDKRUNPROFIL, and can be maintained
* using Transaction code : ZAISDK_CONFIG.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

*   Load the run profile from config layer - or, if missing - load the default profile.
    _determine_runprofile( profile_id = profile_id ).

*   TODO : Think... should we default to internal class, if a class name is not maintained in config?

*   Instantiate central run profile handler.
    TRY.
        CREATE OBJECT _obj_profilehandler TYPE (_run_profile-callback_classname).
      CATCH cx_root.
*   the only reason instantiation can fail here, is because an invalid class was specified in configuration.
*   The profile handler class MUST inherit from : ZCL_PENG_AZOAI_CENTRALCONTROL.
*   Raise exception and abort.
        RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
          EXPORTING
            textid = zcx_peng_azoai_sdk_exception=>profile_err_invalid_handler.
    ENDTRY.

  ENDMETHOD.


  METHOD _determine_runprofile.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : _determine_runprofile
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Determines the run profile to use
*
* The determination logic for a profile ID follows the following in sequence, and the first successful attempts
* resolves the profile ID determination.
*   1.Checks if an entry exists with exact profile ID and System ID
*   2.Checks if an entry exists with exact profile ID and blank/wildcard System ID.
*   3.Checks if an entry exists with DEFAULT profile ID and System ID
*   4.Checks if an entry exists with DEFAULT profile ID and blank/wildcard System ID
*
* If all the above sequence of checks fails, then the hard-coded internal profile is loaded for SDK working. With the
* internal profile, all operations are permitted without restrictions.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Check if the profile provided is valid. We are going to grab the most specific record available.
*   NOTE : The DB table : ztaisdkrunprofil is Fully Buffered. Hence, the below DB hits suffer minimal performance penalty.
*          This may undergo further optimizations in future, depending on different use cases/behaviors/feedback.

*   Trial 1: Check if a profile is maintained with specified profile ID + specific System ID - which is active.
    SELECT SINGLE * FROM ztaisdkrunprofil INTO @_run_profile
             WHERE profile_id = @profile_id
             AND   sysid = @sy-sysid
             AND inactive = @abap_false.

    IF sy-subrc = 0.
      RETURN.
    ENDIF.

*   Trial 2: Check if a profile is maintained with specified profile ID and Blank System ID. Basically, we are widening the search to use a generic maintained
*            profile, where sys-ID is set to empty or *.
    SELECT SINGLE * FROM ztaisdkrunprofil INTO @_run_profile
             WHERE profile_id = @profile_id
             AND   ( sysid = '' OR sysid = '*' )
             AND inactive = @abap_false.

    IF sy-subrc = 0.
      RETURN.
    ENDIF.

*   Trial 3 : If both the above options fail to read the profile (meaning, the profile requested is not maintained), fall back to default profile, and attempt to read default profile from DB
*             with system ID specificity, and which is active.
    SELECT SINGLE * FROM ztaisdkrunprofil INTO @_run_profile
             WHERE profile_id = @zif_peng_azoai_sdk_constants=>c_sdk_default_profile_name
             AND   sysid = @sy-sysid
             AND inactive = @abap_false.

    IF sy-subrc = 0.
      RETURN.
    ENDIF.

*   Trial 4: Check if default profile is maintained without a system ID.
    SELECT SINGLE * FROM ztaisdkrunprofil INTO @_run_profile
            WHERE profile_id = @zif_peng_azoai_sdk_constants=>c_sdk_default_profile_name
            AND   ( sysid = '' OR sysid = '*' )
            AND inactive = @abap_false.

    IF sy-subrc = 0.
      RETURN.
    ENDIF.


*  If we reach here, it means, all attempts to determine a configured run profile has failed. Use the core fall back option.
    _run_profile-callback_classname = to_upper( zif_peng_azoai_sdk_constants=>c_central_control_class ).
    _run_profile-profile_id = zif_peng_azoai_sdk_constants=>c_sdk_default_profile_name.
    _run_profile-sysid = sy-sysid.
    _run_profile-mandt = sy-mandt.

  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_config~get_runprofile.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_runprofile
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns the current working run profile
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    run_profile = _run_profile.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_config~get_runprofile_handler.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_runprofile_handler
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of Run profile handler
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    profile_handler = _obj_profilehandler.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk_config~get_accesspoint_provider.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG_BASE
* Method         : zif_peng_azoai_sdk_config~get_accesspoint_provider
* Created by     : Gopal Nair
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the provider for access points
* For each API type, there are specific access points based on AI engine documentation. This method returns
* the abstraction layer which will then be used for accessing these end points during runtime.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
    url_provider = _objtemplateprovider.
  ENDMETHOD.

ENDCLASS.
