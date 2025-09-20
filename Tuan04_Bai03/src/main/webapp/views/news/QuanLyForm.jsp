<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/layout.jsp"/>

<h2>Quản lý Tin Tức</h2>

<table>
    <tr>
        <th>Mã TT</th>
        <th>Tiêu đề</th>
        <th>Nội dung</th>
        <th>Liên kết</th>
        <th>Danh mục</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="t" items="${tintucs}">
        <tr>
            <td>${t.matt}</td>
            <td>${t.tieuDe}</td>
            <td>${t.noiDungTT}</td>
            <td><a href="${t.lienKet}" target="_blank">${t.lienKet}</a></td>
            <td>${t.danhMuc.tenDanhMuc}</td>
            <td>
                <form action="${pageContext.request.contextPath}/news/manage" method="post" style="display:inline;">
                    <input type="hidden" name="matt" value="${t.matt}"/>
                    <button type="submit">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</div>
<footer>
    &copy; 2025 - Website of Nguyen Sinh Le | IUH
</footer>
</body>
</html>
