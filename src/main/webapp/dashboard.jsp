<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, bank_system.DBConnection" %>
<html>
<head>
    <title>PC Bank Dashboard</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;700&display=swap">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('b3.jpeg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            animation: fadeIn 1.2s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        header {
            width: 100%;
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 20px 40px;
            font-size: 32px;
            font-weight: bold;
            text-shadow: 1px 1px 5px #000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo-left {
            font-family: Arial, sans-serif;
            font-style: italic;
            font-size: 28px;
        }

        .logo-left span:first-child {
            color: #00bfff;
        }

        .logo-left span:last-child {
            color: orange;
        }

        .logo-right {
            font-family: Arial, sans-serif;
            font-style: italic;
            font-size: 18px;
        }

        .logo-right span:nth-child(1) {
            color: #00bfff;
        }

        .logo-right span:nth-child(2) {
            color: green;
        }

        .logo-right span:nth-child(3) {
            color: orange;
        }

        nav {
            margin-left: auto;
            font-size: 16px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ffc107;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            animation: slideUp 0.8s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #1f2e45;
        }

        .dashboard-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            flex: 1 1 250px;
            background: #007bff;
            color: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px) scale(1.02);
        }

        .card h3 {
            margin: 0 0 10px;
            font-size: 20px;
        }

        .card p {
            font-size: 18px;
            font-weight: bold;
        }

        canvas {
            max-width: 600px;
            margin: 40px auto;
            display: block;
        }

        .message {
            margin-top: 25px;
            background-color: #ffc107;
            padding: 15px;
            border-radius: 8px;
            color: #333;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .dashboard-cards {
                flex-direction: column;
                align-items: center;
            }

            nav {
                width: 100%;
                margin-top: 10px;
                text-align: right;
            }

            header {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="logo-left">
        <span>PC</span><span> Bank</span>
    </div>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="index.jsp">Create Account</a>
        <a href="actions.jsp">Transactions</a>
        <a href="contact.jsp">Contact</a>
    </nav>
    <div class="logo-right">
        <span>PC</span><span> Bank</span><span> Online</span>
    </div>
</header>

<%
    int totalAccounts = 0;
    double totalBalance = 0;
    String latestAccount = "";
    String error = null;
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement()) {
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM accounts");
        if (rs.next()) totalAccounts = rs.getInt(1);

        rs = stmt.executeQuery("SELECT IFNULL(SUM(balance),0) FROM accounts");
        if (rs.next()) totalBalance = rs.getDouble(1);

        rs = stmt.executeQuery("SELECT account_holder FROM accounts ORDER BY transaction_id DESC LIMIT 1");
        if (rs.next()) latestAccount = rs.getString(1);
    } catch (Exception e) {
        error = e.getMessage();
    }
%>

<div class="container">
    <h2>Welcome to Bank Dashboard</h2>

    <div class="dashboard-cards">
        <div class="card">
            <h3>Total Accounts</h3>
            <p><%= totalAccounts %></p>
        </div>
        <div class="card">
            <h3>Total Balance</h3>
            <p>$<%= String.format("%.2f", totalBalance) %></p>
        </div>
        <div class="card">
            <h3>Latest Account</h3>
            <p><%= latestAccount.isEmpty() ? "—" : latestAccount %></p>
        </div>
    </div>

    <h2>Bank Analytics</h2>
    <canvas id="accountBarChart"></canvas>
    <canvas id="accountTypePieChart"></canvas>

    <% if (error != null) { %>
        <div class="message">Error: <%= error %></div>
    <% } %>
</div>

<script>
    // Bar Chart
    const barCtx = document.getElementById('accountBarChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: ['Total Accounts', 'Total Balance'],
            datasets: [{
                label: 'Summary',
                data: [<%= totalAccounts %>, <%= totalBalance %>],
                backgroundColor: ['#007bff', '#28a745'],
                borderRadius: 10
            }]
        },
        options: {
            plugins: {
                legend: { display: false },
                title: { display: true, text: 'Accounts vs Balance' }
            },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Pie Chart (Mock Data)
    const pieCtx = document.getElementById('accountTypePieChart').getContext('2d');
    new Chart(pieCtx, {
        type: 'pie',
        data: {
            labels: ['Savings', 'Current', 'Fixed Deposit'],
            datasets: [{
                data: [65, 25, 10],
                backgroundColor: ['#ffc107', '#17a2b8', '#dc3545'],
            }]
        },
        options: {
            plugins: {
                title: { display: true, text: 'Account Type Distribution' }
            }
        }
    });
</script>
</body>
</html>