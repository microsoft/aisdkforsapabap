*&---------------------------------------------------------------------*
*& Report ZP_AISDKDEMO_EMBEDDINGS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_aisdkdemo_embeddings.


INCLUDE zp_msaisdkdemo_params_top.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )

PARAMETERS:
    p_depid  TYPE string OBLIGATORY LOWER CASE.

DATA:
  embeddings_input  TYPE zif_peng_azoai_sdk_types=>ty_embeddings_input,
  embeddings_output TYPE zif_peng_azoai_sdk_types=>ty_embeddings_output.


START-OF-SELECTION.

  TRY.

* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-azure
                                                            api_key     = p_key
                                                          ).

*     Specify text(s) to generate embedding.
      APPEND INITIAL LINE TO embeddings_input-input ASSIGNING FIELD-SYMBOL(<fs_embedinput>).
      <fs_embedinput> = 'Hello world!'.

*     Perform the embeddings operation.
      sdk_instance->embeddings( )->create(
        EXPORTING
          deploymentid = p_depid            " Deployment ID on which the embedding must be generated.
          inputs       = embeddings_input   " Input texts for embedding
        IMPORTING
          statuscode   = status_code        " Status Code
          statusreason = status_reason      " HTTP status description
          json         = returnjson         " JSON String returned from AI Resource
          response     = embeddings_output  " ABAP Friendly Embeddings operaiton output
          error        = error              " ABAP Ready error details
      ).

      BREAK-POINT.

    CATCH zcx_peng_azoai_sdk_exception INTO DATA(ex). " MSPENG:Azure Open AI ABAP SDK Exception
      MESSAGE ex TYPE 'I'.
  ENDTRY.
