<cfif structKeyExists(form, "main-input-submit")>
    <cfquery name="queryuser" datasource="intererror" >
        SELECT user_id, name, lastname, pass FROM user WHERE name="#form.username#" and lastname="#form.lastname#"
    </cfquery>
    <cfif len(#queryuser.name#)>
        <cfset hashPass = Hash("#form.password#")/>
        <cfif #hashPass# EQ #queryuser.pass#>
            <cfset session.isLoggedIn = "yes">
            <cfcookie name="userID" value="#queryuser.user_id#">
            <cfset session.userID = "#queryuser.user_id#">
            <cflocation url="../listOfErrors.cfm">
        <cfelse>
            <cfoutput> Wrong password</cfoutput>
        </cfif>
    <cfelse>
        <cfoutput> Such user didnt find</cfoutput>
    </cfif>
<cfelse>
    <cfset session.isLoggedIn = "no">
</cfif>



