CLASS zcl_peng_azoai_sdk_v1_config DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_config_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      zif_peng_azoai_sdk_config~initialize_config REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

******************* Initialization Data ********************

***************** House Keeping Data ************************
    DATA _t_versions_supported TYPE zif_peng_azoai_sdk_types=>tty_supported_version .
    DATA _t_authstrategies_supported TYPE zif_peng_azoai_sdk_types=>tty_auth_strategies .
*************************** Computed Data *******************


    "! <p class="shorttext synchronized" lang="en">Load supported versions</p>
    "! For now, the supported versions are specified in code. However, in future,
    "! and as versions expand, this method will be modified to be driven through a config
    "! table.
    "! <br/><br/>
    "! <strong>ADDITIONAL NOTE</strong> : If an un-supported version was allowed to be set,
    "! this will ofcourse be handled in actual api call by the server, and rejected with an error.
    "! However, the reason why we are checking it in API itself, is to give an early failure, and without
    "! and additional network operation. Additionally, later, this supported version loading
    "! can be controlled by implementers through configs, to prevent useage of say, a non-desirable
    "! version that is available, but for example, against an organizations policies or practices.
    "! Hence, this is more of a "future proof" plug - as the field evolves. We may never use it
    "! but the provision is there.
    METHODS _load_supported_versions .
    "! <p class="shorttext synchronized" lang="en">Load supported Auth Strategies.</p>
    "! For now, the supported authentication strategies are specified in code. In future,
    "! if there are expansions, this will be modified to load from config tables.
    METHODS _load_supported_authstrategies .
    "! <p class="shorttext synchronized" lang="en">Sets the API version into config object</p>
    "!
    "! @parameter api_version | <p class="shorttext synchronized" lang="en"></p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    METHODS _set_api_version
      IMPORTING
        !api_version TYPE string
      RAISING
        zcx_peng_azoai_sdk_exception .
    "! <p class="shorttext synchronized" lang="en">Sets the API Base URL</p>
    "!
    "! @parameter api_base | <p class="shorttext synchronized" lang="en"></p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    METHODS _set_api_base
      IMPORTING
        !api_base TYPE string
      RAISING
        zcx_peng_azoai_sdk_exception .
    "! <p class="shorttext synchronized" lang="en">Sets Authentication strategy</p>
    "! Sets the authentication strategy for Azure Opean AI API calls. 2 authentication strategies are supported:
    "! <ol>
    "!    <li>Key based Authentication</li>
    "!    <li>Azure Active Directory Authentication Token</li>
    "! </ol>
    "!
    "! <h1> Key Based Authentication</h1>
    "! In Key based authentication, the keys generated when Open AI module is set up in Azure can be utilized. Either Key1 or Key2
    "! which are available through Azure portal in the Open AI resource can be used.
    "! <h2>Useage</h2>
    "! <ul>
    "!    <li>api_type = 'azure'</li>
    "!    <li>api_key  = KEY1 <em>or</em> KEY2 from Azure portal.</li>
    "! </ul>
    "!
    "! <h1> Azure Active Directory Authentication Token (AAD)</h1>
    "! In AAD based authentication, Azure Acitve directory federates the access through a bearer token.
    "!
    "! <h2>Useage</h2>
    "! <ul>
    "!    <li>api_type = 'azure_ad'</li>
    "!    <li>api_key  = Bearer token. <strong>NOTE:</strong> Only pass the bearer token in this parameter. Do NOT prepend BEARER before the token value</li>
    "! </ul>
    "!
    "! @parameter api_type | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter api_key | <p class="shorttext synchronized" lang="en"></p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    METHODS _set_authentication
      IMPORTING
        !api_type TYPE string
        !api_key  TYPE string
      RAISING
        zcx_peng_azoai_sdk_exception .
ENDCLASS.



CLASS zcl_peng_azoai_sdk_v1_config IMPLEMENTATION.

  METHOD zif_peng_azoai_sdk_config~initialize_config.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_CONFIG
* Method         : zif_peng_azoai_sdk_config~initialize_config
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Initialization of Config Component
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

    super->zif_peng_azoai_sdk_config~initialize_config(
      EXPORTING
        api_version = api_version           " API Version
        api_base    = api_base              " API Base
        api_type    = api_type              " API Type
        api_key     = api_key               " API Key
        sdkprofile  = sdkprofile            " SDK Profile ID as provided by organization SDK administrator
        init_params = init_params           " Additional parameters as specified by organization policies
    ).


*   Load supported versions.
    _load_supported_versions( ).

*   Load supported authentication strategies.
    _load_supported_authstrategies( ).

*   Set the working Parameters.
    _api_type = api_type.
    _api_key  = api_key.
    _set_api_version( api_version = api_version ).
    _set_api_base( api_base = api_base ).


*   Set authentication strategy.
    _set_authentication( api_type = api_type api_key = api_key ).

*   Load run profile.
    _load_runprofile( profile_id = sdkprofile  ).

*   Store away any additional parameters.
    _t_other_params = init_params.
  ENDMETHOD.


  METHOD _load_supported_authstrategies.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1_CONFIG
* Method         : _load_supported_authstrategies
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Load supported Auth Strategies.
*
* For now, the supported authentication strategies are specified in code. In future, if there are expansions,
* this will be modified to load from config tables.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _t_authstrategies_supported = VALUE #(
                                            (
                                                api_type = zif_peng_azoai_sdk_constants=>c_apitype-azure
                                                description = |Authentication using Key from Azure Open AI|
                                            )
                                            (
                                                api_type = zif_peng_azoai_sdk_constants=>c_apitype-azure_ad
                                                description = |Authentication using Azure Active Directory token|
                                            )
                                            (
                                                api_type = zif_peng_azoai_sdk_constants=>c_apitype-openai
                                                description = |Open AI End point|
                                            )
                                         ).
  ENDMETHOD.


  METHOD _load_supported_versions.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG
* Method         : _load_supported_versions
* Created by     : Gopal Nair
* Date           : Mar 19, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Load supported versions

* For now, the supported versions are specified in code. However, in future, and as versions expand, this method
* will be modified to be driven through a config table.
*
* ADDITIONAL NOTE : If an un-supported version was allowed to be set, this will ofcourse be handled in actual api
* call by the server, and rejected with an error. However, the reason why we are checking it in API itself, is to
* give an early failure, and without and additional network operation. Additionally, later, this supported version
* loading can be controlled by implementers through configs, to prevent useage of say, a non-desirable version that
* is available, but for example, against an organizations policies or practices. Hence, this is more of a "future proof"
* plug - as the field evolves. We may never use it but the provision is there.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 19, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _t_versions_supported = VALUE #(
                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2022_12_01
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2022_12_01
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )
                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2023_03_15_preview
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2023_03_15_preview
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )
                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2023_05_15
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2023_05_15
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )

                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2023_06_01_preview
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2023_06_01_preview
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )
                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2023_07_01_preview
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2023_07_01_preview
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )
                                        (   version_name                = zif_peng_azoai_sdk_constants=>c_versions-v_2023_08_01_preview
                                            version_id                  = zif_peng_azoai_sdk_constants=>c_versions-v_2023_08_01_preview
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )



                                        (   version_name                = zif_peng_oai_sdk_constants=>c_versions-v1
                                            version_id                  = zif_peng_oai_sdk_constants=>c_versions-v1
                                            version_handler_classname   = 'ZCL_PENG_AZOAI_SDK_V1'
                                        )

                                   ).

  ENDMETHOD.


  METHOD _set_api_base.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG
* Method         : _set_api_base
* Created by     : Gopal Nair
* Date           : Mar 19, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Sets the API Base URL
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 19, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   If the API base URL is not specified, raise an exception and abort.
    IF api_base IS INITIAL.
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid = zcx_peng_azoai_sdk_exception=>invalid_api_base_url.
    ENDIF.

    _api_base = to_lower( api_base ) .

*   Check if this is an Azure Open AI resource. If not, reject it.
*   NOTE : In Version 2.0 and later, this will need to change to include openAI, and later bard..etc.... and not just Azure Open AI.
*   TODO, TOBRAINSTORM : Should we control this with a flag?
    CASE _api_type.
      WHEN zif_peng_azoai_sdk_constants=>c_apitype-azure OR zif_peng_azoai_sdk_constants=>c_apitype-azure_ad.
        IF NOT _api_base CS zif_peng_azoai_sdk_constants=>c_azure_openairesource.
          RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
            EXPORTING
              textid = zcx_peng_azoai_sdk_exception=>invalid_api_base_url.
        ENDIF.

      WHEN zif_peng_azoai_sdk_constants=>c_apitype-openai.
        IF NOT _api_base CS zif_peng_azoai_sdk_constants=>c_openairesource.
          RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
            EXPORTING
              textid = zcx_peng_azoai_sdk_exception=>invalid_api_base_url.
        ENDIF.

    ENDCASE.


*   We will need to adjust the API Base URL to a standard format of : http://resourcename.openai.azure.com - WITHOUT a final "/"
*  Check if the provided URL starts with an HTTPS. If not, add it to the front. For now, the only protocol supported is https... but this can change in future.
    IF _api_base(8) NE zif_peng_azoai_sdk_uripatterns=>supported_protocols-https.
      _api_base = |{ zif_peng_azoai_sdk_uripatterns=>supported_protocols-https }{ _api_base }|.
    ENDIF.

*   Check if the last character is a "/". If yes, take it out.
    IF ( substring( val = _api_base off = strlen( _api_base ) - 1 len = 1 ) = '/' ).
      _api_base = substring( val = _api_base off = 0 len = strlen( _api_base ) - 1 ).
    ENDIF.



  ENDMETHOD.


  METHOD _set_api_version.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG
* Method         : _set_version
* Created by     : Gopal Nair
* Date           : Mar 19, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Sets the API version into config object
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 19, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*  Check if the version is supported. If not, raise an exception.
    IF NOT line_exists( _t_versions_supported[ version_name = api_version ] ).
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid = zcx_peng_azoai_sdk_exception=>version_not_supported.
    ENDIF.

*   Set the API version value.
    _api_version = api_version.


  ENDMETHOD.


  METHOD _set_authentication.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_CONFIG
* Method         : _set_authentication
* Created by     : Gopal Nair
* Date           : Mar 19, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Sets Authentication strategy
*
* Sets the authentication strategy for Azure Opean AI API calls. 2 authentication strategies are supported:
*           1.Key based Authentication
*           2.Azure Active Directory Authentication Token
*
* Key Based Authentication
* =========================
* In Key based authentication, the keys generated when Open AI module is set up in Azure can be utilized.
* Either Key1 or Key2 which are available through Azure portal in the Open AI resource can be used.
*
* Useage
* ~~~~~~
*   •api_type = 'azure'
*   •api_key = KEY1 or KEY2 from Azure portal.
*
*Azure Active Directory Authentication Token (AAD)
* ==================================================
* In AAD based authentication, Azure Acitve directory federates the access through a bearer token.

*Useage
* ~~~~~~
*   •api_type = 'azure_ad'
*   •api_key = Bearer token. NOTE: Only pass the bearer token in this parameter. Do NOT prepend BEARER before the token value

*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 19, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*  Check if the authentication type is supported.
    IF NOT line_exists( _t_authstrategies_supported[ api_type = _api_type ] ).
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid   = zcx_peng_azoai_sdk_exception=>invalid_api_auth
          iv_attr1 = |Type|.
    ENDIF.

*   Check if API key is empty.
    IF _api_key IS INITIAL.
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid   = zcx_peng_azoai_sdk_exception=>invalid_api_auth
          iv_attr1 = |Key|.
    ENDIF.

*   Depending on the auth type, we need to set the authentication header info.
    CASE _api_type.
      WHEN zif_peng_azoai_sdk_constants=>c_apitype-azure.
        _auth_header-name   = zif_peng_azoai_sdk_constants=>c_authheader_paramnames-api_key.
        _auth_header-value  = _api_key.
      WHEN zif_peng_azoai_sdk_constants=>c_apitype-azure_ad OR zif_peng_azoai_sdk_constants=>c_apitype-openai.
        _auth_header-name   = zif_peng_azoai_sdk_constants=>c_authheader_paramnames-authorization.
        _auth_header-value  = |{ zif_peng_azoai_sdk_constants=>c_authheader_paramnames-bearer } { _api_key }|.
      WHEN OTHERS.
        MESSAGE 'Error in SDK Code. DEBUG INFO: Class : ZCL_PENG_AZOAI_SDK_CONFIG, Method: _set_authentication' TYPE 'E'.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
