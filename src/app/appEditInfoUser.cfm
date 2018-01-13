<cfif isdefined("session.sessionId")>
    <cfif structKeyExists(form, "main_input_submit") and structKeyExists(form, "main_input_name") and structKeyExists(form, "main_input_lastname")>
        <cfquery name="findSameUser" datasource="intererror">
            select user_id from user
            where name="#form.main_input_name#" and lastname="#form.main_input_lastname#"
        </cfquery>
        <cfif len("#findSameUser.user_id#")>
            <cfoutput> There is user with the same name or last name. </cfoutput>
        <cfelse>
            <cfquery name="editUserInfo" datasource="intererror">
                update user
                set name="#form.main_input_name#", lastname="#form.main_input_lastname#"
                where user_id=#cookie.userID#
            </cfquery>
            <cflocation url="../listOfUsers.cfm">
        </cfif>
    <cfelse>
        <cfoutput> Error! </cfoutput>
    </cfif>
<cfelse>
    <cfoutput> Access is denied! Please sign in. </cfoutput>
</cfif>

