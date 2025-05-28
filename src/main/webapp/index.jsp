<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Account - PC Bank</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('bank-bg.avif') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 1.2s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        header {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.75);
            color: #fff;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-left {
            font-size: 30px;
            font-weight: bold;
        }

        .logo-left span:first-child { color: #00bfff; }
        .logo-left span:last-child { color: orange; }

        .logo-right {
            font-size: 16px;
            font-style: italic;
        }

        .logo-right span:nth-child(1) { color: #00bfff; }
        .logo-right span:nth-child(2) { color: green; }
        .logo-right span:nth-child(3) { color: orange; }

        nav {
            width: 100%;
            background: rgba(0, 34, 80, 0.85);
            display: flex;
            justify-content: center;
            gap: 25px;
            padding: 12px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }

        nav a:hover {
            background: #007bff;
            transform: scale(1.05);
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            margin-top: 40px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 12px 30px rgba(0,0,0,0.4);
            color: #fff;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        input, select {
            padding: 14px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            outline: none;
            background: rgba(255, 255, 255, 0.8);
            color: #333;
        }

        input:focus, select:focus {
            border: 2px solid #007bff;
            box-shadow: 0 0 10px rgba(0,123,255,0.4);
        }

        .btn {
            background: #007bff;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        .nav-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }

        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        .message.success {
            background-color: rgba(40, 167, 69, 0.9);
            color: white;
        }

        .message.error {
            background-color: rgba(220, 53, 69, 0.9);
            color: white;
        }

        @media (max-width: 500px) {
            .nav-buttons {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo-left"><span>PC</span> <span>Bank</span></div>
        <div class="logo-right"><span>PC</span><span> Bank</span><span> Online</span></div>
    </header>

    <nav>
        <a href="home.jsp">Home</a>
        <a href="index.jsp">Open Account</a>
        <a href="actions.jsp">Transactions</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>

    <div class="container">
        <h2>Create New Account</h2>
        <form action="AccountServlet" method="post">
            <input type="text" name="account_number" placeholder="Enter Account Number" required />
            <input type="text" name="account_holder" placeholder="Enter Account Holder Name" required />
            <select name="type" required>
                <option value="">-- Select Account Type --</option>
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select>
            <button class="btn" type="submit">Create Account</button>
        </form>

        <% if (request.getAttribute("message") != null) {
            String msg = request.getAttribute("message").toString();
            boolean isError = msg.toLowerCase().contains("error");
        %>
            <div class="message <%= isError ? "error" : "success" %>">
                <%= msg %>
            </div>
        <% } %>

        <div class="nav-buttons">
            <a href="actions.jsp" class="btn">Go to Transactions</a>
            <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>