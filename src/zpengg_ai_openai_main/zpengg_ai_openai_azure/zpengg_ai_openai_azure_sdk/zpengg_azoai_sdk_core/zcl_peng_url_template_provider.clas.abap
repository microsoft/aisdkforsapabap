CLASS zcl_peng_url_template_provider DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      RETURNING
        value(r_result) TYPE REF TO zcl_peng_url_template_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_url_template_provider IMPLEMENTATION.

  METHOD get_instance.

    CREATE OBJECT r_result.

  ENDMETHOD.
ENDCLASS.
