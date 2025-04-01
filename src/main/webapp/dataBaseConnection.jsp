<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>
<%
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
