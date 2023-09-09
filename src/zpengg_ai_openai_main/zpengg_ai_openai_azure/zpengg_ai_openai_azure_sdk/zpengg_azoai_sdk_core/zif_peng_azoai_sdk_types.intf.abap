INTERFACE zif_peng_azoai_sdk_types
  PUBLIC .



*********   Supported Versions ************
  TYPES:
    BEGIN OF ty_supported_versions,
      version_name              TYPE string,
      version_id                TYPE string,
      version_handler_classname TYPE string,
    END OF ty_supported_versions,

    tty_supported_version TYPE STANDARD TABLE OF ty_supported_versions.


*********   Authentication Strategies ************
  TYPES:
    BEGIN OF ty_auth_strategies,
      api_type    TYPE string,
      description TYPE string,
    END OF ty_auth_strategies,
    tty_auth_strategies TYPE STANDARD TABLE OF ty_auth_strategies.

*********   Model operation data types ************
* https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/models/get?tabs=HTTP#model
  TYPES:
    BEGIN OF ty_model_get,
      capabilities     TYPE zif_peng_azoai_sdk_typinternal=>ty_int_mod_get_capabilities, "
      created_at       TYPE i,                                                           "
      deprecation      TYPE zif_peng_azoai_sdk_typinternal=>ty_int_mod_get_deprecation,  "
      fine_tune        TYPE string,
      id               TYPE string,
      lifecycle_status TYPE string,
      model            TYPE string,
      object           TYPE string,
      owned_by         TYPE string,
      status           TYPE string,
      updated_at       TYPE i,
    END OF ty_model_get,

    BEGIN OF ty_model_list,
      data TYPE STANDARD TABLE OF ty_model_get WITH DEFAULT KEY,
    END OF ty_model_list.

*********   Deployments operation data types ************
* https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments
* https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments/get?tabs=HTTP#deployment
  TYPES:
    BEGIN OF ty_deployments,
      created_at     TYPE i,
      error          TYPE zif_peng_azoai_sdk_typinternal=>ty_internal_error_object,
      id             TYPE string,
      model          TYPE string,
      object         TYPE string,
      owner          TYPE string,
      scale_settings TYPE zif_peng_azoai_sdk_typinternal=>ty_scale_settings,
      status         TYPE string,
      updated_at     TYPE i,
    END OF ty_deployments,

*https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments/list?tabs=HTTP
    BEGIN OF ty_deployments_list,
      data TYPE STANDARD TABLE OF ty_deployments WITH DEFAULT KEY,
    END OF ty_deployments_list,

    BEGIN OF ty_deployments_create,
      scale_settings TYPE zif_peng_azoai_sdk_typinternal=>ty_scale_settings,
      model          TYPE string,
    END OF ty_deployments_create.

*********   Embeddings operation data types ************
  TYPES: BEGIN OF ty_embeddings_input,
           input TYPE stringtab,
         END OF ty_embeddings_input,

         BEGIN OF ty_embeddings_output,
           object TYPE string,
           data   TYPE zif_peng_azoai_sdk_typinternal=>tty_embedding,
           model  TYPE string,
           usage  TYPE zif_peng_azoai_sdk_typinternal=>ty_completion_resobj_usage,
         END OF ty_embeddings_output.

*********   Completions operation data types ************
  TYPES:
    BEGIN OF ty_completion_input,
      prompt            TYPE stringtab,                "Completion Prompts
      max_tokens        TYPE i,                         "Maximum number of tokens permitted - includes both the prompt, and the response.
      user              TYPE string,                    "A unique identifier for user - to potentially prevent misuse.
      n                 TYPE i,                         "Number of responses.
      temperature       TYPE p LENGTH 3 DECIMALS 2,     "Temperature - Controls randomness.
      top_p             TYPE p LENGTH 3 DECIMALS 2,     "Top probabilities  - Controls randomness.
      stop              TYPE stringtab,                 "Make responses stop at a desired point, such as the end of a sentence or list
      frequency_penalty TYPE p LENGTH 3 DECIMALS 2,     "Reduce the chance of repeating a token proportionally based on how often it has appeared in the text so far
      presence_penalty  TYPE p LENGTH 3 DECIMALS 2,     "Reduce the chance of repeating any token that has appeared in the text at all so far
      best_of           TYPE i,                         "Generate multiple responses, and display only the one with the best total probability across all its tokens.
    END OF ty_completion_input,

    BEGIN OF ty_completion_output,
      id      TYPE string,
      object  TYPE string,
      created TYPE i,
      model   TYPE string,
      choices TYPE zif_peng_azoai_sdk_typinternal=>tty_completion_resobj_choices,
      usage   TYPE zif_peng_azoai_sdk_typinternal=>ty_completion_resobj_usage,
    END OF ty_completion_output.


*********   Chat Completions operation data types ************
  TYPES:
    BEGIN OF ty_chatcompletion_message,
      role    TYPE string,
      content TYPE string,
    END OF ty_chatcompletion_message,

    tty_chatcompletion_messages TYPE STANDARD TABLE OF ty_chatcompletion_message WITH DEFAULT KEY,

    BEGIN OF ty_chatcompletion_input,
      messages          TYPE zif_peng_azoai_sdk_types=>tty_chatcompletion_messages,
      max_tokens        TYPE i,
      user              TYPE string,                    "A unique identifier representing your end-user, which can help Azure OpenAI to monitor and detect abuse.
      n                 TYPE i,                         "How many chat completion choices to generate for each input message
      temperature       TYPE p LENGTH 3 DECIMALS 2,     "Temperature - Controls randomness.
      top_p             TYPE p LENGTH 3 DECIMALS 2,     "Top probabilities  - Controls randomness.
      stop              TYPE stringtab,                 "Make responses stop at a desired point, such as the end of a sentence or list
      frequency_penalty TYPE p LENGTH 3 DECIMALS 2,     "Reduce the chance of repeating a token proportionally based on how often it has appeared in the text so far
      presence_penalty  TYPE p LENGTH 3 DECIMALS 2,     "Reduce the chance of repeating any token that has appeared in the text at all so far
    END OF ty_chatcompletion_input,

    BEGIN OF ty_chatcompletion_output,
      id      TYPE string,
      object  TYPE string,
      created TYPE i,
      model   TYPE string,
      choices TYPE zif_peng_azoai_sdk_typinternal=>tty_chatcompl_resobj_choices,
      usage   TYPE zif_peng_azoai_sdk_typinternal=>ty_completion_resobj_usage,
    END OF ty_chatcompletion_output.

*********   File operation data types ************
  TYPES:

    tty_file_upload TYPE STANDARD TABLE OF zif_peng_azoai_sdk_typinternal=>ty_int_file_upload WITH DEFAULT KEY,

    BEGIN OF ty_file_get,
      statistics TYPE zif_peng_azoai_sdk_typinternal=>ty_int_file_stats,
      bytes      TYPE i,
      purpose    TYPE string,
      filename   TYPE string,
      id         TYPE string,
      status     TYPE string,
      created_at TYPE i,
      updated_at TYPE i,
      object     TYPE string,
    END OF ty_file_get,

    BEGIN OF ty_file_list,
      data TYPE STANDARD TABLE OF ty_file_get WITH DEFAULT KEY,
    END OF ty_file_list,

    BEGIN OF ty_file_import,
      purpose     TYPE string,
      filename    TYPE string,
      content_url TYPE string,
    END OF ty_file_import.

*********   FineTunes operation data types ************
  TYPES:
    BEGIN OF ty_finetune_result,
      created_at       TYPE i,
      error            TYPE zif_peng_azoai_sdk_typinternal=>ty_internal_error_object,
      events           TYPE STANDARD TABLE OF zif_peng_azoai_sdk_typinternal=>ty_int_finetune_event WITH DEFAULT KEY,
      fine_tuned_model TYPE string,
      hyperparams      TYPE zif_peng_azoai_sdk_typinternal=>ty_int_finetune_hyperparams,
      id               TYPE string,
      model            TYPE string,
      object           TYPE string,
      organisation_id  TYPE string,
      result_files     TYPE STANDARD TABLE OF ty_file_get WITH DEFAULT KEY,
      status           TYPE string,
      suffix           TYPE string,
      training_files   TYPE STANDARD TABLE OF ty_file_get WITH DEFAULT KEY,
      updated_at       TYPE i,
      user_id          TYPE string,
      validation_files TYPE STANDARD TABLE OF ty_file_get WITH DEFAULT KEY,
    END OF ty_finetune_result,

    BEGIN OF ty_finetune_create,
      model                          TYPE string,
      training_file                  TYPE string,
      batch_size                     TYPE i,
      classification_betas           TYPE STANDARD TABLE OF i WITH DEFAULT KEY,
      classification_n_classes       TYPE i,
      classification_positive_class  TYPE string,
      compute_classification_metrics TYPE abap_bool,
      learning_rate_multiplier       TYPE i,
      n_epochs                       TYPE i,
      prompt_loss_weight             TYPE i,
      suffix                         TYPE string,
      validation_file                TYPE string,
    END OF ty_finetune_create,

    BEGIN OF ty_finetune_events,
      data   TYPE STANDARD TABLE OF zif_peng_azoai_sdk_typinternal=>ty_int_finetune_event WITH DEFAULT KEY,
      object TYPE string,
    END OF ty_finetune_events,

    BEGIN OF ty_finetune_list,
      data   TYPE STANDARD TABLE OF ty_finetune_result WITH DEFAULT KEY,
      object TYPE string,
    END OF ty_finetune_list.

************************* Error Data types *******
*https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses
  TYPES:
    BEGIN OF ty_error,
      error TYPE zif_peng_azoai_sdk_typinternal=>ty_internal_error_object,
    END OF ty_error,
    tty_error TYPE STANDARD TABLE OF ty_error.



*************** Types for Internal Use ************************





ENDINTERFACE.
