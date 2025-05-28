<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us - PC Bank</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;700&display=swap">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('b1.avif') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            animation: fadeIn 1.2s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        header {
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 25px 0 15px;
            font-size: 30px;
            font-weight: bold;
            letter-spacing: 1px;
            text-shadow: 1px 1px 4px #000;
            position: relative;
        }

        .header-left {
            position: absolute;
            left: 20px;
            top: 25px;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-size: 28px;
        }

        .header-left span:first-child {
            color: #00bfff; /* Light blue */
        }

        .header-left span:last-child {
            color: orange;
        }

        .header-right {
            position: absolute;
            right: 20px;
            top: 28px;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-size: 16px;
        }

        .header-right span:nth-child(1) {
            color: #00bfff; /* Light blue */
        }

        .header-right span:nth-child(2) {
            color: green;
        }

        .header-right span:nth-child(3) {
            color: orange;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            text-align: center;
            animation: slideUp 1s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
            color: #003366;
        }

        .contact-info {
            font-size: 18px;
            line-height: 1.8;
        }

        .contact-info strong {
            color: #007bff;
        }

        .email-button {
            margin-top: 25px;
            display: inline-block;
            padding: 12px 25px;
            background: #007bff;
            color: white;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .email-button:hover {
            background: #0056b3;
        }

        nav {
            margin-top: 30px;
        }

        nav a {
            color: #007bff;
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
        }

        nav a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-left">
            <span>PC</span><span> Bank</span>
        </div>
        <div class="header-right">
            <span>PC</span><span> Bank</span><span> Online</span>
        </div>
    </header>

    <div class="container">
        <h2>We’re here to help!</h2>

        <div class="contact-info">
            <p><strong>Mobile:</strong> 807745116</p>
            <p><strong>Telephone:</strong> 11994352</p>
            <p><strong>Email:</strong> chhimwalpriyanshu123@gmail.com</p>
        </div>

        <a class="email-button" href="mailto:chhimwalpriyanshu123@gmail.com">Mail Us</a>

        <nav>
            <a href="home.jsp">Home</a> |
            <a href="index.jsp">Create Account</a> |
            <a href="actions.jsp">Transactions</a> |
            <a href="dashboard.jsp">Dashboard</a>
        </nav>
    </div>
</body>
</html>