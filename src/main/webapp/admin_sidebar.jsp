<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar">
    <div>
        <h4 class="text-center">Admin Panel</h4>
        <a href="admin_user.jsp">User</a>
        <a href="admin_settings.jsp">System Settings</a>
        <a href="add_shlok.jsp">Ramayan Slok</a>
        <a href="add_shloka.jsp">Geeta Slok</a>
    </div>
    <div class="profile-section">
        <img src="img/user1.jpg" alt="Profile Picture">
        <span>Admin</span>
        <a href="logout.jsp" style="color: red;">Logout</a>
    </div>
</div>

<style>
    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #343a40;
        color: white;
        padding-top: 20px;
        position: fixed;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .sidebar a {
        display: block;
        color: white;
        padding: 15px;
        text-decoration: none;
    }
    .sidebar a:hover {
        background-color: #495057;
    }
    .profile-section {
        text-align: center;
        padding: 15px;
        border-top: 1px solid #495057;
        margin-top: auto;
    }
    .profile-section img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: block;
        margin: 0 auto 10px;
    }
    
</style>
