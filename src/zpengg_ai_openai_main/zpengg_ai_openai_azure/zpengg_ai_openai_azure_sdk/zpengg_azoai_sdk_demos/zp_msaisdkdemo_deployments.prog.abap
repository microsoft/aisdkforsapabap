*&---------------------------------------------------------------------*
*& Report  ZP_MSAISDKDEMO_MODELS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zp_msaisdkdemo_deployments.

INCLUDE zp_msaisdkdemo_params_top.  "Common Input Parameters (AI End Point, Version, Key)
INCLUDE zp_msaisdkdemo_common.      "Common Data Declarations (SDK Instance Object, status Code, Status Reason, Return JSON String, Error )

PARAMETERS:
    p_modid  TYPE string OBLIGATORY LOWER CASE.

DATA:
  deployment        TYPE zif_peng_azoai_sdk_types=>ty_deployments,        "ABAP Type for Deployments Information.
  deployment_create TYPE zif_peng_azoai_sdk_types=>ty_deployments_create, "ABAP Type for new Deployment Creation
  deployment_list   TYPE zif_peng_azoai_sdk_types=>ty_deployments_list.   "ABAP Type for Deployment Listing

START-OF-SELECTION.

  TRY.
* Create an instance of MS AI SDK for SAP.
      sdk_instance = zcl_peng_azoai_sdk_factory=>get_instance( )->get_sdk(
                                                            api_version = p_ver
                                                            api_base    = p_url
                                                            api_type    = zif_peng_azoai_sdk_constants=>c_apitype-azure
                                                            api_key     = p_key
                                                          ).

************************** Creating a New Deployment ***************************
* Deployments - Create
*     Create a New Deployment based on model : text-curie-001
      deployment_create-model = p_modid.
      sdk_instance->deployments( )->create(
        EXPORTING
          iv_deployment_info = deployment_create
        IMPORTING
          statuscode         = status_code
          statusreason       = status_reason
          json               = returnjson
          deployment         = deployment
          error              = error
      ).

* Alternate Syntax for deployment creation using modern ABAP Value #
*sdk_instance->deployments( )->create(
*        EXPORTING
*          iv_deployment_info = VALUE #( model = 'text-curie-001' )
*        IMPORTING
*          statuscode         = status_code
*          statusreason       = status_reason
*          json               = returnjson
*          deployment         = deployment
*          error              = error
*      ).
********************************************************************************
      BREAK-POINT.

************************** List All Deployments ********************************
* Deployments - List
* List all existing deployments. We will see a new deployment in the list returned
* which is the deployment we just created in prior step. Open the variable "deployment_list"
* to see all the deployments returned.
      sdk_instance->deployments( )->list(
        IMPORTING
          statuscode   = status_code
          statusreason = status_reason
          json         = returnjson
          deployments  = deployment_list
          error        = error
      ).
********************************************************************************
      BREAK-POINT.

************************** Get details of specific Deployment ******************
* Deployments - Get
* Get a Specific Deployment. The deployment we are targetting is the one we just
* created. We are using the deployment ID we received back from AI Service. Here,
* we are re-using the variable "deployment" to get back the deployment information.

      sdk_instance->deployments( )->get(
        EXPORTING
          deploymentid = deployment-id
        IMPORTING
          statuscode   = status_code
          statusreason = status_reason
          json         = returnjson
          deployment   = deployment
          error        = error
      ).
********************************************************************************
      BREAK-POINT.

************************** Delete specific Deployment **************************
* Deployments - Delete
* Finally, we are going to delete the deployment that was created in this demo
* program. Deployment ID is passed in as the parameter for delete operation.
      sdk_instance->deployments( )->delete(
        EXPORTING
          deploymentid = deployment-id
        IMPORTING
          statuscode   = status_code
          statusreason = status_reason
          json         = returnjson
          error        = error
      ).
********************************************************************************
      BREAK-POINT.

    CATCH zcx_peng_azoai_sdk_exception INTO DATA(ex). " MSPENG:Azure Open AI ABAP SDK Exception
      MESSAGE ex TYPE 'I'.
  ENDTRY.
