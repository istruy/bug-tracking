<cfinclude template="header/header.cfm">
<div class="main">
<cfinclude template="menu/menu.cfm">

<h2>Create new user</h2>
<form class="main-input" action="app/appCreateUser.cfm" method="Post">
    Name
    <input type="text" name="main_input_name" required size="20"> </br>
    Lastname
    <input type="text" name="main_input_lastname" required size="20"> </br>
    Password
    <input type="password" name="main_input_password" required size="20"> </br>

    <input type="submit" name="main-input-submit" size="20" value="Input">
</form>
</div>
<cfinclude template="footer/footer.cfm">




