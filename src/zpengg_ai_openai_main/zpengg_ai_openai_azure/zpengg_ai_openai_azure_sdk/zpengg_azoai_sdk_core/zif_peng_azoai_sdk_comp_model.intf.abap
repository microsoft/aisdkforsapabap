INTERFACE zif_peng_azoai_sdk_comp_model
  PUBLIC .


*  INTERFACES zif_peng_azoai_sdk_component .

  "! <p class="shorttext synchronized" lang="en">Get details of a single model.</p>
  "! Get details of a specific model, as specified in model ID parameter.
  "! @parameter iv_modelid | <p class="shorttext synchronized" lang="en">Model ID</p>
  "! @parameter ov_statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter ov_statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter ov_json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter ov_model | <p class="shorttext synchronized" lang="en">ABAP ready model details.</p>
  "! @parameter ov_error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get
    IMPORTING
      !iv_modelid     TYPE string
    EXPORTING
      ov_statuscode   TYPE i
      ov_statusreason TYPE string
      ov_json         TYPE string
      ov_model        TYPE zif_peng_azoai_sdk_types=>ty_model_get
      ov_error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .


  "! <p class="shorttext synchronized" lang="en">List all models available</p>
  "! Provides a list of all models available for deployment.
  "! @parameter ov_statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter ov_statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter ov_json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter ov_model | <p class="shorttext synchronized" lang="en">ABAP ready model list.</p>
  "! @parameter ov_error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS list
    EXPORTING
      ov_statuscode   TYPE i
      ov_statusreason TYPE string
      ov_json         TYPE string
      ov_model        TYPE zif_peng_azoai_sdk_types=>ty_model_list
      ov_error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .
ENDINTERFACE.
