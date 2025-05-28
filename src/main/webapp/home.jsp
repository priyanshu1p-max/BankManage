<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PC Bank - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        header {
            background-color: #002147;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
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
            flex-wrap: wrap;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-weight: bold;
        }

        nav a:hover {
            background: #0066cc;
            border-radius: 5px;
        }

        .notifications {
            background: #fffbcc;
            color: #333;
            padding: 10px 0;
            overflow: hidden;
            position: relative;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }

        .scroll-text {
            white-space: nowrap;
            display: inline-block;
            padding-left: 100%;
            animation: scroll-left 25s linear infinite;
            font-weight: bold;
            font-size: 16px;
        }

        @keyframes scroll-left {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        .slider {
            width: 100%;
            height: 400px;
            overflow: hidden;
            position: relative;
        }

        .slides {
            display: flex;
            width: 400%;
            animation: slide 12s infinite;
        }

        .slides img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }

        @keyframes slide {
            0% { margin-left: 0; }
            25% { margin-left: -100%; }
            50% { margin-left: -200%; }
            75% { margin-left: -300%; }
            100% { margin-left: 0; }
        }

        /* What's New Box */
        .whats-new {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-left: 5px solid #00bfff;
            border-radius: 8px;
            padding: 15px;
            width: 250px;
            z-index: 5;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .whats-new h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #014282;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }

        .whats-new ul {
            margin: 0;
            padding-left: 20px;
            font-size: 14px;
            line-height: 1.6;
            color: #333;
        }

        .services {
            display: flex;
            justify-content: space-around;
            padding: 40px 20px;
            background: #f8f8f8;
        }

        .service {
            background: white;
            padding: 20px;
            width: 250px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .service:hover {
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            transform: scale(1.03);
        }

        .rules {
            background: #ffffff;
            padding: 30px 50px;
            line-height: 1.8;
            color: #333;
        }

        .rules h2 {
            text-align: center;
            color: #014282;
            margin-bottom: 20px;
        }

        .rules ul {
            list-style-type: disc;
            padding-left: 40px;
        }

        footer {
            background: #002147;
            color: white;
            padding: 20px;
            text-align: center;
        }

       /* FAQ Button */
.faq-btn {
    position: fixed;
    bottom: 25px;
    right: 25px;
    background-color: #007bff;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    transition: background-color 0.3s ease;
    z-index: 1000;
}
.faq-btn:hover {
    background-color: #0056b3;
}

/* Modal Styling */
.faq-modal {
    display: none;
    position: fixed;
    z-index: 1001;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.6);
}

.faq-content {
    background-color: white;
    margin: 10% auto;
    padding: 30px;
    border-radius: 12px;
    width: 90%;
    max-width: 600px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
    animation: fadeIn 0.5s ease-in-out;
    font-family: 'Segoe UI', sans-serif;
}

.faq-content h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #1f2e45;
}

.faq-item {
    margin-bottom: 15px;
}

.close-btn {
    float: right;
    font-size: 26px;
    color: #aaa;
    cursor: pointer;
}
.close-btn:hover {
    color: #000;
}

/* Optional animation */
@keyframes fadeIn {
    from {opacity: 0; transform: scale(0.9);}
    to {opacity: 1; transform: scale(1);}
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
    <a href="transactionHistory.jsp">Transaction History</a>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="contact.jsp">Contact Us</a>
    <a href="loan.jsp">Apply for Loan</a>
</nav>

<div class="notifications">
    <div class="scroll-text">
        New Fixed Deposit rates launched! | PC Bank App update available. Download now! | Beware of phishing emails. We never ask for OTP. | Instant Loan Approvals for salaried customers! | Update your KYC before 31st May 2025.
    </div>
</div>

<div class="slider">
    <div class="slides">
        <img src="slider1.avif" alt="Banking Slide 1">
        <img src="slider2.webp" alt="Banking Slide 2">
        <img src="slider3.jpeg" alt="Banking Slide 3">
        <img src="slider4.jpeg" alt="Banking Slide 4">
    </div>
    <!-- What's New Box -->
    <div class="whats-new">
        <h3>What's New</h3>
        <ul>
            <li>Online FD booking launched</li>
            <li>Mobile App v2.5 released</li>
            <li>New customer care helpline active</li>
            <li>Loan interest reduced by 0.5%</li>
        </ul>
    </div>
</div>

<section class="services">
    <div class="service">
        <h3>Retail Banking</h3>
        <p>Personal banking services like savings, loans, cards, and more.</p>
    </div>
    <div class="service">
        <h3>Corporate Banking</h3>
        <p>Business accounts, credit, and financial solutions for companies.</p>
    </div>
    <div class="service">
        <h3>NRI Services</h3>
        <p>Banking for Indians living abroad with easy remittances.</p>
    </div>
</section>

<section class="rules">
    <h2>Banking Rules</h2>
    <ul>
        <li>Maintain a minimum balance in your savings account.</li>
        <li>Loan repayments must be made on or before the due date.</li>
        <li>ATM withdrawals are limited to 5 free transactions per month.</li>
        <li>Online transactions require OTP verification.</li>
        <li>Update your KYC details every 2 years.</li>
        <li>Report unauthorized transactions within 24 hours.</li>
    </ul>
</section>

<footer>
    &copy; 2025 PC Bank. All rights reserved. | Contact: support@pcbank.com
</footer>


<!-- FAQ Button -->
<button class="faq-btn" onclick="openFAQ()">Help / FAQ</button>

<!-- FAQ Modal -->
<div id="faqModal" class="faq-modal">
    <div class="faq-content">
        <span class="close-btn" onclick="closeFAQ()">&times;</span>
        <h2>Frequently Asked Questions</h2>
        <div class="faq-item">
            <strong>Q1: How can I open a new bank account?</strong>
            <p>A: Click on the "Create Account" tab and fill the required details.</p>
        </div>
        <div class="faq-item">
            <strong>Q2: What is the minimum balance required?</strong>
            <p>A: The minimum balance is ₹500 for savings account.</p>
        </div>
        <div class="faq-item">
            <strong>Q3: How do I apply for a loan?</strong>
            <p>A: Loan services will be added soon. Please stay tuned!</p>
        </div>
        <div class="faq-item">
            <strong>Q4: Whom to contact for support?</strong>
            <p>A: Visit the "Contact Us" tab for phone and email support.</p>
        </div>
    </div>
</div>

<script>
function openFAQ() {
    document.getElementById("faqModal").style.display = "block";
}
function closeFAQ() {
    document.getElementById("faqModal").style.display = "none";
}
// Close modal if user clicks outside the box
window.onclick = function(event) {
    let modal = document.getElementById("faqModal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>