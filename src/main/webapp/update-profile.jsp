<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String email = (String) session.getAttribute("userEmail");
    String username = "";
    int id = 0;

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            id = rs.getInt("id");
            username = rs.getString("username");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<div class="container mt-5">
    <h3>Update Profile</h3>
    <form action="UpdateProfileServlet" method="post" class="mt-4">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="<%= id %>">

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" value="<%= username %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email (readonly)</label>
            <input type="email" name="email" class="form-control" value="<%= email %>" readonly>
        </div>

        <button type="submit" class="btn btn-primary">Update Profile</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
