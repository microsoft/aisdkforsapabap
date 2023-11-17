*&---------------------------------------------------------------------*
*&  Include           ZP_MSAISDKDEMO_CHATUI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&  Include           ZP_MSAISDKDEMO_CHATUI
*&---------------------------------------------------------------------*

*Local Class to generate UI
class lcl_aidemo_screen definition .
  public section.
    methods:
      constructor,
      create_textedit
        importing
          container_name    type c
          wordwrap_position type i
          READONLY_MODE     type i
        changing
          textedit_ref      type ref to cl_gui_textedit,
      handle_select for event selected of cl_gui_combobox
        importing
          key,
      create_textfield
        importing
          container_name type c
          label_text     type string
          label_width    type i
          parameter_text type string
          tooltip_text   type string
        changing
          inpfield_ref   type ref to cl_gui_input_field,
      create_combobox
        importing
          container_name type c
          label_text     type string
          label_width    type i
        changing
          combobox       type ref to cl_gui_combobox,

      get_param_values,
      get_prompt_sys_text,
      generate_ui.
endclass.

class lcl_aidemo_screen implementation .
  method constructor.
  endmethod.
  method create_textedit.
    data container_ref type ref to cl_gui_custom_container.
    if textedit_ref is initial.
      create object container_ref
        exporting
          container_name              = container_name
        exceptions
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5.
      if sy-subrc ne 0.
*        add your handling
      endif.
      create object textedit_ref
        exporting
          parent                     = container_ref
          wordwrap_mode              = cl_gui_textedit=>wordwrap_at_fixed_position
          wordwrap_position          = wordwrap_position
          wordwrap_to_linebreak_mode = cl_gui_textedit=>true
        exceptions
          others                     = 1.
      if sy-subrc ne 0.
        call function 'POPUP_TO_INFORM'
          exporting
            titel = 'Could not create Output textbox'.
      else.
        call METHOD textedit_ref->SET_STATUSBAR_MODE( EXPORTING STATUSBAR_MODE = 0 ).
        call METHOD textedit_ref->SET_READONLY_MODE( READONLY_MODE ).
      endif.
    endif.
  endmethod.
*Generate Textfield with provided label and field width
  method create_textfield.
    data container_ref type ref to cl_gui_custom_container.
    if inpfield_ref is initial.
      create object container_ref
        exporting
          container_name              = container_name
        exceptions
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5.
      if sy-subrc ne 0.
*      add your handling
      endif.
      create object inpfield_ref
        exporting
          parent               = container_ref
          input_prompt_text    = parameter_text ##NO_TEXT
          label_text           = label_text
          label_width          = label_width
*         ACTIVATE_HISTORY     = 'X'
          activate_find_button = 'X'
          button_icon_info     = '@0S@'
          button_tooltip_info  = tooltip_text
*         ACTIVATE_AUTO_SUBMIT = EF_AUTOSUBMIT
          default_text         = '1'.
*        EXCEPTIONS
*          cntl_error            = 1
      if sy-subrc ne 0.
*      clear inpfield_ref.
        call function 'POPUP_TO_INFORM'
          exporting
            titel = 'Could not create textfield'.
      endif.
      inpfield_ref->set_accdescription( tooltip_text ).
    endif.
  endmethod.
  method create_combobox.
    data:
           container_ref type ref to cl_gui_custom_container.

    if combobox is initial.
      create object container_ref
        exporting
          container_name              = container_name
        exceptions
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5.
      if sy-subrc ne 0.
*      add your handling
      endif.
      create object combobox
        exporting
          parent      = container_ref
          label_text  = label_text
          label_width = label_width.
      "   EXCEPTIONS
      "  CNTL_ERROR            = 1.
      if sy-subrc ne 0.
        clear combobox.
      endif.
*        g_item_STRUCT-key =  1.
*      ITEM_STRUCT-text = 'Default Template'.
*      append ITEM_STRUCT TO ITEM_TABLE.


      call method combobox->activate_selection_event.

      call method combobox->set_items
        exporting
          item_tab = g_item_table.
      set handler handle_select
                  for combobox.
    endif.
  endmethod.
*Generate Text fields for System Message, Prompt and Config Parameters
  method generate_ui.
    call method create_combobox(
      exporting
        container_name = 'SYSTEMP_CONT'
        label_text     = ''
        label_width    = 0
      changing
        combobox       = g_systemp_sel ).

    call method create_textedit(
      exporting
        container_name    = 'SYSMSGINP'
        wordwrap_position = 40
        READONLY_MODE = 0
      changing
        textedit_ref      = g_sysmsg_input ).


    call method create_textedit(
      exporting
        container_name    = 'TXTINPUT'
        wordwrap_position = 110
        READONLY_MODE = 0
      changing
        textedit_ref      = g_text_input ).

    call method create_textfield(
      exporting
        container_name = 'TEMP_CONT'
        label_text     = 'Temperature'
        label_width    = c_label_width
        parameter_text = c_parameter1_text
        tooltip_text   = gv_temp_info
      changing
        inpfield_ref   = g_input_temp ).

    call method create_textfield(
      exporting
        container_name = 'TOPT_CONT'
        label_text     = 'Top P'
        label_width    = c_label_width
        parameter_text = c_parameter2_text
        tooltip_text   = gv_topp_info
      changing
        inpfield_ref   = g_input_topp ).



    call method create_textfield(
      exporting
        container_name = 'STOP_CONT'
        label_text     = ''
        label_width    = 1
        parameter_text = c_parameter3_text
        tooltip_text   = gv_stop_info
      changing
        inpfield_ref   = g_input_stop ).


    call method create_textfield(
      exporting
        container_name = 'FRQ_CONT'
        label_text     = 'Frequency Penalty'
        label_width    = c_label_width
        parameter_text = c_parameter2_text
        tooltip_text   = gv_freq_info
      changing
        inpfield_ref   = g_input_freq ).

    call method create_textfield(
      exporting
        container_name = 'PRES_CONT'
        label_text     = 'Presence Penalty'
        label_width    = c_label_width
        parameter_text = c_parameter2_text
        tooltip_text   = gv_pres_info
      changing
        inpfield_ref   = g_input_pres ).

    call method create_textedit(
      exporting
        container_name    = 'TXTOUTPUT'
        wordwrap_position = 100
        READONLY_MODE = 1
      changing
        textedit_ref      = g_text_output ).


    call method cl_gui_cfw=>flush
      exceptions
        others = 1.
  endmethod.

* This code reads input values from different input fields and assigns them to corresponding variables.
  method get_param_values.
    clear: g_temp_val,g_topt_val,g_stop_val,g_freq_val,g_pres_val.
    if not g_input_temp is initial.
      g_temp_val = g_input_temp->get_text( ).

    endif.

    if not g_input_topp is initial.
      g_topt_val = g_input_topp->get_text( ).
    endif.
    if not g_input_stop is initial.
      g_stop_val = g_input_stop->get_text( ).
    endif.
    if not g_input_freq is initial.
      g_freq_val = g_input_freq->get_text( ).
    endif.
    if not g_input_temp is initial.
      g_pres_val = g_input_pres->get_text( ).
    endif.
  endmethod.
*Read System Message, Prompt from the text fields
  method get_prompt_sys_text.


    clear:
      g_str_input,
      g_str_output,
      g_mytable,
      g_systable.


    g_sysmsg_input->get_text_as_r3table(
            importing
              table                  =  g_systable                " text as R/3 table
          ).

    g_text_input->get_text_as_r3table(
      importing
        table                  =  g_mytable                " text as R/3 table
    ).
    call method cl_gui_cfw=>flush
      exceptions
        others = 1.
    if g_systable is not initial and lines( g_systable ) > 0.
      loop at g_systable assigning field-symbol(<fs_sysline>) .
        g_sys_input = |{ g_sys_input }{ <fs_sysline>-line }{ cl_abap_char_utilities=>newline }|.
      endloop.

    else.
      g_sys_input = c_def_aitext.
    endif.
    if g_mytable is not initial and lines( g_mytable ) > 0.

      loop at g_mytable assigning field-symbol(<fs_line>) .
        g_str_input = |{ g_str_input }{ <fs_line>-line }{ cl_abap_char_utilities=>newline }|.
      endloop.

    endif.
  endmethod.
  method handle_select.
    data: lv_control_text type string.
    clear g_systable.
    assign g_templtable[ key ] to field-symbol(<fs_templstr>).
    g_systable = value #( for l_temp_text in <fs_templstr>-temp_text
    ( line = l_temp_text-text_line ) ).

    g_sysmsg_input->set_text_as_r3table(
            exporting
              table                  =  g_systable                " text as R/3 table
          ).

  endmethod.


endclass.
