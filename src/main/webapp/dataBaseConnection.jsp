<!DOCTYPE html>
<%@ page import="java.sql.*;" %>
<html>
    <body>
        <%
             Connection con = null;
             try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/trikalsandhya", "root", "");
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
    </body>
</html>
