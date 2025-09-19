<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f8f9fa; }
        h2 { color: #333; }
        table { border-collapse: collapse; width: 100%; background: white; margin-top: 10px; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background: #17a2b8; color: white; }
        tr:hover { background: #f1f1f1; }
        a.btn-remove { padding: 6px 12px; background: #dc3545; color: white; text-decoration: none; border-radius: 4px; }
        a.btn-remove:hover { background: #c82333; }
        input[type="number"] { width: 60px; padding: 5px; }
        input[type="submit"] { background: #ffc107; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; }
        input[type="submit"]:hover { background: #e0a800; }
        .nav-links { margin-top: 15px; display: flex; justify-content: space-between; }
        .nav-links a { text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
<h2>Giỏ hàng của bạn</h2>

<c:choose>
    <c:when test="${empty sessionScope.cart}">
        <p>🛒 Giỏ hàng trống!</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Tên</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.cart}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.product.price} ₫</td>
                    <td>
                        <form action="cart" method="get">
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="id" value="${item.product.id}"/>
                            <input type="number" name="quantity" value="${item.quantity}" min="1"/>
                            <input type="submit" value="Cập nhật"/>
                        </form>
                    </td>
                    <td>${item.totalPrice} ₫</td>
                    <td><a class="btn-remove" href="cart?action=remove&id=${item.product.id}">Xóa</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<div class="nav-links">
    <a href="products">⬅️ Tiếp tục mua hàng</a>
    <a href="#">💳 Thanh toán</a>
</div>
</body>
</html>
