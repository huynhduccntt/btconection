<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test="${empty sessionScope.user}">
    <c:redirect url="login.jsp" />
    </c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Comment</title>
</head>
<body>
<p>Comment với tư cách ${sessionScope.user.getFullName()}</p>
<form action="Comment" method="post">
<label for="cmt">Comment: </label><br />
<textarea id="cmt" name="cmt" cols="50" rows="7" placeholder="Add your comment here." required="required"></textarea><br />
<input type="hidden" name="action" value="add" />
<input type="submit" name="submit" id="submit" value="OK" />
</form>
<script type="text/javascript">
<c:if test="${sessionScope.add eq 'false'}">
alert("Không thêm được comment, vui lòng thử lại!");
</c:if>
<c:if test="${sessionScope.add eq 'true'}">
var cf = confirm("Đã thêm thành công, bạn có muốn comment tiếp không?");
if(cf == false)
	window.location = "ShowGuestBook.jsp";
else window.location = "AddCmt.jsp";
</c:if>
<c:remove var="add" scope="session"></c:remove>
</script>
</body>
</html>