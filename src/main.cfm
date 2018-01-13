<cflock scope="session" type="readonly" timeout="5">
    <cfif isdefined("session.sessionid") and isDefined("session.isLoggedIn") and isDefined("cookie.user_id")>
    <cflocation url="listOfErrors.cfm">
    <cfelse>
        <cfinclude template="app/sessionRotate.cfm" runOnce="true">
        <cfif isdefined("session.sessionid") and isDefined("session.isLoggedIn")>
            <cflocation url="listOfErrors.cfm">
        <cfelse>
            <cflocation url="login.cfm">
        </cfif>
    </cfif>
</cflock>

