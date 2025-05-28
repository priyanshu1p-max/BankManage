package bank_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoanServlet")
public class LoanServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/pcbank";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "pc@12345"; // update if needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String action = request.getParameter("action");

         if ("apply".equals(action)) {
             applyForLoan(request, response);
             }
         }
       
    private void applyForLoan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accNo = request.getParameter("account_number");
        String loanType = request.getParameter("loan_type");
        double amount = Double.parseDouble(request.getParameter("amount"));
        double interestRate = Double.parseDouble(request.getParameter("interest_rate"));
        int duration = Integer.parseInt(request.getParameter("duration_years"));
        LocalDate startDate = LocalDate.now();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO loans (account_number, loan_type, amount, interest_rate, duration_years, start_date, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accNo);
            ps.setString(2, loanType);
            ps.setDouble(3, amount);
            ps.setDouble(4, interestRate);
            ps.setInt(5, duration);
            ps.setDate(6, Date.valueOf(startDate));
            ps.setString(7, "Pending");

            int rows = ps.executeUpdate();
            if (rows > 0) {
                request.setAttribute("message", "Loan application submitted successfully!");
            } else {
                request.setAttribute("message", "Loan application failed. Try again.");
            }

       ps.close();