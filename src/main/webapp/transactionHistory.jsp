<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transaction History - PC Bank</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: url('transaction.jpeg') no-repeat center center fixed;
            background-size: cover;
            color: #000;
        }

        header {
            background-color: #002147;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            color: white;
        }

        .brand-left {
            font-family: Arial, sans-serif;
            font-size: 30px;
            font-style: italic;
        }

        .brand-left span:first-child {
            color: #00bfff;
        }

        .brand-left span:last-child {
            color: orange;
        }

        .brand-right {
            font-family: Arial, sans-serif;
            font-size: 18px;
            font-style: italic;
        }

        .brand-right span:nth-child(1) {
            color: #00bfff;
        }

        .brand-right span:nth-child(2) {
            color: green;
        }

        .brand-right span:nth-child(3) {
            color: orange;
        }

        nav {
            background: #014282;
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        nav a:hover {
            background: #0066cc;
            border-radius: 5px;
        }

        .content {
            background: rgba(255, 255, 255, 0.95);
            margin: 30px auto;
            padding: 30px;
            width: 90%;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background: #014282;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        footer {
            background: #002147;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header>
    <div class="brand-left">
        <span>PC</span> <span>Bank</span>
    </div>
    <div class="brand-right">
        <span>PC</span><span>Bank</span><span>Online</span>
    </div>
</header>

<nav>
    <a href="home.jsp">Home</a>
    <a href="index.jsp">Open Account</a>
    <a href="actions.jsp">Transactions</a>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="transactionHistory.jsp">Transaction History</a>
    <a href="contact.jsp">Contact Us</a>
</nav>

<div class="content">
    <h2 style="text-align:center; color:#014282;">Transaction History</h2>

    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "pc@12345");

            String query = "SELECT * FROM accounts ORDER BY timestamp DESC";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
    %>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Account Number</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Date/Time</th>
            </tr>
            <%
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("transaction_id") %></td>
                <td><%= rs.getString("account_number") %></td>
                <td><%= rs.getString("type") %></td>
                <td><%= rs.getDouble("balance") %></td>
                <td><%= rs.getTimestamp("timestamp") %></td>
            </tr>
            <% } %>
        </table>
    <%
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</div>

<footer>
    &copy; 2025 PC Bank. All rights reserved. | Contact: support@pcbank.com
</footer>

</body>
</html>