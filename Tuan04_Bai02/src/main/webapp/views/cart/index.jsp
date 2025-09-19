<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Giỏ hàng</title></head>
<body>
<h2>Giỏ hàng của bạn</h2>

<c:choose>
    <c:when test="${empty sessionScope.cart}">
        <p>Giỏ hàng trống!</p>
    </c:when>
    <c:otherwise>
        <table border="1">
            <tr><th>Tên</th><th>Giá</th><th>Số lượng</th><th>Tổng</th><th>Thao tác</th></tr>
            <c:forEach var="item" items="${sessionScope.cart}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.product.price}</td>
                    <td>
                        <form action="cart" method="get">
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="id" value="${item.product.id}"/>
                            <input type="number" name="quantity" value="${item.quantity}" min="1"/>
                            <input type="submit" value="Cập nhật"/>
                        </form>
                    </td>
                    <td>${item.totalPrice}</td>
                    <td><a href="cart?action=remove&id=${item.product.id}">Xóa</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a href="products">Tiếp tục mua hàng</a>
</body>
</html>
