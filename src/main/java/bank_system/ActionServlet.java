package bank_system;


import java.io.*;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ActionServlet")

public class ActionServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String accNo = req.getParameter("account_number");
        String action = req.getParameter("action");
        String amountStr = req.getParameter("amount");
        double amount = amountStr.isEmpty() ? 0 : Double.parseDouble(amountStr);

        try (Connection conn = DBConnection.getConnection()) {
        	conn.setAutoCommit(false);
            PreparedStatement stmt;
            ResultSet rs;
            int rowsAffected;

            switch (action) {
                case "deposit":
                    stmt = conn.prepareStatement("UPDATE accounts SET balance = IFNULL(balance,0) + ? WHERE account_number = ?");
                    stmt.setDouble(1, amount);
                    stmt.setString(2, accNo);
                    rowsAffected = stmt.executeUpdate();
                    
                    if(rowsAffected > 0) {
                    	conn.commit();
                    	req.setAttribute("message","Deposit Successful");
                    }else {
                    	conn.rollback();
                    	req.setAttribute("message","Deposit Failed: Account not found");
                    }
                    
                    break;

                case "withdraw":
                    stmt = conn.prepareStatement("SELECT IFNULL(balance, 0) AS balance FROM accounts WHERE account_number = ?");
                    stmt.setString(1, accNo);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                    	double currentBalance=rs.getDouble("balance");
                    	if(currentBalance >= amount) {
                    	
                        stmt = conn.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE account_number = ?");
                        stmt.setDouble(1, amount);
                        stmt.setString(2, accNo);
                        rowsAffected = stmt.executeUpdate();
                        
                        if(rowsAffected > 0) {
                        	conn.commit();
                        	req.setAttribute("message", "Withdraw Successful");
                        } else {
                        	conn.rollback();
                        	req.setAttribute("message", "Withdrawal failed");
                        }
                    } else {
                        req.setAttribute("message", "Insufficient Balance ");
                    }
                    } else {
                    	req.setAttribute("message", "Account not found");
                    }
                    break;

                case "balance":
                    stmt = conn.prepareStatement("SELECT account_holder, balance FROM accounts WHERE account_number = ?");
                    stmt.setString(1, accNo);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        req.setAttribute("message", "Account Holder: " + rs.getString("account_holder") + "<br>Balance: " + rs.getDouble("balance"));
                    } else {
                        req.setAttribute("message", "Account Not Found");
                    }
                    break;
            }
        } catch (SQLException e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher rd = req.getRequestDispatcher("actions.jsp");
        rd.forward(req, res);
 }
}