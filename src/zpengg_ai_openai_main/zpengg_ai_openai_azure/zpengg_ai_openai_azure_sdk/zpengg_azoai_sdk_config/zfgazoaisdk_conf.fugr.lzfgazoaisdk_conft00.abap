*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZTAISDKRUNPROFIL................................*
DATA:  BEGIN OF STATUS_ZTAISDKRUNPROFIL              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTAISDKRUNPROFIL              .
CONTROLS: TCTRL_ZTAISDKRUNPROFIL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTAISDKRUNPROFIL              .
TABLES: ZTAISDKRUNPROFIL               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
