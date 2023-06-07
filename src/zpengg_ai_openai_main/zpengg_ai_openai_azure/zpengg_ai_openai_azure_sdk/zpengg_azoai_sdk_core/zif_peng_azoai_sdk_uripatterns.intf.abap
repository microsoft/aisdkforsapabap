INTERFACE zif_peng_azoai_sdk_uripatterns
  PUBLIC .

  CONSTANTS:

    BEGIN OF supported_protocols,
      https TYPE string VALUE 'https://',
    END OF supported_protocols,

    BEGIN OF template_ids,
      endpoint     TYPE string VALUE '{endpoint}',
      version      TYPE string VALUE '{version}',
      deploymentid TYPE string VALUE '{deployment-id}',
      modelid      TYPE string VALUE '{model-id}',
      fileid       TYPE string VALUE '{file-id}',
      finetuneid   TYPE string VALUE '{fine-tune-id}',
    END OF template_ids,

*   This is the endpoint ID. In future, if the end point remains the same, we will map this ID to version.
*   This allows us to not define the same end point repeatedly.
    BEGIN OF version_20221201_endpoint,

*     Deployment End points (https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments)
      BEGIN OF deployments,
        create TYPE string VALUE '{endpoint}/openai/deployments?api-version={version}'                      ,   "HTTP - POST.
        delete TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}?api-version={version}'      ,   "HTTP - DELETE
        get    TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}?api-version={version}'      ,   "HTTP - GET
        list   TYPE string VALUE '{endpoint}/openai/deployments?api-version={version}'                      ,   "HTTP - GET.
        update TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}?api-version={version}'      ,   "HTTP - PATCH
      END OF deployments,


*     Model end points (https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/models)
      BEGIN OF model,
        get  TYPE string VALUE '{endpoint}/openai/models/{model-id}?api-version={version}'                  ,   "HTTP - GET
        list TYPE string VALUE '{endpoint}/openai/models?api-version={version}'                             ,   "HTTP - GET
      END OF model,

*     Files end points ( https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/files)
      BEGIN OF files,
        delete      TYPE string VALUE '{endpoint}/openai/files/{file-id}?api-version={version}',
        get         TYPE string VALUE '{endpoint}/openai/files/{file-id}?api-version={version}',
        get_content TYPE string VALUE '{endpoint}/openai/files/{file-id}/content?api-version={version}',
        import      TYPE string VALUE '{endpoint}/openai/files/import?api-version={version}',
        list        TYPE string VALUE '{endpoint}/openai/files?api-version={version}',
        upload      TYPE string VALUE '{endpoint}/openai/files?api-version={version}',
      END OF files,

*    Fine tunes end points (https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/fine-tunes)
      BEGIN OF finetunes,
        cancel TYPE string VALUE '{endpoint}/openai/fine-tunes/{fine-tune-id}/cancel?api-version={version}' ,   "HTTP - POST
        create TYPE string VALUE '{endpoint}/openai/fine-tunes?api-version={version}'                       ,   "HTTP - POST
        delete TYPE string VALUE '{endpoint}/openai/fine-tunes/{fine-tune-id}?api-version={version}'        ,   "HTTP - DELETE
        get    TYPE string VALUE '{endpoint}/openai/fine-tunes/{fine-tune-id}?api-version={version}'        ,   "HTTP - GET
        events TYPE string VALUE '{endpoint}/openai/fine-tunes/{fine-tune-id}/events?api-version={version}' ,   "HTTP - GET
        list   TYPE string VALUE '{endpoint}/openai/fine-tunes?api-version={version}'                       ,   "HTTP - GET
      END OF finetunes,

      BEGIN OF completions,
        create TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}/completions?api-version={version}', "HTTP - POST
      END OF completions,

      BEGIN OF embeddings,
        create TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}/embeddings?api-version={version}',  "HTTP - POST
      END OF embeddings,
    END OF version_20221201_endpoint,

    BEGIN OF version_2023_03_15_preview,
      BEGIN OF completions,
        create TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}/chat/completions?api-version={version}', "HTTP - POST
      END OF completions,
      BEGIN OF chat_completions,
        create TYPE string VALUE '{endpoint}/openai/deployments/{deployment-id}/chat/completions?api-version={version}', "HTTP - POST
      END OF chat_completions,
    END OF version_2023_03_15_preview.

ENDINTERFACE.
