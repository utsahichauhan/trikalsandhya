<%@ page import="java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ include file="dataBaseConnection.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .toast {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #4CAF50;
                color: white;
                padding: 16px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                opacity: 0;
                visibility: hidden;
                transition: opacity 0.5s, visibility 0.5s;
                font-size: 16px;
            }
            .toast.show {
                opacity: 1;
                visibility: visible;
            }
            /* Add animation for table rows */
            @keyframes fadeInRow {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Animate each row on page load */
            .table tbody tr {
                animation: fadeInRow 0.5s ease-out;
            }

            /* Button hover effect */
            .btn-primary, .btn-danger {
                transition: transform 0.3s ease, background-color 0.3s ease;
            }

            .btn-primary:hover, .btn-danger:hover {
                transform: scale(1.1);
                background-color: #0056b3; /* Darker blue on hover for primary */
            }

            /* Fade-in animation for content */
            .content {
                opacity: 0;
                animation: fadeInContent 1s forwards;
            }

            @keyframes fadeInContent {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
        </style>
         <script>
        window.onload = function () {
            var editedSuccess  ="<%= request.getParameter("delete")%>";
            var deleteSuccess = "<%= request.getParameter("delete") %>";
            var toast = document.getElementById('toast');
            if (deleteSuccess === 'true' || editedSuccess === "true") {
                toast.classList.add('show');
                setTimeout(function () {
                    toast.classList.remove('show');
                }, 6000);
            }
        };
    </script>
    </head>
    <body>
        <%@ include file="admin_sidebar.jsp" %>
        <div class="content" style="margin-left: 260px; padding: 20px;">
            <h2>User Management</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    Statement st = null;
                    ResultSet rs = null;

                    try {
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * FROM user");
                        while (rs.next()) {
                            int userId = rs.getInt(1);
                            String userName = rs.getString(2);
                            String userEmail = rs.getString(3);

                            out.println("<tr>");
                            out.println("<td>" + userId + "</td>");
                            out.println("<td>" + userName + "</td>");
                            out.println("<td>" + userEmail + "</td>");
                            out.println("<td>User</td>");
                            out.println("<td>");
                            out.println("<button class='btn btn-primary' onclick='redirectToPage(" + userId + ")'>Edit</button> ");
                            out.println("<button class='btn btn-danger' onclick='deleteUser(" + userId + ")'>Delete</button>");
                            out.println("</td>");
                            out.println("</tr>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (st != null) st.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    %>
                </tbody>
            </table>
        </div>
         <div id="toast" class="toast">
         User deleted successfully.
        </div>
        <script>
            function redirectToPage(userId) {
                window.location.href = "admin_edit_user.jsp?userid=" + userId;
            }

            function deleteUser(userId) {
                if (confirm("Are you sure you want to delete this user?")) {
                    window.location.href = "deleteUser.jsp?userid=" + userId;
                }
            }
        </script>
        <div id="toast" class="toast">
            <strong>Success!</strong> User has been deleted/Edited successfully.
        </div>
    </body>
</html>
