<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!doctype html>
<html>
   <head>
      <title>JSTL sql:setDataSource Tag</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         user = "root"  password = "1234"/>
      <sql:query dataSource = "${snapshot}" sql = "select * from cmt" var = "result" />
      
   </body>
</html>