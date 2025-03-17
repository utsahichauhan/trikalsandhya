<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
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
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john@example.com</td>
                    <td>Admin</td>
                    <td>
                        <button class="btn btn-primary btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane@example.com</td>
                    <td>User</td>
                    <td>
                        <button class="btn btn-primary btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
