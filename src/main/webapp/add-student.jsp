<%@ page import="java.sql.*" %>
<%@ page import="com.preet.mvc.dao.MyConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial;
            margin: 40px;
            padding:10px;
        }
        form {
            width: 500px;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 5px;
        }
        input[type=text], input[type=email] {
            width: 95%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
        }
        input[type=submit] {
            background-color: #3498db;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            cursor: pointer;
        }
        a {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<%
    // Only run insert if form was submitted (POST)
    String method = request.getMethod();
    if ("POST".equalsIgnoreCase(method)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        try {
            Connection conn = MyConnection.getConnection();
            String sql = "INSERT INTO students (name, email, country) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, country);
            int row = ps.executeUpdate();
            ps.close();

            // Redirect after successful insert
            if (row > 0) {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<h2>Add New Student</h2>
<form method="post" action="add-student.jsp">
    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Country:</label>
    <input type="text" name="country" required>

    <input type="submit" value="Add Student">
</form>

<a href="index.jsp">Back to Student List</a>

</body>
</html>
