<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Ensure the session contains a username. If not, set it to "Guest".
    if (session.getAttribute("username") == null) {
        session.setAttribute("username", "Guest");
    }

    String username = (String) session.getAttribute("username");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">Trikalsandhya</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ramayan.jsp">Ramayan</a></li>
                <li class="nav-item"><a class="nav-link" href="geeta.jsp">Geeta</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>

                <%
                    if (!"Guest".equals(username)) {
                %>
                    <!-- If logged in, show username and logout -->
                    <li class="nav-item">
                        <a class="nav-link"><b>Welcome, <%= username %></b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="logout.jsp">Logout</a>
                    </li>
                    <!-- Add "Update Profile" button if logged in -->
                    <li class="nav-item">
                        <a class="nav-link" href="update-profile.jsp">Update Profile</a>
                    </li>
                <%
                    } else {
                %>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
