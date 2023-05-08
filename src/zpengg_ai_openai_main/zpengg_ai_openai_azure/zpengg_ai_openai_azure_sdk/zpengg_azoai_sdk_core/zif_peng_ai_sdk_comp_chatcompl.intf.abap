"! <p class="shorttext synchronized" lang="en">MSPENG: Azure Open AI SDK - Completions Component</p>
INTERFACE zif_peng_ai_sdk_comp_chatcompl
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">Performs a Chat Completion.</p>
  "! A <strong>Completion</strong> operation is about asking the AI engine something, and getting a response. The
  "! asking part of this interaction is called "prompts". <strong>Prompt Engineering</strong> is used to create
  "! prompts which will guide the AI engine to understand exactly what you are asking for, and respond meaningfully
  "! for the context of the question.
  "! <br/><br/>
  "! <strong>Prompt Engineering</strong>: https://learn.microsoft.com/en-us/azure/cognitive-services/openai/concepts/prompt-engineering
  "! <br/><br/>
  "! This method performs a completion operation with the prompts provided in parameter <em>prompts</em>, and returns the
  "! response received from AI engine. Both the raw JSON string received from AI enging, as well as a parsed, ABAP ready
  "! data structure is provided back to the caller.
  "! @parameter deploymentid                 | <p class="shorttext synchronized" lang="en">Deployment ID on which the prompt must be run.</p>
  "! @parameter prompts                      | <p class="shorttext synchronized" lang="en">1 or more prompts and their parameters like token length.</p>
  "! @parameter statuscode                   | <p class="shorttext synchronized" lang="en">HTTP Response status code.</p>
  "! @parameter statusreason                 | <p class="shorttext synchronized" lang="en">HTTP Status Reason.</p>
  "! @parameter json                         | <p class="shorttext synchronized" lang="en">JSON String received from AI engine.</p>
  "! @parameter response                     | <p class="shorttext synchronized" lang="en">Parsed and ABAP ready data structure from JSON String</p>
  "! @parameter error                        | <p class="shorttext synchronized" lang="en">Error information parsed from JSON string</p>
  "! @raising   zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en">Exception - Note - an AI layer error is NOT an exception.</p>
  METHODS create
    IMPORTING
      deploymentid TYPE string
      prompts      TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_input
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      response     TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_output
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .
ENDINTERFACE.
