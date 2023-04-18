INTERFACE zif_peng_azoai_sdk_comp_fintun
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">Cancels the processing of the fine-tune job</p>
  "! Cancels the processing of the fine-tune job specified by the given fine-tune-id.
  "! @parameter finetuneid | <p class="shorttext synchronized" lang="en">The identifier of the fine-tune job</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter finetune_cancelled | <p class="shorttext synchronized" lang="en">ABAP Ready fine-tune cancellation details</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS cancel
    IMPORTING
      finetuneid         TYPE string
    EXPORTING
      statuscode         TYPE i
      statusreason       TYPE string
      json               TYPE string
      finetune_cancelled TYPE zif_peng_azoai_sdk_types=>ty_finetune_result
      error              TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Creates a job that fine-tunes a specified model</p>
  "! Creates a job that fine-tunes a specified model from a given training file. Response includes
  "! details of the enqueued job including job status and hyper parameters. The name of the fine-tuned
  "! model is added to the response once complete.
  "! @parameter finetune_create | <p class="shorttext synchronized" lang="en">Parameters for creating a new fine-tune job</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter finetune | <p class="shorttext synchronized" lang="en">ABAP ready fine tune details</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS create
    IMPORTING
      finetune_create TYPE zif_peng_azoai_sdk_types=>ty_finetune_create
    EXPORTING
      statuscode      TYPE i
      statusreason    TYPE string
      json            TYPE string
      finetune        TYPE zif_peng_azoai_sdk_types=>ty_finetune_result
      error           TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Deletes the fine-tune job</p>
  "! Deletes the fine-tune job specified by the given fine-tune-id.
  "! @parameter finetuneid | <p class="shorttext synchronized" lang="en">The identifier of the fine-tune job</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS delete
    IMPORTING
      finetuneid   TYPE string
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Gets details for a single fine-tune job</p>
  "! Gets details for a single fine-tune job specified by the given fine-tune-id. The details
  "! contain the base model, training and validation files, hyper parameters, time stamps,
  "! status and events. Events are created when the job status changes, e.g. running or
  "! complete, and when results are uploaded.
  "! @parameter finetuneid | <p class="shorttext synchronized" lang="en">The identifier of the fine-tune job</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter finetune | <p class="shorttext synchronized" lang="en">ABAP ready fine tune details</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get
    IMPORTING
      finetuneid   TYPE string
    EXPORTING
      statuscode   TYPE i
      statusreason TYPE string
      json         TYPE string
      finetune     TYPE zif_peng_azoai_sdk_types=>ty_finetune_result
      error        TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Gets the events for the fine-tune job</p>
  "! Gets the events for the fine-tune job specified by the given fine-tune-id. Events are
  "! created when the job status changes, e.g. running or complete, and when results are uploaded.
  "! @parameter finetuneid | <p class="shorttext synchronized" lang="en">The identifier of the fine-tune job</p>
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter finetune_events | <p class="shorttext synchronized" lang="en">ABAP Ready list of fine-tune job events</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS get_events
    IMPORTING
      finetuneid      TYPE string
    EXPORTING
      statuscode      TYPE i
      statusreason    TYPE string
      json            TYPE string
      finetune_events TYPE zif_peng_azoai_sdk_types=>ty_finetune_events
      error           TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .

  "! <p class="shorttext synchronized" lang="en">Gets a list of all fine-tune jobs</p>
  "! Gets a list of all fine-tune jobs owned by the Azure OpenAI resource. The details
  "! that are returned for each fine-tune job contain besides its identifier the
  "! base model, training and validation files, hyper parameters, time stamps,
  "! status and events. Events are created when the job status changes, e.g.
  "! running or complete, and when results are uploaded.
  "! @parameter statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
  "! @parameter statusreason | <p class="shorttext synchronized" lang="en">Status Reason</p>
  "! @parameter json | <p class="shorttext synchronized" lang="en">JSON string with information about operation</p>
  "! @parameter finetune_list | <p class="shorttext synchronized" lang="en">ABAP Ready list of fine-tune jobs</p>
  "! @parameter error | <p class="shorttext synchronized" lang="en">ABAP Ready error details</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS list
    EXPORTING
      statuscode    TYPE i
      statusreason  TYPE string
      json          TYPE string
      finetune_list TYPE zif_peng_azoai_sdk_types=>ty_finetune_list
      error         TYPE zif_peng_azoai_sdk_types=>ty_error
    RAISING
      zcx_peng_azoai_sdk_exception .


ENDINTERFACE.
