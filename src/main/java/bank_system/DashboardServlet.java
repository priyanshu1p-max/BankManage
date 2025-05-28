package bank_system;


import java.io.IOException;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
            Statement stmt = conn.createStatement();

            ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM accounts");
            if (rs1.next()) request.setAttribute("totalAccounts", rs1.getInt(1));

            ResultSet rs2 = stmt.executeQuery("SELECT SUM(balance) FROM accounts");
            if (rs2.next()) request.setAttribute("totalBalance", rs2.getDouble(1));

            ResultSet rs3 = stmt.executeQuery("SELECT account_holder FROM accounts ORDER BY account_number DESC LIMIT 1");
            if (rs3.next()) request.setAttribute("latestAccount", rs3.getString(1));

        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        rd.forward(request, response);
 }
}