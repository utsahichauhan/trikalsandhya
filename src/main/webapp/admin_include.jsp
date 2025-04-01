<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminInclude</title>
    </head>
    <body>
        <%
                if (session == null || session.getAttribute("userRole") == null || !"admin".equals(session.getAttribute("userRole"))) {
                response.sendRedirect("login.jsp?Admin=true");
                return;
            }
        %>
    </body>
</html>
