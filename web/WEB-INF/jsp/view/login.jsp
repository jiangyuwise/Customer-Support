<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<!doctype html>
<html lang="en">
<head>
    <title>Customer Support</title>
</head>
<body>
    <h2>Login</h2>
    <b>Login to get customer support.</b><br/>
    <c:if test="${loginFailed}">
        <b> The username or password are not correct, please try again.</b><br/><br/>
    </c:if>
    <form method="post" action="<c:url value="/login" />">
        Username <br/>
        <input type="text" name="username" /><br/><br/>
        Password <br/>
        <input type="password" name="password" /><br/><br/>
        <input type="submit" value="Login"/>
    </form>
</body>
</html>