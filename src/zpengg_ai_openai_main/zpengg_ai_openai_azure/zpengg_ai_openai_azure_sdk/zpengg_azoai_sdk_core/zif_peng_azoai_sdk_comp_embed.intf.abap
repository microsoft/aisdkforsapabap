"! <p class="shorttext synchronized" lang="en">MSPENG: Azure Open AI SDK - Embeddings Component</p>
INTERFACE zif_peng_azoai_sdk_comp_embed
  PUBLIC .


  "! <p class="shorttext synchronized" lang="en">Creates embedding from input text.</p>
  "!
  "! @parameter deploymentid                 | <p class="shorttext synchronized" lang="en">Deployment ID on which the embedding must be generated.</p>
  "! @parameter inputs                      | <p class="shorttext synchronized" lang="en">Input texts for embedding</p>
  "! @parameter statuscode                   | <p class="shorttext synchronized" lang="en">HTTP Response status code.</p>
  "! @parameter statusreason                 | <p class="shorttext synchronized" lang="en">HTTP Status Reason.</p>
  "! @parameter json                         | <p class="shorttext synchronized" lang="en">JSON String received from AI engine.</p>
  "! @parameter response                     | <p class="shorttext synchronized" lang="en">Parsed and ABAP ready data structure from JSON String</p>
  "! @parameter error                        | <p class="shorttext synchronized" lang="en">Error information parsed from JSON string</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">Exception - Note - an AI layer error is NOT an exception.</p>
  METHODS create
    IMPORTING
      deploymentid TYPE string
      inputs       TYPE zif_peng_azoai_sdk_types=>ty_embeddings_input
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      response     TYPE zif_peng_azoai_sdk_types=>ty_embeddings_output
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .
ENDINTERFACE.
