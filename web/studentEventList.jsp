<%-- 
    Document   : resgisterforevent
    Created on : Feb 9, 2026, 9:26:11 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    int student_id = (Integer) session.getAttribute("student_id");
%>
<html>
    <head>
    <title>Available Events</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #2c3e50;
        }

        table {
            width: 85%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            background-color: #27ae60;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #219150;
        }

        .registered {
            color: #e67e22;
            font-weight: bold;
        }

    </style>
</head>
<h2>Available Events</h2>

<table border="1" width="80%">
    <tr>
        <th>Event Name</th>
        <th>Date</th>
        <th>Time</th>
        <th>Fees</th>
        <th>Action</th>
    </tr>

<%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3307/event_management",
            "root",
            "");

        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM newevent");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            int event_id = rs.getInt("event_id");
%>

    <tr>
        <td><%= rs.getString("event_title") %></td>
        <td><%= rs.getString("event_date") %></td>
        <td><%= rs.getString("start_time") %></td>
        <td><%= rs.getString("registration_fee") %></td>
        <td>

        <%
          
            PreparedStatement check = con.prepareStatement(
            "SELECT * FROM eventregisterstud WHERE event_id=? AND student_name=?");

            check.setInt(1, event_id);
            check.setString(2, (String)session.getAttribute("student_name"));

            ResultSet crs = check.executeQuery();

            if(crs.next()){
        %>
                Registered (<%= crs.getString("status") %>)
        <%
            } else {
        %>
                <a href="regsiterforevents.jsp?event_id=<%=event_id%>">
                    Register
                </a>
        <%
            }
        %>

        </td>
    </tr>

<%
        }
    }catch(Exception e){
        out.println(e);
    }
%>

</table>
</html>
