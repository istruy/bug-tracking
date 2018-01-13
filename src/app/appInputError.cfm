<cfif isdefined("session.sessionId")>
    <cfif structKeyExists(form, "main-input-submit")>
            <cfswitch expression="#form.main_input_status#">
                <cfcase value="New"><cfset actError = "Input"></cfcase>
                <cfcase value="Opened"><cfset actError = "Opening"></cfcase>
                <cfcase value="Decided"><cfset actError = "Decision"></cfcase>
                <cfcase value="Closed"><cfset actError = "Closure"></cfcase>
            </cfswitch>
            <cfset timeNow = now()>
            <cfquery name="addErrorInHistory" datasource="intererror">
                    insert into historyerror
                    (date_input, act, comment, user_id)
                    values (#timeNow#, "#actError#", null, "#cookie.userID#")
                </cfquery>
            <cfquery name="addError" datasource="intererror">
                insert into error
                (number, date_input, short_descr, detailed_descr, user_id, status, urgency, criticality)
                values (null,#timeNow#,"#form.main_input_shdescr#", "#form.main_input_detdescr#", "#cookie.userID#",
                 "#form.main_input_status#", "#form.main_input_urgency#", "#form.main_input_criticality#")
            </cfquery>
            <cflocation url="../listOfErrors.cfm">
    <cfelse>
        <cfoutput> Error! </cfoutput>
    </cfif>
<cfelse>
    <cfoutput> Access is denied! Please sign in. </cfoutput>
</cfif>

