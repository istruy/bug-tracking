<cfif isdefined("session.sessionId") and isDefined("cookie.userid")>
    <cfinclude template="header/header.cfm">
    <div class="main">
    <cfinclude template="menu/menu.cfm">

    <cfset objectQuery = createObject("queryData")>
    <cfset arrayStatusValue = objectQuery.getArrayFromEnum('status')>
    <cfset arrayUrgencyValue = objectQuery.getArrayFromEnum('urgency')>
    <cfset arrayCriticalityValue = objectQuery.getArrayFromEnum('criticality')>

    <h2>Input a new error</h2>
    <form class="main-input" action="app/appInputError.cfm" method="Post">
        <label for="main_input_shdescr"> Short decription</label>
        <input type="text" name="main_input_shdescr" required size="20"> </br>
        Detailed description </br>
        <textarea name="main_input_detdescr" rows="5" cols="50" maxlength="100"></textarea>
        </br>
        Status
        <select name="main_input_status">
            <cfloop array="#arrayStatusValue#" index="status">
                <option name="status">
                 <cfoutput>
                     #status#
                </cfoutput>
                    </option>
            </cfloop>
        </select>
            </br>
        Urgency
        <select name="main_input_urgency">
            <cfloop array="#arrayUrgencyValue#" index="urgency">
                <option name="urgency">
                    <cfoutput>
                         #urgency#
                    </cfoutput>
                </option>
            </cfloop>
        </select>
        </br>
        Criticality
        <select name="main_input_criticality">
            <cfloop array="#arrayCriticalityValue#" index="criticality">
                <option name="criticality">
                    <cfoutput>
                         #criticality#
                    </cfoutput>
                </option>
            </cfloop>
        </select>
        </br>
        <input type="submit" name="main-input-submit" size="20" value="Input">
    </form>
    </div>
    <cfinclude template="footer/footer.cfm">
<cfelse>
    Access is denied!
</cfif>



