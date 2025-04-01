<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_include.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="dataBaseConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete User</title>
</head>
<body>
    <%
        String userIdParam = request.getParameter("userid");
        if (userIdParam != null) {
            try {
                int userId = Integer.parseInt(userIdParam);
                String query = "DELETE FROM user WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, userId);
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("admin_user.jsp?delete=true");
                    } else {
                        out.println("User not found or could not be deleted.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                }
            } catch (NumberFormatException e) {
                out.println("Invalid user ID format.");
            }
        } else {
            out.println("No user ID provided.");
        }
    %>
</body>
</html>
    