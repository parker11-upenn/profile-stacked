<cfcomponent>
    <cffunction name="getPersonList" access="public" returnType="query">
        <cfargument name="personID" type="string" required="true">
        
        <cfsetting showdebugoutput="no">
        <cfparam name="request.dsn" default="IncidentMaster">

        <cfquery name="loc_QPersonList" datasource="#request.dsn#">
            SELECT PersonID, FName, LName, ImageData
            FROM dbo.Persons
            WHERE PersonID IN (<cfqueryparam list="yes" value="#arguments.personID#" cfsqltype="cf_sql_integer">)
            ORDER BY PersonID ASC
        </cfquery>
        
        <cfreturn loc_QPersonList>
    </cffunction>
</cfcomponent>
