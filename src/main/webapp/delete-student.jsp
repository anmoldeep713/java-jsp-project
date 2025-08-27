<%@ page import="java.sql.*" %>
<%@ page import="com.preet.mvc.dao.MyConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = MyConnection.getConnection();
        String sql = "DELETE FROM students WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();

        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error deleting student: " + e.getMessage() + "</p>");
    }
%>
