<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f8f9fa; }
        h2 { color: #333; }
        table { border-collapse: collapse; width: 100%; margin-top: 10px; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background: #007bff; color: white; }
        tr:hover { background: #f1f1f1; }
        img { max-width: 80px; border-radius: 5px; }
        a.btn { padding: 6px 12px; background: #28a745; color: white; text-decoration: none; border-radius: 4px; }
        a.btn:hover { background: #218838; }
        .cart-link { display: inline-block; margin-top: 15px; font-weight: bold; }
    </style>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table>
    <tr>
        <th>Tên</th>
        <th>Giá</th>
        <th>Hình</th>
        <th>Thao tác</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.name}</td>
            <td>${p.price} ₫</td>
            <td><img src="images/${p.image}"/></td>
            <td><a class="btn" href="cart?action=add&id=${p.id}">Thêm vào giỏ</a></td>
        </tr>
    </c:forEach>
</table>
<a class="cart-link" href="cart?action=view">🛒 Xem giỏ hàng</a>
</body>
</html>
