

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class AddGeetaShlokServlet
 */
@WebServlet("/AddGeetaShlokServlet")
public class AddGeetaShlokServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/trikalsandhya";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = ""; // change to your password
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGeetaShlokServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        int shlokNumber = Integer.parseInt(request.getParameter("shlok_number"));
        String shlokText = request.getParameter("shlok_text");
        String translationGujarati = request.getParameter("translation_gujarati");
        String translationEnglish = request.getParameter("translation_english");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to DB
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL insert query
            String sql = "INSERT INTO geeta_shlok (adhyay, shlok_number, shlok_text, translation_gujarati, translation_english) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set values
            pstmt.setInt(1, adhyay);
            pstmt.setInt(2, shlokNumber);
            pstmt.setString(3, shlokText);
            pstmt.setString(4, translationGujarati);
            pstmt.setString(5, translationEnglish);

            // Execute
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("shlok-save-success.jsp"); // Optional success page
            } else {
                response.getWriter().println("Failed to insert Shloka.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            // Clean up
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    
	}

}
