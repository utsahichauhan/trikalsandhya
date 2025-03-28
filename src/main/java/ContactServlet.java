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
import jakarta.servlet.http.HttpSession;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        // Check if the user is logged in
        if (session == null || session.getAttribute("username") == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("contact.jsp?error=not_logged_in");
            return;
        }

        String name = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("userEmail");
        String message = request.getParameter("message");;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

            String query = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();

            response.sendRedirect("contact.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=database_error");
        }
    }
}
