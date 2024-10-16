<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web bán hàng</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body> 
    <h1>Cửa hàng bán sách online</h1>

    <%
        // Tạo danh sách sản phẩm
        List<Product> productList = new ArrayList<>();
        productList.add(new Product("Harry Potter", 450000));
        productList.add(new Product("Nhà giả kim", 95000));
        productList.add(new Product("Không Phải Sói Nhưng Cũng Đừng Là Cừu", 130000));
        productList.add(new Product("Nghìn lẻ một đêm", 230000));

        request.setAttribute("productList", productList);
    %>

    <table>
        <thead>
            <tr>
                <th>Mô tả</th>
                <th>Giá</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.description}</td>
                    <td class="right">${product.price}đ</td>
                    <td>
                        <form action="cart" method="post">
                        	<input name="description" type="hidden" value="${product.description}">
                        	<input name="price" type="hidden" value="${product.price}">
                            <input type="submit" value="Add To Cart">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table> 
    <button><a href="cart.jsp">Cart</a></button>
</body>
</html>