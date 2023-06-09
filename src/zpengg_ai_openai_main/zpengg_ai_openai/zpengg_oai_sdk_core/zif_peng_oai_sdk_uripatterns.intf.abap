INTERFACE zif_peng_oai_sdk_uripatterns
  PUBLIC .

  CONSTANTS:

*   This is the endpoint ID. In future, if the end point remains the same, we will map this ID to version.
*   This allows us to not define the same end point repeatedly.
    BEGIN OF version_v1_endpoint,

*     Model end points (https://platform.openai.com/docs/api-reference/models)
      BEGIN OF model,
        get  TYPE string VALUE '{endpoint}/{version}/models/{model-id}'                  ,   " GET  "https://api.openai.com/v1/models/{model}
        list TYPE string VALUE '{endpoint}/{version}/models'                             ,   " GET  "https://api.openai.com/v1/models
      END OF model,


*     Files end points ( https://platform.openai.com/docs/api-reference/files)
      BEGIN OF files,
        list        TYPE string VALUE '{endpoint}/{version}/files'                      ,   " GET       https://api.openai.com/v1/files
        upload      TYPE string VALUE '{endpoint}/{version}/files'                      ,   " POST      https://api.openai.com/v1/files
        delete      TYPE string VALUE '{endpoint}/{version}/files/{file-id}'            ,   " DELETE    https://api.openai.com/v1/files/{file_id}
        get         TYPE string VALUE '{endpoint}/{version}/files/{file-id}'            ,   " GET       https://api.openai.com/v1/files/{file_id}
        get_content TYPE string VALUE '{endpoint}/{version}/files/{file-id}/content'    ,   " GET       https://api.openai.com/v1/files/{file_id}/content
      END OF files,

*    Fine tunes end points (https://platform.openai.com/docs/api-reference/fine-tunes)
      BEGIN OF finetunes,
        create TYPE string VALUE '{endpoint}/{version}/fine-tunes'                       ,   " POST      https://api.openai.com/v1/fine-tunes
        list   TYPE string VALUE '{endpoint}/{version}/fine-tunes'                       ,   " GET       https://api.openai.com/v1/fine-tunes
        get    TYPE string VALUE '{endpoint}/{version}/fine-tunes/{fine-tune-id}'        ,   " GET       https://api.openai.com/v1/fine-tunes/{fine_tune_id}
        cancel TYPE string VALUE '{endpoint}/{version}/fine-tunes/{fine-tune-id}/cancel' ,   " POST      https://api.openai.com/v1/fine-tunes/{fine_tune_id}/cancel
        events TYPE string VALUE '{endpoint}/{version}/fine-tunes/{fine-tune-id}/events' ,   " GET       https://api.openai.com/v1/fine-tunes/{fine_tune_id}/events
        delete TYPE string VALUE '{endpoint}/{version}/models/{fine-tune-id}'            ,   " DELETE    https://api.openai.com/v1/models/{model}
      END OF finetunes,

      BEGIN OF completions,
        create TYPE string VALUE '{endpoint}/{version}/completions', "POST https://api.openai.com/v1/completions
      END OF completions,

      BEGIN OF embeddings,
        create TYPE string VALUE '{endpoint}/{version}/embeddings',  "POST https://api.openai.com/v1/embeddings
      END OF embeddings,

      BEGIN OF chat_completions,
        create TYPE string VALUE '{endpoint}/{version}/chat/completions', "POST https://api.openai.com/v1/chat/completions
      END OF chat_completions,
    END OF version_v1_endpoint.

ENDINTERFACE.
