*&---------------------------------------------------------------------*
*& Report zp_aisdkdemo_chatcompl_simple
*&---------------------------------------------------------------------*
* Program        : ZP_AISDKDEMO_CHATCOMPL
* Created by     : Monalisa Biswal
* Date           : Oct 09, 2023
*-------------------------------------------------------------------------------------------------------------
* Description
*-------------------------------------------------------------------------------------------------------------
*This program is a demo designed to test the Chat Completion utility of the AI SDK.
*It provides a user-friendly interface for passing data to the AI SDK,
*including system messages to set up the AI Assistant, user query text to convey the user's requirements,
*and parameters such as temperature, TopP, stop sequence, frequency penalty, and presence penalty,
*which control the generation of AI responses.
*Additionally, there are several templates available for setting up the AI Assistant.
*Users can save their queries to a file and reload them for further testing at a later time..
*-------------------------------------------------------------------------------------------------------------
*                       Modification History
*-------------------------------------------------------------------------------------------------------------
* Oct 09, 2023 // Monalisa Biswal // Initial Version
*****************************************************************************************************************
REPORT ZP_AISDKDEMO_CHATCOMPL.

include zp_msaisdkdemo_common.     "Common Data Declaration
include zp_msaisdkdemo_chatui_top. "Data Declaration for Chat Completion UI fields
include zp_msaisdkdemo_selection.  "Selection Screen for Open AI deployment Details
include zp_msaisdkdemo_chatui_def. "Default Values for Chat Completion UI
include zp_msaisdkdemo_chatui.     "Chat Completion UI Screen generation logic

data:
  chatcompl_input  type zif_peng_azoai_sdk_types=>ty_chatcompletion_input,
  chatcompl_output type zif_peng_azoai_sdk_types=>ty_chatcompletion_output.
data : g_aidemo_screen type ref to lcl_aidemo_screen.

start-of-selection.

  try.
* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-azure
                                                            api_key     = p_key
                                                          ).
      create object g_aidemo_screen.
      call screen 9000.

    catch zcx_peng_azoai_sdk_exception into data(ex). " MSPENG:Azure Open AI ABAP SDK Exception
      message ex type 'I'.

    catch cx_root.
      message |An error occured - perhaps the model name is incorrect? Or Access key is incorrect?| type 'I'.
  endtry.


*&---------------------------------------------------------------------*
*&      Module  PBO  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module pbo output.

  g_aidemo_screen->generate_ui( ).
endmodule.
*&---------------------------------------------------------------------*
*&      Module  PAI  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module pai input.
*  BREAK gonair.
  case g_ok_code.
    when 'ASKAI'.
      clear: chatcompl_input,
      chatcompl_output.
      g_aidemo_screen->get_param_values( ).
      g_aidemo_screen->get_prompt_sys_text( ).

*      chatcompl_input-max_tokens = p_length.
* User's Input for System Message provide with role System
      append initial line to chatcompl_input-messages assigning field-symbol(<fs_message>).
      <fs_message>-role = zif_peng_azoai_sdk_constants=>c_chatcompletion_role-system.
      <fs_message>-content = g_sys_input.
* User's Input for Prompt provide with role User
      append initial line to chatcompl_input-messages assigning <fs_message>.
      <fs_message>-role = zif_peng_azoai_sdk_constants=>c_chatcompletion_role-user.
      <fs_message>-content = g_str_input.
* Parameters
      chatcompl_input-temperature    = g_temp_val.  "Temperature - Controls randomness.
      chatcompl_input-top_p          = g_topt_val.  "Top probabilities  - Controls randomness.
      if g_stop_val is not initial.
        append g_stop_val to chatcompl_input-stop.   "Make responses stop at a desired point, such as the end of a sentence or list
      endif.
      chatcompl_input-frequency_penalty  = g_freq_val."Reduce the chance of repeating a token proportionally based on how often it has appeared in the text so far
      chatcompl_input-presence_penalty = g_pres_val.  "Reduce the chance of repeating any token that has appeared in the text at all so far
*     Invoke Chat completion.
      sdk_instance->chat_completions( )->create(
        exporting
          deploymentid = p_depid
          prompts      = chatcompl_input
        importing
          statuscode   = status_code                  " Status Code
          statusreason = status_reason                " HTTP status description
          json         = returnjson                   " JSON String returned from AI Resource
          response     = chatcompl_output
          error        = error                        " ABAP Ready error details
      ).


*      LOOP AT completions_output-choices ASSIGNING FIELD-SYMBOL(<fs_outputtext>).
*        str_output = |{ str_output }{ <fs_outputtext>-text }|.
*      ENDLOOP.
* Set response in Assistant's Output Text Editor
      g_text_output->set_textstream(
        exporting
          text                   = chatcompl_output-choices[ 1 ]-message-content "str_output                 " Text as String with Carriage Returns and Linefeeds
      ).
*   cl_demo_output=>display_html( html = chatcompl_output-choices[ 1 ]-message-content ).

    when OTHERS."'ECAN' or 'ENDE'.
      leave program.

  endcase.


endmodule.
