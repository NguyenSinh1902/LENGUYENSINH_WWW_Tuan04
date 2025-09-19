<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Danh sách User</title></head>
<body>
<h2>Danh sách User</h2>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Email</th>
        <th>Birthday</th>
        <th>Gender</th>
    </tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.id}</td>
            <td>${u.firstName}</td>
            <td>${u.lastName}</td>
            <td>${u.email}</td>
            <td>${u.birthday}</td>
            <td>${u.gender}</td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/views/user/add.jsp">Đăng ký mới</a>
</body>
</html>
