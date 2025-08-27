<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
<h1>Add New User</h1>
<form method="post" action="validate.jsp">
    <input type="text" name="name" placeholder="Enter Name" required><br><br>
    <input type="text" name="email" placeholder="Enter Email" required><br><br>
    <input type="submit" value="Add User">
</form>
<br>
<a href="list.jsp">View All Users</a>
</body>
</html>
