<%@ page import="java.sql.*" %>
<%@ page import="com.preet.mvc.dao.MyConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial;
            margin: 40px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: #f9f9f9;
        }
        th, td {
            border: 1px solid #aaa;
            padding: 10px;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #eee;
        }
        a {
            margin: 0 5px;
            text-decoration: none;
            color: #2980b9;
        }
    </style>
</head>
<body>
<h2>Student List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>

<%
    try {
        Connection conn = MyConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM students");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("country") %></td>
        <td>
            <a href="edit-student.jsp?id=<%= rs.getInt("id") %>">Edit</a>
            <a href="delete-student.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
    </tr>
<%
        }
        rs.close();
        stmt.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
        e.printStackTrace();
    }
%>
</table>

<br>
<a href="add-student.jsp">Add New Student</a>

</body>
</html>
