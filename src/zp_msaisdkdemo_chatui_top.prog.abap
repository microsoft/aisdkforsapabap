*&---------------------------------------------------------------------*
*&  Include           ZP_MSAISDKDEMO_CHATUI_TOP
*&---------------------------------------------------------------------*

 constants: c_line_length type i value 256.

 constants : c_label_width     type i value 15,
             c_parameter1_text type string
                                 value ' 0 - 1',
             c_parameter2_text type string value ' 0 - 2', " (0.10,0.11,0.20,..1.9, 2 etc. )',
             c_parameter3_text type string value 'e.g. <|im_end|> ',
             c_def_aitext      type string value 'You are an AI Assistant that helps people find information.'.
* define table type for data exchange
 types: begin of  mytable_line,
          line(c_line_length) type c,
        end of mytable_line .
        TYPES: BEGIN OF t_text,
          lineno TYPE i,
          text_line type string ,
       END OF t_text,
       t_text_tab TYPE STANDARD TABLE OF t_text with NON-UNIQUE key lineno .
 types : begin of template_type,
           key type i,
           temp_name type string,
           temp_text     type t_text_tab ,
         end of template_type.
* table to exchange text
 data g_templtable TYPE TABLE OF template_type.
 data g_mytable type table of mytable_line.
 data g_systable type table of mytable_line.
 data: g_templates type table of template_type,w_template type template_type.
     data:  g_item_table  TYPE  VRM_VALUES," INITIAL SIZE 0,
      g_ITEM_STRUCT TYPE  VRM_VALUE.
 data : gv_txt_temp type string value 'Use a template to get started, or just start writing your own system message below.'.
 data: gv_temp_info type string,
       gv_topp_info type string,
       gv_stop_info type string,
       gv_freq_info type string,
       gv_pres_info type string.

 data:
   g_text_input   type ref to cl_gui_textedit, "Text Editor for taking user's input
   g_sysmsg_input type ref to cl_gui_textedit, "Text Editor for System Message
   g_input_temp   type ref to cl_gui_input_field, "Text field for Temperature
   g_input_topp   type ref to cl_gui_input_field, "Text field for TopP
   g_input_stop   type ref to cl_gui_input_field, "Text field for Stop Sequence
   g_input_freq   type ref to cl_gui_input_field, "Text field for Frequency Penalty
   g_input_pres   type ref to cl_gui_input_field, "Text field for Presence Penalty
   g_systemp_sel  type ref to cl_gui_combobox,

   label_ec_input type string,
   g_str_input    type string,
   g_sys_input    type string,
   g_text_output  type ref to cl_gui_textedit,
   g_str_output   type string,
   g_ok_code      like sy-ucomm,

*   n                 TYPE i,                         "How many chat completion choices to generate for each input message

   g_temp_val     type string, " Temperature
   g_topt_val     type string, " Topt
   g_stop_val     type string, " Stop Sequence
   g_freq_val     type string, " Frequency Penalty
   g_pres_val     type string. " Presence Penalty
