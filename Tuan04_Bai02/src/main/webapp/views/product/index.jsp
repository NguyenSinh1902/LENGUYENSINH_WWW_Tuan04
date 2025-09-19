<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Sản phẩm</title></head>
<body>
<h2>Danh sách sản phẩm</h2>
<table border="1">
    <tr><th>Tên</th><th>Giá</th><th>Hình</th><th>Thao tác</th></tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td><img src="images/${p.image}" width="100"/></td>
            <td><a href="cart?action=add&id=${p.id}">Thêm vào giỏ</a></td>
        </tr>
    </c:forEach>
</table>
<a href="cart?action=view">Xem giỏ hàng</a>
</body>
</html>
