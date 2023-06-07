INTERFACE zif_peng_azoai_sdk_typinternal
  PUBLIC .

************************** General Data Types - INTERNAL *****************
  TYPES:
    BEGIN OF ty_component_init_param,
      component_type           TYPE string,        "See : zif_peng_azoai_sdk_constants=>c_component_identifiers
      component_classification TYPE string,    "See : zif_peng_azoai_sdk_constants=>c_component_classification
      component_class_name     TYPE string,        "Component Class Name implementing the component.
      component_instance       TYPE REF TO object, "Instance of the component. If both class name, and instance is specified, instance takes precedence.
    END OF ty_component_init_param,

    tty_component_init_param TYPE STANDARD TABLE OF ty_component_init_param WITH DEFAULT KEY,

    BEGIN OF ty_endpoint_url_info,
      version        TYPE string,
      component_type TYPE string,
      operation      TYPE string,
      access_url     TYPE string,
    END OF ty_endpoint_url_info,

    tty_endpoint_url_info TYPE STANDARD TABLE OF ty_endpoint_url_info WITH DEFAULT KEY.




************************** END General Data Types - INTERNAL *****************


************************* Error Data types - INTERNAL *******
*https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses
  TYPES:
    BEGIN OF ty_internal_innererror,
      code TYPE string,
    END OF ty_internal_innererror,

    BEGIN OF ty_internal_error_object,
      code       TYPE string,
      message    TYPE string,
      target     TYPE string,
      innererror TYPE ty_internal_innererror,
    END OF ty_internal_error_object.

************************* END - Error Data types - INTERNAL *******

************************* MODEL Data Types - INTERNAL ***********************
*https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/models/get?tabs=HTTP#model
  TYPES:
    BEGIN OF ty_int_mod_get_capabilities,
      completion  TYPE abap_bool,
      embeddings  TYPE abap_bool,
      fine_tune   TYPE abap_bool,
      inference   TYPE abap_bool,
      scale_types TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
    END OF ty_int_mod_get_capabilities,

    BEGIN OF ty_int_mod_get_deprecation,
      fine_tune TYPE i,
      inference TYPE i,
    END OF ty_int_mod_get_deprecation.


************************* END - MODEL Data Types - INTERNAL ***********************
************************* EMBEDDINGS Data Types - INTERNAL ***********************
  TYPES:
    ty_coordinate TYPE p LENGTH 10 DECIMALS 9,
    BEGIN OF ty_embedding,
      object    TYPE string,
      index     TYPE i,
      embedding TYPE STANDARD TABLE OF ty_coordinate WITH DEFAULT KEY,
    END OF ty_embedding,

    tty_embedding TYPE STANDARD TABLE OF ty_embedding WITH DEFAULT KEY.

************************* END - EMBEDDINGS Data Types - INTERNAL ***********************

************************* COMPLETION Data Types - INTERNAL ***********************
  TYPES:
    BEGIN OF ty_completion_resobj_choices,
      text          TYPE string,
      index         TYPE i,
      finish_reason TYPE string,
    END OF ty_completion_resobj_choices,
    tty_completion_resobj_choices TYPE STANDARD TABLE OF ty_completion_resobj_choices WITH DEFAULT KEY,

    BEGIN OF ty_completion_resobj_usage,
      completion_tokens TYPE i,
      prompt_tokens     TYPE i,
      total_tokens      TYPE i,
    END OF ty_completion_resobj_usage.

************************* CHAT COMPLETION Data Types - INTERNAL ***********************
  TYPES:
    BEGIN OF ty_chatcompl_resobj_choices,
      text          TYPE string,
      index         TYPE i,
      finish_reason TYPE string,
      message       TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_message,
    END OF ty_chatcompl_resobj_choices,
    tty_chatcompl_resobj_choices TYPE STANDARD TABLE OF ty_chatcompl_resobj_choices WITH DEFAULT KEY.

************************* DEPLOYMENTS Data Types - INTERNAL ***********************
* https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments
  TYPES:
    BEGIN OF ty_scale_settings,
      capacity   TYPE i,
      scale_type TYPE string,
    END OF ty_scale_settings.


************************* FILES Data Types - INTERNAL ***********************
  TYPES:
    BEGIN OF ty_int_file_stats,
      tokens   TYPE i,
      examples TYPE i,
    END OF ty_int_file_stats,

    BEGIN OF ty_int_file_upload,
      prompt     TYPE string,
      completion TYPE string,
    END OF ty_int_file_upload.

************************* FINETUNES Data Types - INTERNAL ***********************
  TYPES:
    BEGIN OF ty_int_finetune_event,
      created_at TYPE i,
      level      TYPE string,
      message    TYPE string,
      object     TYPE string,
    END OF ty_int_finetune_event,

    BEGIN OF ty_int_finetune_hyperparams,
      batch_size                     TYPE i,
      classification_betas           TYPE STANDARD TABLE OF i WITH DEFAULT KEY,
      classification_n_classes       TYPE i,
      classification_positive_class  TYPE string,
      compute_classification_metrics TYPE abap_bool,
      learning_rate_multiplier       TYPE i,
      n_epochs                       TYPE i,
      prompt_loss_weight             TYPE i,
    END OF ty_int_finetune_hyperparams.



ENDINTERFACE.
