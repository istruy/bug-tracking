<cfinclude template="header/header.cfm">
<div class="main">
<cfinclude template="menu/menu.cfm">

<cfset objectQuery = createObject("queryData")>
<cfset arrayStatusValue = objectQuery.getArrayFromEnum('status')>

<cfquery name="getInfoError" datasource="intererror" >
     SELECT short_descr, detailed_descr, status, urgency, criticality, date_input, number FROM error where number=#url.id#
</cfquery>
<cfquery name="getHistoryError" datasource="intererror" >
     SELECT act, comment, user_id FROM historyerror where number="#getInfoError.number#"
</cfquery>

<cfswitch expression="#getInfoError.status#">
    <cfcase value="New"><cfset arrayStatusValueUpd = ['Opened']></cfcase>
    <cfcase value="Opened"><cfset arrayStatusValueUpd = ['Decided']></cfcase>
    <cfcase value="Decided"><cfset arrayStatusValueUpd = ['Opened', 'Closed']></cfcase>
    <cfcase value="Closed"><cfset arrayStatusValueUpd = []></cfcase>
</cfswitch>

<h2>Edit error</h2>

<form class="main-input" action="app/appEditError.cfm" method="Post">
    <div class="main-input-param">
        Short description:
        <cfoutput query="getInfoError">
            #getInfoError.short_descr#
        </cfoutput>
    </div>

    <div class="main-input-param">
        Detailed description:
        <cfoutput query="getInfoError">
            #getInfoError.detailed_descr#
        </cfoutput>
    </div>

    <div class="main-input-param">
        Urgency:
        <cfoutput query="getInfoError">
            #getInfoError.urgency#
        </cfoutput>
    </div>

    <div class="main-input-param">
        Criticality:
        <cfoutput query="getInfoError">
            #getInfoError.criticality#
        </cfoutput>
    </div>

    <div class="main-input-param">
        Status:
        <cfoutput>#getInfoError.status#</cfoutput> </br>
        Change:
        <select name="main_input_status">
        <cfloop array="#arrayStatusValueUpd#" index="status">
            <option name="status">
                <cfoutput>
                     #status#
                </cfoutput>
            </option>
        </cfloop>
        </select>
    </div>

    <cfset num = #url.id#>

    <div class="main-input-param">
    Number error:
        <cfoutput>
                <input type="text" name="main_input_number" readonly size="4" value="#num#">
        </cfoutput>
    </div>

    Comment:</br>
    <textarea name="main_input_comment" rows="5" cols="50" maxlength="100"></textarea>
    </br>

    <input type="submit" name="main_input_submit" size="20" value="Edit">
</form>

<h3>History of this error</h3>
<table>
    <tr>
        <td>Date input</td>
        <td>Act</td>
        <td>Comment</td>
        <td>User id</td>
    </tr>
    <cfoutput query="getHistoryError">
        <tr>
            <td>#getInfoError.date_input#</td>
            <td>#getHistoryError.act#</td>
            <td>#getHistoryError.comment#</td>
            <td>#getHistoryError.user_id#</td>
        </tr>
    </cfoutput>
</table>
</div>
<cfinclude template="footer/footer.cfm">
