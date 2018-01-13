<cfinclude template="header/header.cfm">
<div class="main">
<cfinclude template="menu/menu.cfm">

    <div> You should sign in to get access </div>
    <form class="main-input" action="app/applicationLogin.cfm" method="Post">
        User name
        <input type="text" name="username" required size="20"> </br>
        User lastname
        <input type="text" name="lastname" required size="20"> </br>
        Password
        <input type="password" name="password" required> </br>

        <input type="submit" name="main-input-submit" size="20" value="Input">
    </form>
</div>
</body>
<script src="style/less.min.js" type="text/javascript"></script>
</html>

