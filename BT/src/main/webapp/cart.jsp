<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Giỏ hàng</h1>
    <table>
        <thead>
            <tr>
                <th>Số lượng</th>
                <th>Mô tả</th>
                <th>Giá</th>
                <th>Tổng tiền</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty sessionScope.cart}">
                <c:forEach var="product" items="${sessionScope.cart}">
                    <tr>
                        <td>
                            <form>
                                <input type="text" name="txtQuantity" value="1">
                                <input type="submit" value="Update">
                            </form>
                        </td>
                        <td>${product.description}</td>
                        <td>${product.price}đ</td>
                        <td>${product.price}đ</td> <!-- Tổng tiền có thể được tính dựa trên số lượng -->
                        <td>
                            <form action="removeItem" method="post">
                                <input type="hidden" name="product" value="${product.description}">
                                <input type="submit" value="Remove Item">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty sessionScope.cart}">
                <tr>
                    <td colspan="5">Giỏ hàng hiện đang trống.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <button><a href="index.jsp">Continue Shopping</a></button>
</body>
</html>