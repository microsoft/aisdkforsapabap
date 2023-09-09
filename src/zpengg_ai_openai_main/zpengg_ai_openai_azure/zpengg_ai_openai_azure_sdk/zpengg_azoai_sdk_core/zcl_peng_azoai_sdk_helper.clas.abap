CLASS zcl_peng_azoai_sdk_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en">Creates or reuse an instance of helper class and returns it.</p>
    "! This method implements a singleton pattern. When requested for the first time, the method creates a
    "! new instance of this helper class. Future requests will return this already created instance.
    "! @parameter r_result | <p class="shorttext synchronized" lang="en">Instance of Helper Class</p>
    CLASS-METHODS get_instance
      RETURNING
        VALUE(r_result) TYPE REF TO zcl_peng_azoai_sdk_helper.

    METHODS:
      "! <p class="shorttext synchronized" lang="en">Raises an exception indicating feature was not implemented.</p>
      "! As this SDK supports different AI engines, there may be features that are not available in certain engines.
      "! Further, there may be features available in a newer version, but missing from older versions. This method
      "! is called during request processing, when such situations occur - and will raise an exception.
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      raise_feature_notimpl_ex
        RAISING
          zcx_peng_azoai_sdk_exception,

      "! <p class="shorttext synchronized" lang="en">Gets the components to be initiated for a given version.</p>
      "! The SDK employs a loose coupling of actual implementation for its components, like Model, Deployments..etc.
      "! This method returns a list of components that are appropriate for a specific api type and version.
      "! @parameter api_version | <p class="shorttext synchronized" lang="en"></p>
      "! @parameter components | <p class="shorttext synchronized" lang="en"></p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      get_components_for_version
        IMPORTING
                  api_type          TYPE string
                  api_version       TYPE string
                  filter            TYPE string  OPTIONAL "See : zif_peng_azoai_sdk_constants=>c_component_classification
        RETURNING VALUE(components) TYPE zif_peng_azoai_sdk_typinternal=>tty_component_init_param
        RAISING
                  zcx_peng_azoai_sdk_exception,

      "! <p class="shorttext synchronized" lang="en">Generate and return HTTP communication objects</p>
      "! <strong>INTERNAL USE ONLY</strong>
      "! <br/><br/>
      "! Generate and return HTTP communication objects
      "! @parameter uri_pattern | <p class="shorttext synchronized" lang="en">URI Pattern of the REST end point</p>
      "! @parameter ivobj_config | <p class="shorttext synchronized" lang="en">SDK Configuration instance</p>
      "! @parameter ivt_templatecomponents | <p class="shorttext synchronized" lang="en">URI Template components used to construct the full URL</p>
      "! @parameter ov_url | <p class="shorttext synchronized" lang="en">Resolved URL constructed from uri template and components</p>
      "! @parameter ovobj_http | <p class="shorttext synchronized" lang="en">HTTP Object</p>
      "! @parameter ovobj_http_rest | <p class="shorttext synchronized" lang="en">HTTP REST object</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      get_httpobjs_from_uripattern
        IMPORTING
          uri_pattern            TYPE string
          ivobj_config           TYPE REF TO zif_peng_azoai_sdk_config
          ivt_templatecomponents TYPE tihttpnvp OPTIONAL
        EXPORTING
          ov_url                 TYPE string
          ovobj_http             TYPE REF TO if_http_client
          ovobj_http_rest        TYPE REF TO cl_rest_http_client
        RAISING
          zcx_peng_azoai_sdk_exception,

      "! <p class="shorttext synchronized" lang="en">Retrieve the returned data from REST Endpoint communications</p>
      "! <strong>INTERNAL USE ONLY</strong>
      "! <br/><br/>
      "! Retrieve the returned data from REST Endpoint communications.
      "! @parameter ivobj_http_client | <p class="shorttext synchronized" lang="en">HTTP Client Object</p>
      "! @parameter ivobj_http_rest | <p class="shorttext synchronized" lang="en">HTTP Rest Object</p>
      "! @parameter ov_statuscode | <p class="shorttext synchronized" lang="en">Status Code</p>
      "! @parameter ov_statusdescr | <p class="shorttext synchronized" lang="en">Status Description</p>
      "! @parameter ov_jsonstring | <p class="shorttext synchronized" lang="en">Returned JSON String</p>
      "! @parameter iov_result | <p class="shorttext synchronized" lang="en">Result data (populated when API call was successful)</p>
      "! @parameter iov_error | <p class="shorttext synchronized" lang="en">Error Data (Populated when API call failed at the server)</p>
      "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
      do_receive
        IMPORTING
          ivobj_http_client TYPE REF TO if_http_client
          ivobj_http_rest   TYPE REF TO cl_rest_http_client
        EXPORTING
          ov_statuscode     TYPE i
          ov_statusdescr    TYPE string
          ov_jsonstring     TYPE string
        CHANGING
          iov_result        TYPE any
          iov_error         TYPE any
        RAISING
          zcx_peng_azoai_sdk_exception.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA:
              _instance TYPE REF TO zcl_peng_azoai_sdk_helper.

ENDCLASS.



CLASS zcl_peng_azoai_sdk_helper IMPLEMENTATION.


  METHOD do_receive.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_HELPER
* Method         : do_receive
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* INTERNAL USE ONLY
*
* Retrieve the returned data from REST Endpoint communications.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Get status and description.
    ivobj_http_client->response->get_status(
      IMPORTING
        code   = ov_statuscode                 " HTTP status code
        reason = ov_statusdescr                 " HTTP status description
    ).

    ov_jsonstring = ivobj_http_rest->if_rest_client~get_response_entity( )->get_string_data( ).


*   NOTE : The below commented code is for internal debugging purposes.
*    BREAK-POINT.
*    " Generate dynamic structure to suit the data
*    DATA(lmsg_data) = /ui2/cl_json=>generate( json = ov_jsonstring ).
*    ASSIGN lmsg_data->* TO FIELD-SYMBOL(<l_msg_data>).
*    " Deserialize the JSON string into the matching deep datatype
*    /ui2/cl_json=>deserialize( EXPORTING json = ov_jsonstring pretty_name = /ui2/cl_json=>pretty_mode-camel_case CHANGING data = <l_msg_data> ).


*   Attempt to populate interaction structures (success/error). The mapping automatically will fail for the incorrect ones....
*   We are using this strategy here, as opposed to checking status code, since the status code can vary even within a range (eg: 200 - ok, 201 - created...etc). ... so, this simplifies things.

    /ui2/cl_json=>deserialize(
                                EXPORTING
                                  json             =  ov_jsonstring   " JSON string
                                CHANGING
                                  data             =  iov_result  " Data to serialize
                                ).

    /ui2/cl_json=>deserialize(
                                  EXPORTING
                                    json             =  ov_jsonstring   " JSON string
                                  CHANGING
                                    data             =  iov_error  " Data to serialize
                             ).

  ENDMETHOD.


  METHOD get_components_for_version.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_HELPER
* Method         : get_components_for_version
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Gets the components to be initiated for a given version.
*
* The SDK employs a loose coupling of actual implementation for its components, like Model, Deployments..etc.
* This method returns a list of components that are appropriate for a specific api type and version.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

*    TODO: At a later time, when additional versions are supported, this will be dynamically constructed.
*    TODO: Get the below from a constant setting/config layer at some point.

    CASE api_version.
      WHEN
            zif_peng_azoai_sdk_constants=>c_versions-v_2022_12_01.

        components = VALUE #(
                               "SDK Core Component
                               (    component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                    component_class_name = 'ZCL_PENG_AZOAI_SDK_V1'
                               )

                               "Config Core Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-config
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_config'
                               )

                               "Model Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_model'
                               )

                               "Deployments Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_deploy'
                               )

                              "Files Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_file'
                               )

                               "FineTunes Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_finetune'
                               )

                               "Embeddings Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_embeding'
                               )

                               "Completions Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_complet'
                               )

                               "Chat Completions Worker Component - This is not supported in the version.
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_ai_sdk_chatcompl_base'
                               )

                           ).

      WHEN zif_peng_azoai_sdk_constants=>c_versions-v_2023_03_15_preview.
        components = VALUE #(
                                 "SDK Core Component
                                 (    component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                      component_class_name = 'ZCL_PENG_AZOAI_SDK_V1'
                                 )

                                 "Config Core Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-config
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_config'
                                 )

                                 "Model Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_model'
                                 )

                                 "Deployments Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_deploy'
                                 )

                                "Files Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_file'
                                 )

                                 "FineTunes Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_finetune'
                                 )

                                 "Embeddings Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_embeding'
                                 )

                                 "Completions Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_complet'
                                 )

                                 "Chat Completions Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_ai_sdk_v1_chatcomplet'
                                 )

                             ).

      WHEN
            zif_peng_azoai_sdk_constants=>c_versions-v_2023_05_15 OR
            zif_peng_azoai_sdk_constants=>c_versions-v_2023_06_01_preview OR
            zif_peng_azoai_sdk_constants=>c_versions-v_2023_07_01_preview OR
            zif_peng_azoai_sdk_constants=>c_versions-v_2023_08_01_preview.

        components = VALUE #(
                               "SDK Core Component
                               (    component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                    component_class_name = 'ZCL_PENG_AZOAI_SDK_V1'
                               )

                               "Config Core Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-config
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_config'
                               )

                               "Model Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_model'
                               )

                               "Deployments Worker Component
*                               (
*                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment
*                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
*                                    component_class_name = 'zcl_peng_azoai_sdk_v1_deploy'
*                               )

                              "Files Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_file'
                               )

                               "FineTunes Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_finetune'
                               )

                               "Embeddings Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_embeding'
                               )

                               "Completions Worker Component
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_azoai_sdk_v1_complet'
                               )

                               "Chat Completions Worker Component - This is not supported in the version.
                               (
                                    component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                    component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                    component_class_name = 'zcl_peng_ai_sdk_chatcompl_base'
                               )

                           ).

      WHEN zif_peng_oai_sdk_constants=>c_versions-v1.

        components = VALUE #(
                                 "SDK Core Component
                                 (    component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                      component_class_name = 'ZCL_PENG_AZOAI_SDK_V1'
                                 )

                                 "Config Core Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-config
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-core
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_config'
                                 )

                                 "Model Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-model
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_model'
                                 )

                                "Files Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-file
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_file'
                                 )

                                 "FineTunes Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_azoai_sdk_v1_finetune'
                                 )

                                 "Embeddings Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_oai_sdk_v1_embeding'
                                 )

                                 "Completions Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_oai_sdk_v1_complet'
                                 )

                                 "Chat Completions Worker Component
                                 (
                                      component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions
                                      component_classification = zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                                      component_class_name = 'zcl_peng_oai_sdk_v1_chatcompl'
                                 )

                             ).

      WHEN OTHERS.
        RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
          EXPORTING
            textid = zcx_peng_azoai_sdk_exception=>version_not_supported.
    ENDCASE.

*   If a filter is specified, eliminate all others. This is used during SDK spin up from factory, and again in SDK sub-component instantiation.
    IF NOT filter IS INITIAL.
      DELETE components WHERE component_classification NE filter.
    ENDIF.

  ENDMETHOD.


  METHOD get_httpobjs_from_uripattern.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_HELPER
* Method         : get_httpobjs_from_uripattern
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* INTERNAL USE ONLY
*
* Generate and return HTTP communication objects
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

*   First, we will generate the access URL from pattern and components provided.
    ov_url  = uri_pattern.

*   Do known pattern replacements (that we have to do anyways for any URL pattern)
*   TODO: When we enable OpenAPI, this sub-string will need to be driven from config layer, since the patterns are different.
    ov_url = replace( val = ov_url sub = zif_peng_azoai_sdk_uripatterns=>template_ids-endpoint with = ivobj_config->get_apibase(  )  ). "End Point replacement.
    ov_url = replace( val = ov_url sub = zif_peng_azoai_sdk_uripatterns=>template_ids-version with = ivobj_config->get_apiversion( )  ). "Version replacement.

*   Generate full URL from URI Pattern using template components provided.
    LOOP AT ivt_templatecomponents ASSIGNING FIELD-SYMBOL(<fs_templatecomponent>).
      ov_url =  replace( val = ov_url sub = <fs_templatecomponent>-name with = <fs_templatecomponent>-value  ).
    ENDLOOP.

*   Create the HTTP Objects.
    cl_http_client=>create_by_url(
      EXPORTING
        url                        =  ov_url          " URL
      IMPORTING
        client                     =  ovobj_http      " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found         = 1                " Communication parameter (host or service) not available
        plugin_not_active          = 2                " HTTP/HTTPS communication not available
        internal_error             = 3                " Internal error (e.g. name too long)
*        oa2c_set_token_error       = 4                " General error when setting the OAuth token
*        oa2c_missing_authorization = 5
*        oa2c_invalid_config        = 6
*        oa2c_invalid_parameters    = 7
*        oa2c_invalid_scope         = 8
*        oa2c_invalid_grant         = 9
        OTHERS                     = 10
    ).
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
        EXPORTING
          textid = zcx_peng_azoai_sdk_exception=>communication_failure.
    ENDIF.

*   Set the authorization header. This may be an api-key strategy, or can be a oAuth flow (bearer token) from AAD. The actual strategy was computed in config object during spin up.
    ovobj_http->request->set_header_field(
      EXPORTING
        name  = ivobj_config->get_authheader( )-name                 " Name of the header field
        value = ivobj_config->get_authheader( )-value                 " HTTP header field value
    ).

*   Create the REST object.
    ovobj_http_rest = NEW #( io_http_client = ovobj_http ).

  ENDMETHOD.


  METHOD get_instance.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_HELPER
* Method         : get_instance
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Creates or reuse an instance of helper class and returns it.
*
* This method implements a singleton pattern. When requested for the first time, the method creates a new instance
* of this helper class. Future requests will return this already created instance.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
*   Singleton pattern - only 1 instance of helper is needed in entire SDK.
    IF _instance IS INITIAL.
      CREATE OBJECT _instance.
    ENDIF.
    r_result = _instance.
  ENDMETHOD.


  METHOD raise_feature_notimpl_ex.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_HELPER
* Method         : raise_feature_notimpl_ex
* Created by     : Gopal Nair
* Date           : Apr 6, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Raises an exception indicating feature was not implemented.
*
* As this SDK supports different AI engines, there may be features that are not available in certain engines.
* Further, there may be features available in a newer version, but missing from older versions. This method is
* called during request processing, when such situations occur - and will raise an exception.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 6, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
      EXPORTING
        textid = zcx_peng_azoai_sdk_exception=>not_implemented.
  ENDMETHOD.
ENDCLASS.
