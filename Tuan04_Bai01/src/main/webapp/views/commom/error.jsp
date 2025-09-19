<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head><title>Lỗi đăng ký</title></head>
<body>
    <h2 style="color:red;">Có lỗi xảy ra!</h2>
    <p>${errors}</p>
    <a href="${pageContext.request.contextPath}/views/user/add.jsp">Quay lại form đăng ký</a>
</body>
</html>
