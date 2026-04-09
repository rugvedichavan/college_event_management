<%-- 
    Document   : regsiterforevents
    Created on : Feb 22, 2026, 9:44:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    int event_id = Integer.parseInt(request.getParameter("event_id"));
    String event_title = request.getParameter("event_title");
    String student_name = (String) session.getAttribute("student_name");
    String email = (String) session.getAttribute("email");
    String prn = (String) session.getAttribute("prn");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Event Registration</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f8f9fc;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4e73df;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2e59d9;
        }

        .event-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1cc88a;
        }

    </style>
</head>

<body>

<div class="container">

    <h2>Confirm Registration</h2>

    <div class="event-title">
        Event: <%= event_title %>
    </div>

    <form action="registerforeventservlet" method="post">

        <input type="hidden" name="event_id" value="<%=event_id%>">

        <div class="form-group">
            <label>Student Name</label>
            <input type="text" value="<%=student_name%>" readonly>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="text" value="<%=email%>" readonly>
        </div>

        <div class="form-group">
            <label>PRN</label>
            <input type="text" value="<%=prn%>" readonly>
        </div>

        <input type="submit" value="Confirm Register">

    </form>

</div>

</body>
</html>