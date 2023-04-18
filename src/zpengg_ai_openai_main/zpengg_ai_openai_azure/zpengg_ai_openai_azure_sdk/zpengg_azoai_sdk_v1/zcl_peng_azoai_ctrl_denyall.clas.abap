CLASS zcl_peng_azoai_ctrl_denyall DEFINITION
  PUBLIC
  INHERITING FROM zcl_peng_azoai_centralcontrol
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      zif_peng_azoai_centralcontrol~start_sdk REDEFINITION,
      zif_peng_azoai_centralcontrol~initialize_sdkcomponent REDEFINITION,
      zif_peng_azoai_centralcontrol~perform_operation REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_peng_azoai_ctrl_denyall IMPLEMENTATION.
  METHOD zif_peng_azoai_centralcontrol~initialize_sdkcomponent.
    RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
      EXPORTING
        textid   = zcx_peng_azoai_sdk_exception=>component_use_not_permitted
        iv_attr1 = CONV #( component_type ).

  ENDMETHOD.

  METHOD zif_peng_azoai_centralcontrol~perform_operation.
    RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
      EXPORTING
        textid   = zcx_peng_azoai_sdk_exception=>component_use_not_permitted
        iv_attr1 = |{ component_type }/{ operation }|.
  ENDMETHOD.

  METHOD zif_peng_azoai_centralcontrol~start_sdk.
    RAISE EXCEPTION TYPE zcx_peng_azoai_sdk_exception
      EXPORTING
        textid   = zcx_peng_azoai_sdk_exception=>component_use_not_permitted
        iv_attr1 = |AI SDK|.
  ENDMETHOD.

ENDCLASS.
