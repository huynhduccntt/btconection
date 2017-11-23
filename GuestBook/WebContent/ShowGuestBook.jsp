<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <c:if test="${empty sessionScope.user}">
    <c:redirect url="login.jsp" />
    </c:if>
    
    <sql:setDataSource driver="com.mysql.jdbc.Driver" 
    url="jdbc:mysql://localhost/guestbook1" 
    user="root" password="1234" />
    <sql:query var="items" sql="select * from cmt"/>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Guest Book Application</title>
<style type="text/css">
table{border:1px solid #000;border-collapse:collapse;font-size:large;padding:16px}
td, th{border:1px solid #000; padding:10px;text-align:center}
p{color:red;font-size:25px}
</style>
</head>
<body>
<p>HELLO ${sessionScope.user.getFullName()}, Welcome</p>
<table>
<caption>Guest Book</caption>
<tr>
<c:forEach begin="1" items="${items.getColumnNames() }" var ="colHeader">
<th>${colHeader}</th>
</c:forEach>
<th colspan="2">Thao tác</th>
</tr>
<c:forEach items="${items.getRows()}" var="row">
<tr>
<td>${row.username}</td>
<td>${row.comment}</td>
<td>${row.datecmt}</td>
<c:if test="${sessionScope.user.getUserName() eq row.username }">
<td><a href="EditCmt.jsp?id=${row.id }">Sửa</a></td>
<td><a href="Comment?action=delete&id=${row.id}" 
onclick="return confirm('Do you want to delete this comment?');">Xóa</a></td>
</c:if>
</tr>
</c:forEach>
</table>
<p><strong>Total comments: ${items.getRowCount()}</strong></p>
<a href="AddCmt.jsp">Add comment</a>
<a href="logout.jsp">Logout</a>
<script type="text/javascript">
<c:if test="${sessionScope.delete eq 'false'}">
alert("Failed, Please try again!");
</c:if>
<c:if test="${sessionScope.delete eq 'true'}">
alert("Completed!");
window.location = "ShowGuestBook.jsp";
</c:if>
<c:remove var="delete" scope="session"></c:remove>
</script>
</body>
</html>