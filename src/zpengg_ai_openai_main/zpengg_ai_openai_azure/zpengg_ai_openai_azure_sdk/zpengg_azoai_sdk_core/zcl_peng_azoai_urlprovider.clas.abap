CLASS zcl_peng_azoai_urlprovider DEFINITION
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



CLASS zcl_peng_azoai_urlprovider IMPLEMENTATION.


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

                                      "MODEL component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-model-list )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-model-get  )

                                      "DEPLOYMENTS component  - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-deployments-create )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-deployments-delete  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-deployments-get  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-deployments-list  )

                                      "FILES component  - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-delete  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-get  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_content access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-get_content )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-import access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-import )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-list  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-upload access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-files-upload )

                                      "FINETUNES component  - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-cancel access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-cancel )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-create )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-delete access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-delete  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-get  )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-get_events access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-events )
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-list access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-finetunes-list  )

                                      "EMBEDDINGS component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-embeddings-create )

                                      "COMPLETIONS (GPT-3) component - Azure Open AI
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_azoai_sdk_uripatterns=>version_20221201_endpoint-completions-create )

                                      "CHAT COMPLETIONS (GPT-4) component - Azure Open AI
                                      "NOTE : This end point is invalid for older versions (eg: 2022-12-01). However, we control this in component instantiation - so, a more complex check is not needed here.
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                      ( operation = zif_peng_azoai_sdk_constants=>c_component_operations-create access_url = zif_peng_azoai_sdk_uripatterns=>version_2023_03_15_preview-chat_completions-create )
                                    ).
  ENDMETHOD.

ENDCLASS.
