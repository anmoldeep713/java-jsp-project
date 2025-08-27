<%@ page import="java.sql.*" %>
<%@ page import="com.preet.mvc.dao.MyConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        form { width: 400px; background: #f4f4f4; padding: 20px; border-radius: 5px; }
        input[type=text], input[type=email] {
            width: 90%; padding: 10px; margin-top: 8px; margin-bottom: 16px; border: 1px solid #ccc;
        }
        input[type=submit] {
            background-color: #2ecc71; color: white; padding: 10px; border: none; width: 100%; cursor: pointer;
        }
    </style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String method = request.getMethod();
    
    if ("POST".equalsIgnoreCase(method)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        try {
            Connection conn = MyConnection.getConnection();
            String sql = "UPDATE students SET name=?, email=?, country=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, country);
            ps.setInt(4, id);
            ps.executeUpdate();
            ps.close();

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        // GET request - load student data
        try {
            Connection conn = MyConnection.getConnection();
            String sql = "SELECT * FROM students WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>

<h2>Edit Student</h2>
<form method="post" action="edit-student.jsp?id=<%= id %>">
    <label>Name:</label>
    <input type="text" name="name" value="<%= rs.getString("name") %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= rs.getString("email") %>" required>

    <label>Country:</label>
    <input type="text" name="country" value="<%= rs.getString("country") %>" required>

    <input type="submit" value="Update Student">
</form>

<a href="index.jsp">Back to Student List</a>

<%
            } else {
                out.println("<p>No student found with ID " + id + "</p>");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
