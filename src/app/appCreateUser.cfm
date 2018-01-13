<cfif structKeyExists(form, "main-input-submit")>
        <cfquery name="findUser" datasource="intererror">
                select name, lastname from user where name="#form.main_input_name#" and lastname="#form.main_input_lastname#"
        </cfquery>
        <cfif len(#findUser.name#) and len(#findUser.lastname#)>
            There is the same user!
        <cfelse>
            <cfset hashPass = Hash("#form.main_input_password#")/>
            <cfquery name="addUser" datasource="intererror">
                insert into user
                (user_id, name, lastname, pass)
                values (null, "#form.main_input_name#", "#form.main_input_lastname#", "#hashPass#")
            </cfquery>
            <cflocation url="../listOfUsers.cfm">
        </cfif>
    <cfelse>
        <cfoutput> Error! </cfoutput>
    </cfif>

