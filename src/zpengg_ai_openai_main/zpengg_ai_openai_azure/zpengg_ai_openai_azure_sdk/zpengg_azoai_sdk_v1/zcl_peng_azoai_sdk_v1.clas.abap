"! <p class="shorttext synchronized" lang="en">MSPENG:Azure Open AI ABAP SDK</p>
CLASS zcl_peng_azoai_sdk_v1 DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_sdk_base
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      zif_peng_azoai_sdk~initialize  REDEFINITION,
      zif_peng_azoai_sdk~model REDEFINITION,
      zif_peng_azoai_sdk~deployments REDEFINITION,
      zif_peng_azoai_sdk~completions REDEFINITION,
      zif_peng_azoai_sdk~chat_completions REDEFINITION,
      zif_peng_azoai_sdk~files REDEFINITION,
      zif_peng_azoai_sdk~finetunes REDEFINITION,
      zif_peng_azoai_sdk~embeddings REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_peng_azoai_sdk_v1 IMPLEMENTATION.


  METHOD zif_peng_azoai_sdk~initialize.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~initialize
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* INTERNAL USE ONLY

*  Initialize the main SDK object, and return the instance. This method is not intended for public use. Rather,
* the SDK instance should always be requested from factory class : ZCL_PENG_AZOAI_SDK_FACTORY.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    DATA:
      lt_component_set        TYPE zif_peng_azoai_sdk_typinternal=>tty_component_init_param,
      ls_component_class_name TYPE string,
      lobj_component          TYPE REF TO zcl_peng_azoai_sdk_component.

    TRY.
*       Get instance of helper.
        _objhelper = zcl_peng_azoai_sdk_helper=>get_instance( ).
*       Store away the config object instance.
        _objconfig ?= config.

*       Prepare the core component sets which will be used to initialize sub-components.
        lt_component_set = VALUE #(
                                    ( component_type = zif_peng_azoai_sdk_constants=>c_component_type-config component_instance = _objconfig )  "Config Component
                                    ( component_type = zif_peng_azoai_sdk_constants=>c_component_type-sdk component_instance = me )             "SDK Instance
                                  ).


*   Instantiate AI working components.
*   Here, we use a loose coupling methodology for component instantiations. Reason is, it makes it much more easier to expand in the future.
*   Additionally, the SDK component itself is sent in, so that cross access is possible through the SDK object bridge. So, if for advanced
*   and value added use cases, we need to access deployments from model component, we can easily bridge through the sdk object. Having said that,
*   This will not be used during initial phase of the SDK development, but will be, based on use cases/ideas/brainstorming/feature requests once the base SDK matures.
        _t_subcomponents = _objhelper->get_components_for_version(
                             api_type    = _objconfig->get_apitype( )
                             api_version = _objconfig->get_apiversion(  )
                             filter      =  zif_peng_azoai_sdk_constants=>c_component_classification-submodule
                           ).

*       Initialize each sub-component, and store it away, along with its identifier.
        LOOP AT _t_subcomponents ASSIGNING FIELD-SYMBOL(<fs_subcomponent>).
          <fs_subcomponent>-component_class_name = to_upper( <fs_subcomponent>-component_class_name ).

*         Check with central controller if the component instantiation is permitted. If not permitted, the central controller will raise an exception.
*         If an exception is raised by the central controller, skip initialization of the component, and proceed to next one. If the user attempts to
*         access the component, safety check methods will intercept it, and issue exception through error handling.
          TRY.
              _objconfig->get_runprofile_handler( )->zif_peng_azoai_centralcontrol~initialize_sdkcomponent( component_type = <fs_subcomponent>-component_type ).
            CATCH zcx_peng_azoai_sdk_exception. " MSPENG:Azure Open AI ABAP SDK Exception.
              CLEAR <fs_subcomponent>-component_instance.
              CONTINUE.
          ENDTRY.

*         Create an instance of the sub-module, and trigger initialization of the component.
          CREATE OBJECT <fs_subcomponent>-component_instance TYPE (<fs_subcomponent>-component_class_name).
          lobj_component ?= <fs_subcomponent>-component_instance.
          lobj_component->zif_peng_azoai_sdk_component~initialize_component( component_set = lt_component_set  ).
        ENDLOOP.

      CATCH cx_root.
        RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
          EXPORTING
            textid = zcx_peng_azoai_sdk_exception=>component_init_failed.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_peng_azoai_sdk~model.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~model
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
*Returns the SDK Model Operation Component
*The SDK Model component is used for GPT model interaction. Following are supported:
*    1.List All models
*    2.Get details about a specific model
*
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-model ).
    model ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-model ]-component_instance.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~deployments.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~deployments
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of SDK Deployments Component
* Deployments are specific instances of a model, that can then be used for text generation. Deployments can also
* be based on fine-tuned models - which are specific models based on additional training. Following operations are
* supported by SDK (contingent on the version of AI API):
*   1.Create new Deployment
*   2.List all Deployments
*   3.Get a specific Deployment Information
*   4.Delete a deployment
*
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment ).
    deployments ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-deployment ]-component_instance.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~completions.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~completions
* Created by     : Gopal Nair
* Date           : Mar 28, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of SDK Completions Component
* Completions are actual interactions with the AI engine. This component is used to ask questions to AI engine
* through a deployment, and get the response.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Mar 28, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************

    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions ).
    completions ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-completions ]-component_instance.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~files.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~files
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of SDK Files Component
* Files component is used to interact with training and results files. The uploaded or imported files can then
* be used for fine-tuning operation, or as validation data for a fine-tuning.
*
* Following operations are supported by SDK:
*   1.Delete        : Deletes the file with the given file-id. Deletion is also allowed if a file was used,
*                       e.g., as training file in a fine-tune job.
*   2.Get           : Gets details for a single file specified by the given file-id including status,
*                       size, purpose, etc.
*   3.Get Content   : Gets the content of the file specified by the given file-id. Files can be user uploaded
*                       content or generated by the service like result metrics of a fine-tune job.
*   4.Import        : Creates a new file entity by importing data from a provided url. Uploaded files can,
*                       for example, be used for training or evaluating fine-tuned models.
*   5.List          : Gets a list of all files owned by the Azure OpenAI resource.
*   6.Upload        : Creates a new file entity by uploading data from a SAP Application Server. The file
*                       can then be used for training or evaluating fine-tuned models.
*
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-file ).
    files ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-file ]-component_instance..
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~finetunes.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~finetunes
* Created by     : Gopal Nair
* Date           : Apr 5, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of SDK Fine-Tunes component
*
* Fine-tuning is the process of tailoring available models with personal data sets. This customization step will:
*   •Higher quality results than what you can get just from prompt design
*   •The ability to train on more examples than can fit into a prompt
*   •Lower-latency requests
*
* Following fine-tuning operations are supported by SDK:
*   1.Cancel    : Cancels the processing of the fine-tune job specified by the given fine-tune-id.
*   2.Create    : Creates a job that fine-tunes a specified model from a given training file
*   3.Delete    : Deletes the fine-tune job specified by the given fine-tune-id.
*   4.Get       : Gets details for a single fine-tune job specified by the given fine-tune-id.
*   5.Get Events : Gets the events for the fine-tune job specified by the given fine-tune-id.
*   6.List      : Gets a list of all fine-tune jobs owned by the Azure OpenAI resource
*
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Apr 5, 2023 // Gopal Nair // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning ).
    finetunes ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-fine_tuning ]-component_instance..
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~chat_completions.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~chat_completions
* Created by     : Gopal Nair
* Date           : Jun 2, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instace of SDK Chat Completions component
* Chat Completions are interactions with GPT-4 models with an AI Engine.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 2, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions ).
    chat_completions ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-chat_completions ]-component_instance.
  ENDMETHOD.

  METHOD zif_peng_azoai_sdk~embeddings.
*****************************************************************************************************************
* Class          : ZCL_PENG_AZOAI_SDK_V1
* Method         : zif_peng_azoai_sdk~embeddings
* Created by     : GONAIR (Gopal Nair)
* Date           : Jun 2, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
* Returns an instance of SDK Embeddings component
* An embedding is a vector (list) of floating point numbers. The distance between two vectors measures their
* relatedness. Small distances suggest high relatedness and large distances suggest low relatedness.
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Jun 2, 2023 // GONAIR // Initial Version
*****************************************************************************************************************
    _check_component_safety( component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings ).
    embedding ?= _t_subcomponents[ component_type = zif_peng_azoai_sdk_constants=>c_component_type-embeddings ]-component_instance.
  ENDMETHOD.

ENDCLASS.
