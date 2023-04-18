INTERFACE zif_peng_azoai_sdk_component
  PUBLIC .


  "! <p class="shorttext synchronized" lang="en">Initialize an SDK Component (Internal Use Only)</p>
  "! <strong>INTERNAL USE ONLY</strong>
  "! <br/><br/>
  "! Initializes an SDK component, and registered sub-objects into the instance.
  "! @parameter component_set | <p class="shorttext synchronized" lang="en">Table of component parameters and sub-components</p>
  "! @raising zcx_peng_azoai_sdk_exception | <p class="shorttext synchronized" lang="en"></p>
  METHODS initialize_component
    IMPORTING
      component_set TYPE zif_peng_azoai_sdk_typinternal=>tty_component_init_param
    RAISING
      zcx_peng_azoai_sdk_exception.

ENDINTERFACE.
