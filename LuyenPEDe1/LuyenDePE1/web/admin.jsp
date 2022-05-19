<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        Welcome:<h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <a href="createProduct.jsp">Create Product</a></br>
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
                                    ${product.image}
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
            ${requestScope.ERROR}
        </c:if>
    </c:if>

</body>
</html>