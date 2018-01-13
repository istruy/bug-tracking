<cfif isdefined("session.sessionId") and isDefined("cookie.userid")>
<cfinclude template="header/header.cfm">
<div class="main">
<cfinclude template="menu/menu.cfm">

<cfquery name="queryusers" datasource="intererror" >
        SELECT * FROM error
</cfquery>

    <h2>List of errors</h2>
<table>
    <tr>
        <td>Number</td>
        <td>Short decription</td>
        <td>Detailed decription</td>
        <td>User</td>
        <td>Status</td>
        <td>Urgency</td>
        <td>Criticality</td>
        <td>Time input</td>
    </tr>
<cfoutput query="queryusers">
    <tr>
        <td>#number#</td>
        <td><a href="errorEdit.cfm?id=#number#">#short_descr#</a></td>
        <td>#detailed_descr#</td>
        <td>#user_id#</td>
        <td>#status#</td>
        <td>#urgency#</td>
        <td>#criticality#</td>
        <td>#date_input#</td>
    </tr>
</cfoutput>
</table>

</div>
<cfinclude template="footer/footer.cfm">
<cfelse>
    Access is denied!
</cfif>


