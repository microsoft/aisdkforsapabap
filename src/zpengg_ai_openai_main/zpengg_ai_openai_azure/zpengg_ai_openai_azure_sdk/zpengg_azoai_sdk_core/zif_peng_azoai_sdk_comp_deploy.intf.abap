"! <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI SDK - Deployments Component</p>
INTERFACE zif_peng_azoai_sdk_comp_deploy
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">Gets details for a single deployment</p>
  "! Gets details for a single deployment specified by the given deployment-id.
  "! @parameter deploymentid | <p class="shorttext synchronized" lang="en">Deployment ID</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code.</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter deployment | <p class="shorttext synchronized" lang="en">ABAP ready deployment details</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get
    IMPORTING
      deploymentid TYPE string
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      deployment   TYPE zif_peng_azoai_sdk_types=>ty_deployments
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .


  "! <p class="shorttext synchronized" lang="en">Gets the list of all deployments.</p>
  "! Gets the list of all deployments in the AI service account.
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code.</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter deployments | <p class="shorttext synchronized" lang="en">ABAP ready deployment list</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS list
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      deployments  TYPE zif_peng_azoai_sdk_types=>ty_deployments_list
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Creates a new deployment</p>
  "! Creates a new deployment based on an existing model.
  "! <br/><br/>
  "! <em>Additional info on Parameters:</em><br/>
  "! <strong>Scale Settings</strong>
  "! <ul>
  "!    <li><strong>capacity</strong>: The constant reserved capacity of the inference endpoint for this deployment. This field is only used when scale_type is set to "manual"</li>
  "!    <li><strong>scale_type</strong>:Defines how scaling operations will be executed. Possible values are :
  "!            <ol>
  "!               <li><em>manual</em>: Indicates Manual scale setting. The "capacity" field will need to be set.</li>
  "!               <li><em>standard</em>:Standard scale setting. The "capacity" field should not be set.</li>
  "!            </ol>
  "!    </li>
  "! </ul>
  "! @parameter iv_deployment_info | <p class="shorttext synchronized" lang="en">Deployment details, including model ID</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code.</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter deployment | <p class="shorttext synchronized" lang="en">ABAP ready deployment details</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS create
    IMPORTING
      iv_deployment_info TYPE   zif_peng_azoai_sdk_types=>ty_deployments_create
    EXPORTING
      statuscode         TYPE i
      statusreason       TYPE string
      json               TYPE string
      deployment         TYPE zif_peng_azoai_sdk_types=>ty_deployments
      error              TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Deletes an existing deployment</p>
  "! Deletes an existing deployment, as specified by the deployment ID parameter.
  "! @parameter deploymentid | <p class="shorttext synchronized" lang="en">Deployment ID</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code.</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS delete
    IMPORTING
      deploymentid TYPE string
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

*  "! <p class="shorttext synchronized" lang="en">INTERNAL ONLY - Updates a deployment</p>
*  "! <strong>INTERNAL ONLY</strong>: Updates a deployment
*  "! @parameter deploymentid | <p class="shorttext synchronized" lang="en">Deployment ID</p>
*  "! @parameter iv_deployment_info | <p class="shorttext synchronized" lang="en">Update parameters</p>
*  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
*  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Description</p>
*  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about deployment, or error.</p>
*  "! @parameter deployments | <p class="shorttext synchronized" lang="en">ABAP ready deployment list</p>
*  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP ready error details</p>
*  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
*  METHODS update
*    IMPORTING
*      deploymentid       TYPE string
*      iv_deployment_info TYPE   zif_peng_azoai_sdk_types=>ty_deployments_create
*    EXPORTING
*      statuscode         TYPE i
*      statusreason       TYPE string
*      json               TYPE string
*      deployment         TYPE zif_peng_azoai_sdk_types=>ty_deployments
*      error              TYPE zif_peng_azoai_sdk_types=>ty_error
*    RAISING
*      zcx_peng_azoai_sdk_exception .


ENDINTERFACE.
