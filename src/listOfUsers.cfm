<cfif isdefined("session.sessionId") and isDefined("cookie.userid")>
<cfinclude template="header/header.cfm">
<div class="main">
<cfinclude template="menu/menu.cfm">

<cfquery name="queryusers" datasource="intererror" >
        SELECT * FROM user
</cfquery>
    <h2>List of users</h2>

<table>
    <tr>
        <td>User ID</td>
        <td>Name</td>
        <td>Last name</td>
    </tr>
<cfoutput query="queryusers">
    <tr>
        <td>#user_id#</td>
        <td>#name#</td>
        <td>#lastname#</td>
    </tr>
</cfoutput>
</table>

</div>
<cfinclude template="footer/footer.cfm">
<cfelse>
    Access is denied!
</cfif>


