<%-- 
    Document   : payment
    Created on : Feb 23, 2026, 6:26:25 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String reg_id = request.getParameter("reg_id");
%>

<html>
<head>
<title>Payment Page</title>

<style>
body{
    font-family: Arial;
    background:#f4f6f9;
    text-align:center;
}

.payment-box{
    background:white;
    width:400px;
    margin:50px auto;
    padding:30px;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
    border-radius:10px;
}

button{
    background:#27ae60;
    color:white;
    padding:10px 20px;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

button:hover{
    background:#219150;
}
</style>

</head>

<body>

<div class="payment-box">

<h2>Event Payment</h2>

<p><b>Registration ID:</b> <%= reg_id %></p>
<p><b>Amount:</b> ₹500</p>

<h3>Scan QR Code to Pay</h3>

<img src="images/QR.jpeg" width="250" height="250"/>

<br><br>

<form action="ConfirmPaymentServlet" method="post">
    <input type="hidden" name="reg_id" value="<%= reg_id %>">
    <button type="submit">I Have Paid</button>
</form>

</div>

</body>
</html>