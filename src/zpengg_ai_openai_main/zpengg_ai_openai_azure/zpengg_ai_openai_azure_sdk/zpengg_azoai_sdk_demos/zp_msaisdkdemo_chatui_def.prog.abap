*&---------------------------------------------------------------------*
*&  Include           ZP_MSAISDKDEMO_CHATUI_DEF
* Provide Defaults for UI Elements
*&---------------------------------------------------------------------*


 gv_temp_info =
 |It controls randomness. | &&
 |Lowering the temperature means that the model will produce more repetitive and deterministic responses. | &&
 |Increasing the temperature will result in more unexpected or creative responses. | &&
 |Try adjusting temperature or Top P but not both.|.
 gv_topp_info = |Similar to temperature, this controls randomness but uses a different method. | &&
 |Lowering Top P will narrow the model’s token selection to likelier tokens. | &&
 |Increasing Top P will let the model choose from tokens with both high and low likelihood.| &&
 |Try adjusting temperature or Top P but not both.|.
 gv_stop_info = |Make the model end its response at a desired point.  |  &&
 |Make the model end its response at a desired point.  | &&
 |You can include as many as four stop sequences.  | .
 gv_pres_info = |Reduce the chance of repeating any token that has appeared in the text at all so far. | &&
 | This increases the likelihood of introducing new topics in a response. | .
 gv_freq_info = |Reduce the chance of repeating a token proportionally based on how often it has appeared in the text so far.| &&
 |This decreases the likelihood of repeating the exact same text in a response.|.

 g_templtable = value #(  ( key = 1 temp_name = 'Empty Template' temp_text = value #( ( lineno = 1 text_line = '' ) ) )
  ( key = 2 temp_name = 'Default Template'
 temp_text = value #( ( lineno = 1 text_line = 'You are an AI assistant that helps people find information.' ) ) )
 ( key = 3 temp_name = 'JSON Formatter Assistant'
 temp_text = value #( ( lineno = 1 text_line = 'You are an AI assistant that helps users turn a natural language list into JSON format.' ) ) )
 ( key = 4 temp_name = 'ABAP Developer Assistant'
 temp_text = value #( ( lineno = 1 text_line = 'You are an AI assistant that helps people with ABAP syntax.' )
                      ( lineno = 2 text_line = 'User will provide requirement in natural language.' )
                      ( lineno = 3 text_line = 'You will provide ABAP code for implementing that requirement.' ) ) )
( key = 5 temp_name = 'ABAP Documentation Assistant'
 temp_text =
 value #( ( lineno = 1 text_line = 'You are an AI assistant that explains ABAP Code.' )
          ( lineno = 2 text_line = 'User will provide an ABAP program.' )
          ( lineno = 3 text_line = 'You will explain ABAP code in natural language.' )
          ( lineno = 4 text_line = 'Add sections with headings for explaining multiple line of code' ) ) )

 ( key = 6 temp_name = 'Summarization Template'
 temp_text = value #( ( lineno = 1 text_line = 'You are an AI assistant that helps people ' )
 ( lineno = 2 text_line = 'to generate abstractive summaries of texts.' )
 ( lineno = 3 text_line = 'Based on users input you can generate summary as keypoints or paragraph' )
  )
 ) ).

 g_item_table = value #(  for l_tempstruct in g_templtable ( key = l_tempstruct-key
                      text = l_tempstruct-temp_name )
                   ).
