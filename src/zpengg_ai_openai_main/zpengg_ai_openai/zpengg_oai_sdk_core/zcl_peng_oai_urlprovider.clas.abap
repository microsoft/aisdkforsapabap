CLASS zcl_peng_oai_urlprovider DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_aisdk_templprov_base
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      zif_peng_aisdk_endpt_provider~initialize REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS _loadendpoints.
ENDCLASS.



CLASS zcl_peng_oai_urlprovider IMPLEMENTATION.


  METHOD zif_peng_aisdk_endpt_provider~initialize.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_URLPROVIDER
* Method         : zif_peng_aisdk_endpt_provider~initialize
* Created by     : GONAIR (Gopal Nair)
* Date           : Jun 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Initialize the URL provider
* This method is called by AI SDK core to initialize the URL provider. It passes in a version ID. The version
* may/maynot play a role in the URL end point, but its there to use.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 5, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
*   Azure Open AI is at this time, version independent for access end point. Hence, we are not going to use the version in our look up dictionary.
    super->zif_peng_aisdk_endpt_provider~initialize(
      EXPORTING
        api_version       = api_version                  " Version ID
        additional_params = additional_params            " Any additional parameters
    ).

*   Load the end points for Azure Open AI.
    _loadendpoints(  ).

  ENDMETHOD.


  METHOD _loadendpoints.
    REFRESH _t_endpoint_dictionary.
    _t_endpoint_dictionary = VALUE #(
                                      version = _version

                                      "MODEL component - Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list           access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-model-list )         "Model - List
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get            access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-model-get  )         "Model - Get

                                      "FILES component  - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list           access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-files-list  )        "File - List
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-upload         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-files-upload )       "File - Upload
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-files-delete  )      "File - Delete
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get            access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-files-get  )         "File - Get
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_content    access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-files-get_content )  "File - Get Content

                                      "FINETUNES component  - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-create )   "FineTunes - Create
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list           access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-list  )    "FineTunes - List
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get            access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-get  )     "FineTunes - Get
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-cancel         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-cancel )   "FineTunes - Cancel
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_events     access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-events )   "FineTunes - Events
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-finetunes-delete  )  "FineTunes - Delete


                                      "EMBEDDINGS component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-embeddings-create )

                                      "COMPLETIONS (GPT-3) component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-completions-create )

                                      "CHAT COMPLETIONS (GPT-4) component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create         access_url = zif_peng_oai_sdk_uripatterns=>version_v1_endpoint-chat_completions-create )
                                    ).
  ENDMETHOD.

ENDCLASS.
