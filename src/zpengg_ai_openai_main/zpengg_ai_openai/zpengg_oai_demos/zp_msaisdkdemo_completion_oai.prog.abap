*&---------------------------------------------------------------------*
*& Report ZP_MSAISDKDEMO_COMPLETION_OAI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_msaisdkdemo_completion_oai.
INCLUDE zp_msaisdkdemo_params_top_oai.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )

PARAMETERS:
  p_depid  TYPE string OBLIGATORY LOWER CASE DEFAULT 'text-davinci-003',
  p_length TYPE i OBLIGATORY DEFAULT 1500.

DATA:
  g_text_input       TYPE REF TO cl_gui_textedit,
  g_container_input  TYPE REF TO cl_gui_custom_container,
  str_input          TYPE string,
  g_text_output      TYPE REF TO cl_gui_textedit,
  g_container_output TYPE REF TO cl_gui_custom_container,
  str_output         TYPE string,
  g_ok_code          LIKE sy-ucomm.

DATA:
  completions_input  TYPE zif_peng_azoai_sdk_types=>ty_completion_input,
  completions_output TYPE zif_peng_azoai_sdk_types=>ty_completion_output.

START-OF-SELECTION.
  TRY.
* Create instance of the SDK
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                          api_version = p_ver
                                                          api_base    = p_url
                                                          api_type    = zif_peng_azoai_sdk_constants=>c_apitype-openai
                                                          api_key     = p_key
                                                        ).


      CALL SCREEN 9000.

    CATCH zcx_peng_azoai_sdk_exception INTO DATA(_ex).
      MESSAGE _ex TYPE 'I'.
  ENDTRY.
*&---------------------------------------------------------------------*
*&      Module  PBO  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pbo OUTPUT.

  IF g_text_input IS INITIAL.


* Create Input Controls....
*   create control container
    CREATE OBJECT g_container_input
      EXPORTING
        container_name              = 'TXTINPUT'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5.
    IF sy-subrc NE 0.
*      add your handling
    ENDIF.

    CREATE OBJECT g_text_input
      EXPORTING
        parent                     = g_container_input
        wordwrap_mode              = cl_gui_textedit=>wordwrap_at_fixed_position
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true
      EXCEPTIONS
        OTHERS                     = 1.
    IF sy-subrc NE 0.
      CALL FUNCTION 'POPUP_TO_INFORM'
        EXPORTING
          titel = 'Could not create input textbox'.

    ENDIF.


* Create Output Controls...
*   create control container
    CREATE OBJECT g_container_output
      EXPORTING
        container_name              = 'TXTOUTPUT'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5.
    IF sy-subrc NE 0.
*      add your handling
    ENDIF.

    CREATE OBJECT g_text_output
      EXPORTING
        parent                     = g_container_output
        wordwrap_mode              = cl_gui_textedit=>wordwrap_at_fixed_position
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true
      EXCEPTIONS
        OTHERS                     = 1.
    IF sy-subrc NE 0.
      CALL FUNCTION 'POPUP_TO_INFORM'
        EXPORTING
          titel = 'Could not create Output textbox'.
    ENDIF.




  ENDIF.


ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  PAI  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pai INPUT.
*  BREAK gonair.
  CASE g_ok_code.
    WHEN 'ASKAI'.

      CONSTANTS: c_line_length TYPE i VALUE 256.

* define table type for data exchange
      TYPES: BEGIN OF mytable_line,
               line(c_line_length) TYPE c,
             END OF mytable_line.

* table to exchange text
      DATA g_mytable TYPE TABLE OF mytable_line.

      CLEAR:
        str_input,
        str_output,
        g_mytable,
        completions_input,
        completions_output.




      g_text_input->get_text_as_r3table(
        IMPORTING
          table                  =  g_mytable                " text as R/3 table
      ).
      CALL METHOD cl_gui_cfw=>flush
        EXCEPTIONS
          OTHERS = 1.
      LOOP AT g_mytable ASSIGNING FIELD-SYMBOL(<fs_line>).
        str_input = |{ str_input }{ <fs_line>-line }{ cl_abap_char_utilities=>newline }|.
      ENDLOOP.


      APPEND str_input TO completions_input-prompt.
      completions_input-max_tokens = p_length.

      sdk_instance->completions( )->create(
      EXPORTING
        deploymentid = p_depid
        prompts      = completions_input
      IMPORTING
        statuscode   = status_code
        statusreason = status_reason
        json         = returnjson
        response     = completions_output
        error        = error
    ).

      LOOP AT completions_output-choices ASSIGNING FIELD-SYMBOL(<fs_outputtext>).
        str_output = |{ str_output }{ <fs_outputtext>-text }|.
      ENDLOOP.

      g_text_output->set_textstream(
        EXPORTING
          text                   = str_output                 " Text as String with Carriage Returns and Linefeeds
      ).

    WHEN 'ECAN' OR 'ENDE'.
      LEAVE PROGRAM.

  ENDCASE.


ENDMODULE.
