<cfif isdefined("session.sessionId") and isDefined("cookie.userid")>
    <cfinclude template="header/header.cfm">
    <div class="main">
    <cfinclude template="menu/menu.cfm">
        <h2>Your profile</h2>

    <cfquery name="getInfoUser" datasource="intererror" >
     SELECT name, lastname FROM user where user_id=#cookie.userID#
    </cfquery>

    <form class="main-input" action="app/appEditInfoUser.cfm" method="Post">
        Name
    <cfoutput query="getInfoUser">
        <input type="text" name="main_input_name" required ="20" value="#getInfoUser.name#"> </br>
    </cfoutput>
        Lastname
    <cfoutput query="getInfoUser">
        <input type="text" name="main_input_lastname" required size="20" value="#getInfoUser.lastname#"> </br>
    </cfoutput>

    <input type="submit" name="main_input_submit" size="20" value="Edit">
    </form>
    </div>
    <cfinclude template="footer/footer.cfm">
<cfelse>
Access is denied!
</cfif>

