INTERFACE zif_peng_azoai_sdk_constants
  PUBLIC .


  CONSTANTS:

*   Version Strings currently supported by Azure Open AI.
    BEGIN OF c_versions,
      v_2022_12_01         TYPE string VALUE '2022-12-01',
      v_2023_03_15_preview TYPE string VALUE '2023-03-15-preview',
      v_2023_05_15         TYPE string VALUE '2023-05-15',
      v_2023_06_01_preview TYPE string VALUE '2023-06-01-preview',
      v_2023_07_01_preview TYPE string VALUE '2023-07-01-preview',
      v_2023_08_01_preview TYPE string VALUE '2023-08-01-preview',
    END OF c_versions,


*   List of component identifiers/names. This is used internally for interaction and initialization of AI components.
    BEGIN OF c_component_type,
      sdk              TYPE string VALUE 'SDK',
      config           TYPE string VALUE 'CONFIG',
      helper           TYPE string VALUE 'HELPER',
      model            TYPE string VALUE 'MODEL',
      deployment       TYPE string VALUE 'DEPLOYMENT',
      completions      TYPE string VALUE 'COMPLETIONS',
      chat_completions TYPE string VALUE 'CHAT_COMPLETIONS',
      file             TYPE string VALUE 'FILE',
      fine_tuning      TYPE string VALUE 'FINETUNING',
      embeddings       TYPE string VALUE 'EMBEDDINGS',
    END OF c_component_type,

*   Operations supported by components. NOTE: This is an exhaustive list of operations by all components. Not all operations
*   are supported by every component.
    BEGIN OF c_component_operations,
      cancel      TYPE string VALUE 'CANCEL',
      create      TYPE string VALUE 'CREATE',
      delete      TYPE string VALUE 'DELETE',
      get         TYPE string VALUE 'GET',
      get_content TYPE string VALUE 'GET_CONTENT',
      get_events  TYPE string VALUE 'GET_EVENTS',
      import      TYPE string VALUE 'IMPORT',
      initialize  TYPE string VALUE 'INITIALIZE',
      list        TYPE string VALUE 'LIST',
      update      TYPE string VALUE 'UPDATE',
      upload      TYPE string VALUE 'UPLOAD',
    END OF c_component_operations,

    BEGIN OF c_component_classification,
      core      TYPE string VALUE 'CORE',
      submodule TYPE string VALUE 'SUBMODULE',
    END OF c_component_classification,


*   open AI resource identifier.
    c_azure_openairesource TYPE string VALUE '.openai.azure.com',
    c_openairesource       TYPE string VALUE 'api.openai.com',

*   File purpose.
    BEGIN OF c_filepurpose,
      finetune       TYPE string VALUE 'fine-tune',
      finetuneresult TYPE string VALUE 'fine-tune-results',
    END OF c_filepurpose,

    c_file_upload_boundary TYPE string VALUE '----MSPlatformEngineering{guid}',

*   API Authentication strategies currently supported.
    BEGIN OF c_apitype,
      azure    TYPE string VALUE 'azure',
      azure_ad TYPE string VALUE 'azure_ad',
      openai   TYPE string VALUE 'openai',
    END OF c_apitype,


*  API Authentication Header Parameter values
*  Author Side NOTE : Wish there were ENums in ECC - but unfortunately, its only available in S4.
    BEGIN OF c_authheader_paramnames,
      api_key       TYPE string VALUE 'api-key',
      authorization TYPE string VALUE 'Authorization',
      bearer        TYPE string VALUE 'Bearer',
    END OF c_authheader_paramnames,

*  Operational parameter names. This will be used for passing in operational params during config initialization.
    BEGIN OF c_operational_paramnames,
      version     TYPE string VALUE 'version',
      endpoint    TYPE string VALUE 'endpoint',
      destination TYPE string VALUE 'destination',
      apitype     TYPE string VALUE 'apitype',
      apikey      TYPE string VALUE 'apikey',
    END OF c_operational_paramnames,

*   Central Control Class Name.
    c_central_control_class    TYPE string VALUE 'ZCL_PENG_AZOAI_CENTRALCONTROL',
    c_sdk_default_profile_name TYPE zde_azoaisdk_profileid VALUE 'DEFAULT',

    BEGIN OF c_urltemplateproviders,
      azureopenai TYPE string VALUE 'zcl_peng_azoai_urlprovider',
      openai      TYPE string VALUE 'zcl_peng_oai_urlprovider',
    END OF c_urltemplateproviders,

    BEGIN OF c_chatcompletion_role,
      user      TYPE string VALUE 'user',
      assistant TYPE string VALUE 'assistant',
      system    TYPE string VALUE 'system',
    END OF c_chatcompletion_role.





ENDINTERFACE.
