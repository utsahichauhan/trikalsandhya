import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        System.out.println("Login attempt with email: " + email);

        if ("admin@123".equals(email.trim()) && "admin".equals(password.trim())) {
            System.out.println("Admin login successful!");
            HttpSession session = request.getSession();
            session.setAttribute("userRole", "admin");
            session.setAttribute("username", "Admin");  // Store 'Admin' as username
            response.sendRedirect("admin_home.jsp");
            return;
        }

        // Check for user login from database
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                String username = rs.getString(2); // Get the username from DB
                String uemail = rs.getString(3);
                System.out.println("User login successful! Username: " + username);
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userEmail", uemail);
                response.sendRedirect("home.jsp");
            } else {
                System.out.println("Invalid login attempt.");
                response.sendRedirect("login.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print exception to logs
            response.sendRedirect("login.jsp?error=db");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Ensure resources are closed properly
            }
        }    }
}