<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_include.jsp" %>
<%@ page import = "java.sql.*" %>
<%@ include file="dataBaseConnection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        input[type="number"],
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="number"][readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="admin_sidebar.jsp" %>
    <div class="content" style="margin-left: 260px; padding: 20px;">
        <h2>Edit User</h2>
        <form method="POST">
            <%
                String useridParam = request.getParameter("userid");
                int userId = -1;

                if (useridParam != null) {
                    try {
                        userId = Integer.parseInt(useridParam.trim());

                        String query = "SELECT * FROM user WHERE id = ?";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setInt(1, userId);
                            try (ResultSet rs = ps.executeQuery()) {
                                if (rs.next()) {
            %>
            <!-- Form for updating user -->
            <div class="form-group">
                <label for="userID">User ID</label>
                <input type="number" id="userID" value="<%= rs.getInt(1)%>" readonly>
            </div>
            <div class="form-group">
                <label for="updateUserName">Name</label>
                <input type="text" id="updateUserName" name="updateUserName" placeholder="Enter user name" value="<%= rs.getString("username") %>">
            </div>
            <div class="form-group">
                <label for="updateUserEmail">Email</label>
                <input type="text" id="updateUserEmail" name="updateUserEmail" placeholder="Enter user email" value="<%= rs.getString("email") %>">
            </div>
            <input type="submit" value="Update User">
            <%
                                } else {
                                    out.println("<p>User not found.</p>");
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                        }
                    } catch (NumberFormatException e) {
                        out.println("<p>Invalid user ID format. Please provide a valid numeric ID.</p>");
                    }
                } else {
                    out.println("<p>No user ID provided. Please provide a valid user ID in the URL.</p>");
                }
               if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String updatedName = request.getParameter("updateUserName");
                    String updatedEmail = request.getParameter("updateUserEmail");
                    if (updatedName == null || updatedName.trim().isEmpty() || updatedEmail == null || updatedEmail.trim().isEmpty()) {
                        out.println("<p>Please fill in all fields.</p>");
                    } else {
                        try {
                            String updateQuery = "UPDATE user SET username = ?, email = ? WHERE id = ?";
                            try (PreparedStatement psUpdate = con.prepareStatement(updateQuery)) {
                                psUpdate.setString(1, updatedName);
                                psUpdate.setString(2, updatedEmail);
                                psUpdate.setInt(3, userId);

                                int rowsUpdated = psUpdate.executeUpdate();
                                if (rowsUpdated > 0) {
                                    out.println("<p>User updated successfully.</p>");
                                    response.sendRedirect("admin_user.jsp?delete=true");
                                } else {
                                    out.println("<p>Failed to update the user.</p>");
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("<p>Error updating user: " + e.getMessage() + "</p>");
                        }
                    }
                }
            %>
        </form>
    </div>
</body>
</html>