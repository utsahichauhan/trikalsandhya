<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    if (session != null) { 
        session.invalidate(); // Destroy the session
    }

    response.sendRedirect("home.jsp"); // Redirect to home page
%>
