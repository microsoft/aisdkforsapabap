INTERFACE zif_peng_aisdk_endpt_provider
  PUBLIC .

  METHODS:

    "! <p class="shorttext synchronized" lang="en">Initialize the URL provider</p>
    "! <strong>Initialize the URL provider</strong>
    "! <br/>
    "! This method is called by AI SDK core to initialize the URL provider. It passes in a version
    "! ID. The version may/maynot play a role in the URL end point, but its there to use.
    "! @parameter api_version | <p class="shorttext synchronized" lang="en">Version ID</p>
    "! @parameter additional_params | <p class="shorttext synchronized" lang="en">Any additional parameters</p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    initialize
      IMPORTING
        api_version       TYPE string OPTIONAL
        additional_params TYPE tihttpnvp OPTIONAL
      RAISING
        zcx_peng_azoai_sdk_exception,

    "! <p class="shorttext synchronized" lang="en">Gets the URL end point for a specific Component/Operation</p>
    "! This method returns the specific end point URL for an operation on an AI engine.
    "! @parameter component | <p class="shorttext synchronized" lang="en">Component ID (eg: model,deployment...etc)</p>
    "! @parameter operation | <p class="shorttext synchronized" lang="en">Operation (eg: create,list..etc)</p>
    "! @parameter additional_params | <p class="shorttext synchronized" lang="en">Any additional parameters</p>
    "! @parameter endpoint_template | <p class="shorttext synchronized" lang="en">The End point URL template</p>
    "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
    get_endpoint_template
      IMPORTING
        component                TYPE string
        operation                TYPE string
        additional_params        TYPE tihttpnvp OPTIONAL
      RETURNING
        VALUE(endpoint_template) TYPE string
      RAISING
        zcx_peng_azoai_sdk_exception .

ENDINTERFACE.
