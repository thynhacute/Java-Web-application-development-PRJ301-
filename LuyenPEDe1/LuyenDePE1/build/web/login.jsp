<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login Form</title>

    </head>
    <body>
        <div>
            <form action="MainController" method="POST">
                <h1>Login</h1>
                <div>
                    User ID <input type="text" name="userID" class="form-control" placeholder="UserID" placeholder="userID" required="required">
                </div>
                <div>
                    Password<input type="password" name="password" class="form-control" placeholder="Password" required="required">
                </div>
                <div>
                    <button type="submit" name="action" value="Login">Log in</button>
                </div>
                <input type="reset" value="Reset"/>
        </form>
    </div>
    ${requestScope.ERROR}
</body>
</html>