<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Transactions - PC Bank</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('bank.jpeg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .top-bar {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 25px;
            background-color: rgba(0, 0, 0, 0.6);
        }

        .top-bar .left {
            font-family: Arial, sans-serif;
            font-size: 26px;
            font-style: italic;
        }

        .top-bar .left span:first-child {
            color: #00bfff; /* Light Blue */
        }

        .top-bar .left span:last-child {
            color: orange;
        }

        .top-bar .right {
            font-family: Arial, sans-serif;
            font-size: 18px;
            font-style: italic;
        }

        .top-bar .right span:nth-child(1) {
            color: #00bfff;  /* Light Blue */
        }

        .top-bar .right span:nth-child(2) {
            color: green;
        }

        .top-bar .right span:nth-child(3) {
            color: orange;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin: 40px 0;
            width: 90%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            color: #1f2e45;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="text"],
        input[type="number"] {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.2s ease, background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .nav {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 10px;
        }

        .nav a {
            text-decoration: none;
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .nav a:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .message {
            margin-top: 20px;
            color: #155724;
            background: #d4edda;
            padding: 10px;
            border-radius: 6px;
        }

        .image-box {
            margin-top: 20px;
            animation: fadeImage 1.2s ease forwards;
        }

        @keyframes fadeImage {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        .image-box img {
            width: 100%;
            max-width: 300px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        @media (max-width: 500px) {
            .nav {
                flex-direction: column;
                align-items: center;
            }

            .top-bar {
                flex-direction: column;
                text-align: center;
                gap: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <div class="left">
            <span>PC</span> <span>Bank</span>
        </div>
        <div class="right">
            <span>PC</span> <span>Bank</span> <span>Online</span>
        </div>
    </div>

    <div class="container">
        <h2>Bank Transactions</h2>
        <form method="post" action="ActionServlet">
            <input type="text" name="account_number" placeholder="Account Number" required>
            <input type="number" name="amount" placeholder="Amount (Optional for Balance)" step="0.01">
            <button name="action" value="deposit">Deposit</button>
            <button name="action" value="withdraw">Withdraw</button>
            <button name="action" value="balance">Check Balance</button>
        </form>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message"><%= request.getAttribute("message") %></div>
        <% } %>

        <div class="image-box">
            <img src="bank.jpeg" alt="Bank Transactions">
        </div>

        <div class="nav">
            <a href="home.jsp">Home</a>
            <a href="index.jsp">Account Creation</a>
            <a href="dashboard.jsp">Dashboard</a>
        </div>
    </div>
</body>
</html>