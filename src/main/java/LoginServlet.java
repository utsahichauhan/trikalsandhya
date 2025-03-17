import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Login attempt with email: " + email);

        // Check for admin login (Hardcoded)
        if ("admin@123".equals(email.trim()) && "admin".equals(password.trim())) {
            System.out.println("Admin login successful!");
            HttpSession session = request.getSession();
            session.setAttribute("userRole", "admin");
            session.setAttribute("username", "Admin");  // Store 'Admin' as username
            response.sendRedirect("admin_home.jsp");
            return;
        }

        // Check for user login from database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

            String query = "SELECT username FROM user WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username"); // Get the username from DB
                System.out.println("User login successful! Username: " + username);

                // Store username in session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirect to home page
                response.sendRedirect("home.jsp");
            } else {
                System.out.println("Invalid login attempt.");
                response.sendRedirect("login.jsp?error=invalid");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db");
        }
    }
}
