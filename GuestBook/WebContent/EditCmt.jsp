<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <c:if test="${empty sessionScope.user}">
    <c:redirect url="login.jsp" />
    </c:if>
    <c:if test="${empty sessionScope.user}">
    <c:redirect url="login.jsp" />
    </c:if>
    <c:if test="${empty param.id }">
    <c:redirect url="ShowGuestBook.jsp" />
    </c:if>
    <sql:setDataSource driver="com.mysql.jdbc.Driver" 
    url="jdbc:mysql://localhost/guestbook1" 
    user="root" password="1234" />
    <sql:query var="items" sql="select * from cmt where id = ${param.id }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Your Comment</title>
<style>
#datecmt{background-color:pink;color:blue;font-size:large}
input{margin-bottom:10px}
</style>
</head>
<body>
<p>Your Name: ${sessionScope.user.getFullName()}</p>
<form action="Comment" method="post">
<label for="cmt">Nội dung Comment: </label><br />
<textarea id="cmt" name="cmt" cols="50" rows="7" placeholder="Please enter your comment."
 required="required">${items.rows[0].comment }</textarea><br />
<label for="datecmt">Ngày comment: </label>
<input type="text" id="datecmt" name="datecmt" readonly="readonly" value="${items.rows[0].datecmt }"/><br />
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="id" value="${items.rows[0].id }" />
<input type="submit" name="submit" id="submit" value="OK" />
</form>
<a href="ShowGuestBook.jsp"><button>Hủy</button></a>
<script type="text/javascript">
<c:if test="${sessionScope.edit eq 'false'}">
alert("Không sửa được comment, vui lòng thử lại!");
</c:if>
<c:if test="${sessionScope.edit eq 'true'}">
alert("Sửa comment thành công!");
window.location = "ShowGuestBook.jsp";
</c:if>
<c:remove var="edit" scope="session"></c:remove>
</script>
</body>
</html>