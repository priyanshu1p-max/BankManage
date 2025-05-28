package bank_system;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String accNo = req.getParameter("account_number");
		String name = req.getParameter("account_holder");
		String type = req.getParameter("type");

		try (Connection conn = DBConnection.getConnection()) {
			String query = "INSERT INTO accounts (account_number, account_holder, type) VALUES (?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, accNo);
			stmt.setString(2, name);
			stmt.setString(3, type);

			stmt.executeUpdate();
			req.setAttribute("message", "Account Created Successfully!");
		} catch (SQLException e) {
			req.setAttribute("message", "Error: " + e.getMessage());
		}

		RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		rd.forward(req,res);
	}
}