/*------------------------------------------------------------------------
   File        : SportsCE
   Syntax      :
   Author(s)   : isyed
   Created     : Thu Aug 18 11:44:53 EDT 2016
   Notes       :
 ----------------------------------------------------------------------*/

@program FILE(name="SportsCE.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="SportsCE", URI="/SportsCE", schemaName="dsEmployee", schemaFile="DOH/AppServer/sportsce.i").

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS SportsCE INHERITS BusinessEntity:
        /*------------------------------------------------------------------------------
                        Purpose:
                        Notes:
        ------------------------------------------------------------------------------*/

    {"sportsce.i"}

    DEFINE DATA-SOURCE srcEmployee FOR sports2000.Employee.


    /*------------------------------------------------------------------------------
            Purpose:
            Notes:
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC SportsCE():

        DEFINE VAR hDataSourceArray AS HANDLE NO-UNDO EXTENT 1.
        DEFINE VAR cSkipListArray   AS CHAR   NO-UNDO EXTENT 1.

        SUPER (DATASET dsEmployee:HANDLE).

        /* Data Source for each table in dataset. Should be in table order as defined
            in DataSet */
        hDataSourceArray[1] =  DATA-SOURCE srcEmployee:HANDLE.


        /* Skip-list entry for each table in dataset. Should be in temp-table order
          as defined in DataSet */
        /* Each skip-list entry is a comma-separated list of field names, to be
            ignored in create stmt */

        cSkipListArray[1] = "".


        THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string
            Notes:
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json").
    METHOD PUBLIC VOID ReadSportsCE(
        INPUT filter AS CHARACTER,
        OUTPUT DATASET dsEmployee):

        SUPER:ReadData(filter).

    END METHOD.

    /*------------------------------------------------------------------------------
            Purpose: Create one or more new records
            Notes:
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID CreateSportsCE(INPUT-OUTPUT DATASET dsEmployee):

        SUPER:CreateData(DATASET dsEmployee BY-REFERENCE).
    END METHOD.

    /*------------------------------------------------------------------------------
            Purpose:  Update one or more records
            Notes:
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID UpdateSportsCE(INPUT-OUTPUT DATASET dsEmployee):

        SUPER:UpdateData(DATASET dsEmployee BY-REFERENCE).
    END METHOD.

    /*------------------------------------------------------------------------------
            Purpose:    Delete a record
            Notes:
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID DeleteSportsCE(INPUT-OUTPUT DATASET dsEmployee):

        SUPER:DeleteData(DATASET dsEmployee BY-REFERENCE).
    END METHOD.

    /*------------------------------------------------------------------------------
             Purpose:    Submit a record
            Notes:
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="submit", URI="/SubmitSportsCE", alias="", mediaType="application/json").
    METHOD PUBLIC VOID SubmitSportsCE(INPUT-OUTPUT DATASET dsEmployee):

        SUPER:Submit(DATASET dsEmployee BY-REFERENCE).
    END METHOD.


    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/InvokeBE", alias="", mediaType ="application/json").
    METHOD PUBLIC void InvokeBE():
        message " In InvokeBE Method".
        FIND LAST EMPLOYEE.
        message empNum LASTNAME.

    END METHOD.

END CLASS.