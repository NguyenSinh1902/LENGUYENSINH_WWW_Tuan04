<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/layout.jsp"/>

<h2>Thêm Tin Tức</h2>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/news/add" method="post">
    Tiêu đề: <input type="text" name="tieuDe" required><br/><br/>
    Nội dung: <textarea name="noiDungTT" maxlength="255" required></textarea><br/><br/>
    Liên kết: <input type="text" name="lienKet" placeholder="http://..." required><br/><br/>
    Danh mục:
    <select name="madm">
        <c:forEach var="d" items="${danhmucs}">
            <option value="${d.madm}">${d.tenDanhMuc}</option>
        </c:forEach>
    </select><br/><br/>
    <button type="submit">Thêm</button>
</form>

</div>
<footer>
    &copy; 2025 - Website of Nguyen Sinh Le | IUH
</footer>
</body>
</html>
