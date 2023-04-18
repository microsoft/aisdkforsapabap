*&---------------------------------------------------------------------*
*&  Include           ZP_MSAISDKDEMO_COMMON
*&---------------------------------------------------------------------*

DATA:
  sdk_instance      TYPE REF TO zif_peng_azoai_sdk,         "MS AI SDK for SAP Instance
  status_code       TYPE i,                                 "Return Status Code
  status_reason     TYPE string,                            "Return Status Reason
  returnjson        TYPE string,                            "Return JSON. The content of this JSON string is parsed and made available through ABAP data types.
  error             TYPE zif_peng_azoai_sdk_types=>ty_error. "ABAP Type for Error
