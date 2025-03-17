import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("newUsername");
        String email = request.getParameter("email");
        String password = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!');window.location='register.jsp';</script>");
            return;
        }
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
            
            String query = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            
            int result = pstmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp?success=registered");
            } else {
                out.println("<script>alert('Registration failed!');window.location='register.jsp';</script>");
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert(\"Error: " + e.getMessage().replace("\"", "\\\"") + "\");window.location='register.jsp';</script>");
        }
    }
}
