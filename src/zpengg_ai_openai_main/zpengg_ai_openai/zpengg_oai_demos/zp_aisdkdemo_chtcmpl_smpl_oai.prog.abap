*&---------------------------------------------------------------------*
*& Report ZP_AISDKDEMO_CHTCMPL_SMPL_OAI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_aisdkdemo_chtcmpl_smpl_oai.
INCLUDE zp_msaisdkdemo_params_top_oai.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )

PARAMETERS:
    p_depid  TYPE string OBLIGATORY LOWER CASE.

DATA:
  chatcompl_input  TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_input,
  chatcompl_output TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_output.


START-OF-SELECTION.

  TRY.
* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-openai
                                                            api_key     = p_key
                                                          ).

*     Construct the prompt with system and user roles.
      APPEND INITIAL LINE TO chatcompl_input-messages ASSIGNING FIELD-SYMBOL(<fs_message>).
      <fs_message>-role = zif_peng_azoai_sdk_constants=>c_chatcompletion_role-system.
      <fs_message>-content = |You are an expert ABAP Developer|.

      APPEND INITIAL LINE TO chatcompl_input-messages ASSIGNING <fs_message>.
      <fs_message>-role = zif_peng_azoai_sdk_constants=>c_chatcompletion_role-user.
      <fs_message>-content = |Write an ABAP program which gets contents from www.microsoft.com website. Include comments in the code so that anyone can understand the code.|.

*     Invoke Chat completion.
      sdk_instance->chat_completions( )->create(
        EXPORTING
          deploymentid = p_depid
          prompts      = chatcompl_input
        IMPORTING
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          response     = chatcompl_output
          error        = error                        " ABAP Ready error details
      ).

*     Display the results.
      cl_demo_output=>display_text( text = chatcompl_output-choices[ 1 ]-message-content ).

    CATCH zcx_peng_azoai_sdk_exception INTO DATA(ex). " MSPENG:Azure Open AI ABAP SDK Exception
      MESSAGE ex TYPE 'I'.

    CATCH cx_root.
      MESSAGE |An error occured - perhaps the model name is incorrect? Or Access key is incorrect?| TYPE 'I'.

  ENDTRY.
