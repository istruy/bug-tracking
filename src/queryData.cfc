<cfcomponent>
    <cffunction name="runQueryErrorStatus" access="public" returntype="string">
        <cfargument name="field" required="true">

        <cfquery name="queryUsersParam" datasource="intererror">
            SHOW COLUMNS FROM error WHERE field = '#arguments.field#'
        </cfquery>
        <cfoutput query="queryUsersParam">
            <cfreturn #type#>
        </cfoutput>
    </cffunction>

    <cffunction name="getArrayFromEnum" access="public">
        <cfargument name="field" required="true">

        <cfset resultFromQuery = runQueryErrorStatus(#arguments.field#)>
        <cfset pregMatch = rereplace(resultFromQuery, "(enum)", "")>
        <cfset pregMatchWithoutFirstSk = rereplace(pregMatch, "\(", "")>
        <cfset pregMatchWithoutLastSk = rereplace(pregMatchWithoutFirstSk, "\)", "")>
        <cfset resultMatchArray = listToArray(pregMatchWithoutLastSk, "','", false)>

        <cfreturn resultMatchArray>
    </cffunction>

</cfcomponent>

