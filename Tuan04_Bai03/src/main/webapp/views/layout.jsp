<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý tin tức</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        header { background: #0066cc; color: white; padding: 15px; text-align: center; font-size: 24px; }
        nav { background: #003366; padding: 10px; }
        nav a { margin: 0 15px; text-decoration: none; color: white; font-weight: bold; }
        nav a:hover { text-decoration: underline; }
        footer { background: #f2f2f2; padding: 10px; text-align: center; margin-top: 20px; }
        .container { padding: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #0066cc; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f1f1f1; }
        button { background: #0066cc; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        button:hover { background: #004d99; }
    </style>
</head>
<body>
<header>
    Quản Lý Tin Tức Trực Tuyến
</header>

<nav>
    <a href="${pageContext.request.contextPath}/news">Danh sách tin tức</a>
    <a href="${pageContext.request.contextPath}/news/add">Thêm tin</a>
    <a href="${pageContext.request.contextPath}/news/manage">Quản lý</a>
</nav>

<div class="container">
    <jsp:include page="${bodyPage}" />
</div>
</body>
</html>
