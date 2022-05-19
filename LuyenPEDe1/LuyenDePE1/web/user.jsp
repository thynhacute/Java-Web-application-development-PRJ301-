<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        Welcome:<h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form style="text-align: center" action="MainController">
            Search<input style="text-align: center" type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="SearchProduct"/>
        </form>
        <c:if test="${requestScope.LIST_PRODUCT == null}">
            <h3 style="color: red; font-size: 50px"> NOT FOUND</h3>
        </c:if>
        <c:if test="${requestScope.LIST_PRODUCT != null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category ID</th>
                            <th>Import Date</th>
                            <th>Using Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}" varStatus="counter">
                        <form action="MainController">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${product.productID}</td>
                                <td>
                                    ${product.productName}
                                </td>
                                <td> 
                                    <img style="width: 150px" src=" ${product.image}" alt="alt"/>
                                </td>

                                <td>${product.price}
                                </td>

                                <td>${product.quantity}</td>
                                <td>${product.categoryID}</td>
                                <td>${product.importDate}</td>
                                <td>${product.usingDate}</td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
</body>
</html>
