<%-- 
    Document   : createUser
    Created on : Mar 3, 2022, 10:47:23 PM
    Author     : Admin
--%>

<%@page import="sample.products.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create page</title>
    </head>
    <body>
        
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" required=""/>
            ${requestScope.PRODUCTID_ERROR}</br>
            Product Name<input type="text" minlength="1" name="productName" required=""/></br>
            Image<input type="text" name="image" required=""/></br>
            Price<input type="number" min="1" name="price" required=""/></br>
            Quantity<input type="number" min="1" name="quantity" required=""/></br>
            Category ID<input type="text" name="categoryID" required=""/>
            ${requestScope.CATEGORYID_ERROR}</br>
            Import Date<input type="date" name="importDate" required=""/></br>
            Using Date<input type="date" name="usingDate" required=""/></br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/></br>
        </form>
            <a style="text-decoration: none" href="MainController?action=Search&search=">Back</a>
    </body>
</html>
