<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PC Bank | Apply for Loan</title>
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Urbanist', sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            background-image: url('loan-personal.jpg');
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(3px);
            min-height: 100vh;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 15px 30px;
            color: #fff;
        }

        .navbar .brand {
            font-size: 24px;
            font-weight: bold;
            color: #00e1ff;
            text-shadow: 1px 1px 5px #000;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .navbar ul li a {
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .navbar ul li a:hover {
            color: #00e1ff;
        }

        /* Loan Card */
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
            padding: 20px;
        }

        .loan-card {
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.4);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 30px;
            max-width: 500px;
            width: 90%;
            color: #fff;
            animation: slideIn 0.8s ease-in-out;
        }

        @keyframes slideIn {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h2 {
            font-size: 32px;
            margin-bottom: 20px;
            font-weight: 700;
            color: #00008B;
            text-align: center;
            text-shadow: 1px 1px 2px #000;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        input, select {
            padding: 14px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            color: #333;
        }

        input[readonly] {
            background-color: #e0e0e0;
            color: #666;
            font-weight: bold;
        }

        button {
            background-color: #00bcd4;
            border: none;
            padding: 14px;
            font-size: 17px;
            color: white;
            border-radius: 12px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #007e91;
            transform: scale(1.05);
        }

        .message {
            margin-top: 15px;
            background: rgba(0, 255, 0, 0.15);
            color: #d4ffdf;
            padding: 10px;
            text-align: center;
            border-radius: 8px;
        }

        @media(max-width: 600px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }
            .navbar ul {
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }
            h2 {
                font-size: 26px;
            }
            .loan-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="brand">PC Bank</div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="transactionHistory.jsp">Transaction History</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Loan Form -->
<div class="container">
    <div class="loan-card">
        <h2>Apply for a Loan</h2>
        <form action="LoanServlet" method="post">
            <input type="text" name="account_number" placeholder="Account Number" required>
            <select name="loan_type" required>
                <option value="">-- Select Loan Type --</option>
                <option value="Home Loan">Home Loan</option>
                <option value="Car Loan">Car Loan</option>
                <option value="Business Loan">Business Loan</option>
                <option value="Personal Loan">Personal Loan</option>
            </select>
            <input type="number" name="amount" placeholder="Loan Amount" step="0.01" required>
            <input type="number" name="interest_rate" value="11" readonly>
            <input type="number" name="duration_years" placeholder="Duration (Years)" required>
            <button type="submit" name="action" value="apply">Apply Now</button>
        </form>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message"><%= request.getAttribute("message") %></div>
        <% } %>
    </div>
</div>

</body>
</html>