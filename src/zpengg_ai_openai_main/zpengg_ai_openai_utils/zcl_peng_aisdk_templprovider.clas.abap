"! <p class="shorttext synchronized" lang="en">MSPENG:AZOAISDK URL Template Provider (INTERNAL USE ONLY)</p>
"! This class instance will be part of config layer, and will serve to provide the access URLs for a supported
"! AI engine service. The class uses a loose coupling mechanism, where the actual URL templates are provided
"! by a plugin style implementation, which inturn depends on the api type being used, and possibly the version.
CLASS zcl_peng_aisdk_templprovider DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      "! <p class="shorttext synchronized" lang="en">Creates and returns an instance of URL provider</p>
      "! @parameter api_version | <p class="shorttext synchronized" lang="en">API Version</p>
      "! @parameter api_type | <p class="shorttext synchronized" lang="en">API Type</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      constructor
        IMPORTING
          api_version       TYPE string
          api_type          TYPE string
          additional_params TYPE tihttpnvp OPTIONAL
        RAISING
          zcx_peng_azoai_sdk_exception,


      "! <p class="shorttext synchronized" lang="en">Gets the URL Template if defined</p>
      "!
      "! @parameter component | <p class="shorttext synchronized" lang="en">Component ID</p>
      "! @parameter operation | <p class="shorttext synchronized" lang="en">Operation</p>
      "! @parameter additional_params | <p class="shorttext synchronized" lang="en">Additional Parameters</p>
      "! @parameter url_template | <p class="shorttext synchronized" lang="en">URL Template, if defined</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      get_urltemplate
        IMPORTING
          component           TYPE string
          operation           TYPE string
          additional_params   TYPE tihttpnvp OPTIONAL
        RETURNING
          VALUE(url_template) TYPE string
        RAISING
          zcx_peng_azoai_sdk_exception.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      _apiversion         TYPE string,
      _apitype            TYPE string,
      _t_additionalparams TYPE tihttpnvp,
      _providerclassname  TYPE string,
      _objurltemplate     TYPE REF TO zif_peng_aisdk_endpt_provider.

ENDCLASS.

CLASS zcl_peng_aisdk_templprovider IMPLEMENTATION.

  METHOD constructor.
*****************************************************************************************************************
* Class          : ZCL_PENG_AISDK_ACCESSTEMPLATE
* Method         : constructor
* Created by     : Gopal Nair
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates and returns an instance of URL provider
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************


    _apiversion         = api_version.
    _apitype            = api_type.
    _t_additionalparams = additional_params.

    CASE _apitype.
        "Azure Open AI
      WHEN zif_peng_azoai_sdk_constants=>c_apitype-azure OR zif_peng_azoai_sdk_constants=>c_apitype-azure_ad.
        _providerclassname = to_upper( zif_peng_azoai_sdk_constants=>c_urltemplateproviders-azureopenai ).

      WHEN  zif_peng_azoai_sdk_constants=>c_apitype-openai.
        _providerclassname = to_upper( zif_peng_azoai_sdk_constants=>c_urltemplateproviders-openai ).

      WHEN OTHERS.
        RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
          EXPORTING
            textid = zcx_peng_azoai_sdk_exception=>not_implemented.
    ENDCASE.


* Instantiate the URL provider class, and store it away.
    CREATE OBJECT _objurltemplate TYPE (_providerclassname).

* Invoke Initialization routine in URL provider.
    _objurltemplate->initialize(
      EXPORTING
        api_version       = _apiversion         " Version ID
        additional_params = additional_params   " Any additional parameters
    ).

  ENDMETHOD.



  METHOD get_urltemplate.
*****************************************************************************************************************
* Class          : ZCL_PENG_AISDK_ACCESSTEMPLATE
* Method         : get_urltemplate
* Created by     : GONAIR (Gopal Nair)
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the URL Template if defined
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************

    url_template = _objurltemplate->get_endpoint_template(
                     component         = component
                     operation         = operation
                     additional_params = additional_params
                   ).

  ENDMETHOD.

ENDCLASS.
