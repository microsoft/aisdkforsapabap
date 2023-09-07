class ZCX_PENG_AZOAI_SDK_EXCEPTION definition
  public
  inheriting from CX_STATIC_CHECK
  create public .

public section.

  interfaces IF_T100_MESSAGE .
  interfaces IF_T100_DYN_MSG .

  constants:
    begin of VERSION_NOT_SUPPORTED,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '000',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of VERSION_NOT_SUPPORTED .
  constants:
    begin of INVALID_API_BASE_URL,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '001',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of INVALID_API_BASE_URL .
  constants:
    begin of INVALID_API_AUTH,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '002',
      attr1 type scx_attrname value 'IV_ATTR1',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of INVALID_API_AUTH .
  constants:
    begin of NOT_IMPLEMENTED,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '003',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NOT_IMPLEMENTED .
  constants:
    begin of COMMUNICATION_FAILURE,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '004',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of COMMUNICATION_FAILURE .
  constants:
    begin of COMPONENT_INIT_FAILED,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '005',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of COMPONENT_INIT_FAILED .
  constants:
    begin of PARAM_MISSING,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '006',
      attr1 type scx_attrname value 'IV_ATTR1',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_MISSING .
  constants:
    begin of PROFILE_ERR_INVALID_HANDLER,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '007',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PROFILE_ERR_INVALID_HANDLER .
  constants:
    begin of COMPONENT_USE_NOT_PERMITTED,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '008',
      attr1 type scx_attrname value 'IV_ATTR1',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of COMPONENT_USE_NOT_PERMITTED .
  constants:
    begin of NOT_IMPL_FOR_VERSION,
      msgid type symsgid value 'ZMSPENG_AZOAISDK_MSG',
      msgno type symsgno value '009',
      attr1 type scx_attrname value 'IV_ATTR1',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NOT_IMPL_FOR_VERSION .
  data IV_ATTR1 type CHAR50 .
  data IV_ATTR2 type CHAR50 .
  data IV_ATTR3 type CHAR50 .
  data IV_ATTR4 type CHAR50 .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !IV_ATTR1 type CHAR50 optional
      !IV_ATTR2 type CHAR50 optional
      !IV_ATTR3 type CHAR50 optional
      !IV_ATTR4 type CHAR50 optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_PENG_AZOAI_SDK_EXCEPTION IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->IV_ATTR1 = IV_ATTR1 .
me->IV_ATTR2 = IV_ATTR2 .
me->IV_ATTR3 = IV_ATTR3 .
me->IV_ATTR4 = IV_ATTR4 .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
