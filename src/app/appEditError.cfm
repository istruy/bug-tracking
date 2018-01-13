<cfif isdefined("session.sessionId")>
    <cfif structKeyExists(form, "main_input_submit") and structKeyExists(form, "main_input_comment") and structKeyExists(form, "main_input_status")>
        <cfswitch expression="#form.main_input_status#">
            <cfcase value="New"><cfset actError = "Input"></cfcase>
            <cfcase value="Opened"><cfset actError = "Opening"></cfcase>
            <cfcase value="Decided"><cfset actError = "Decision"></cfcase>
            <cfcase value="Closed"><cfset actError = "Closure"></cfcase>
        </cfswitch>
        <cfquery name="findSameUser" datasource="intererror">
         insert into historyerror
            (date_input, act, comment, user_id, number)
            values (now(), "#actError#", "#form.main_input_comment#", "#cookie.userID#", "#form.main_input_number#")
    </cfquery>
        <cflocation url="../listOfErrors.cfm">
    <cfelse>
        <cfoutput> Error! </cfoutput>
    </cfif>
<cfelse>
    <cfoutput> Access is denied! Please sign in. </cfoutput>
</cfif>



