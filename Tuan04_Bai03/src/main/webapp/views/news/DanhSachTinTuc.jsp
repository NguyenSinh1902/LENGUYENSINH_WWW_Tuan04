<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/layout.jsp"/>

<h2>Danh mục</h2>
<ul>
    <c:forEach var="d" items="${danhmucs}">
        <li><a href="${pageContext.request.contextPath}/news?madm=${d.madm}">${d.tenDanhMuc}</a></li>
    </c:forEach>
</ul>

<h2>Danh sách tin tức</h2>
<table>
    <tr>
        <th>Mã TT</th>
        <th>Tiêu đề</th>
        <th>Nội dung</th>
        <th>Liên kết</th>
        <th>Danh mục</th>
    </tr>
    <c:forEach var="t" items="${tintucs}">
        <tr>
            <td>${t.matt}</td>
            <td>${t.tieuDe}</td>
            <td>${t.noiDungTT}</td>
            <td><a href="${t.lienKet}" target="_blank">${t.lienKet}</a></td>
            <td>${t.danhMuc.tenDanhMuc}</td>
        </tr>
    </c:forEach>
</table>

</div>
<footer>
    &copy; 2025 - Website of Nguyen Sinh Le | IUH
</footer>
</body>
</html>
