<%-- 
    Document   : approveevents
    Created on : Feb 22, 2026, 10:03:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Approve Event Requests</title>
    <style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background-color:#f4f6f9;
    margin:0;
    padding:0;
}

h2{
    text-align:center;
    margin-top:30px;
    color:#2c3e50;
}


table{
    width:95%;
    margin:30px auto;
    border-collapse:collapse;
    background:white;
    box-shadow:0px 0px 10px rgba(0,0,0,0.1);
}

th{
    background:#2c3e50;
    color:white;
    padding:12px;
    font-size:15px;
}

td{
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f1f1f1;
}


a{
    text-decoration:none;
    padding:6px 12px;
    border-radius:5px;
    font-size:14px;
}

a[href*="approve"]{
    background:#27ae60;
    color:white;
}

a[href*="approve"]:hover{
    background:#1e8449;
}



a[href*="reject"]{
    background:#e74c3c;
    color:white;
}

a[href*="reject"]:hover{
    background:#c0392b;
}
.back-btn {
    display: inline-block;
    padding: 8px 16px;
    background-color:black;
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin: 10px;
    margin-top: 200px;
}

.back-btn:hover {
    background-color: #2c3e50;
}

.back-btn:active {
    transform: scale(0.95);
}


</style>

</head>
<body>

<h2>Pending Registration Requests</h2>

<table border="1" width="95%" cellpadding="10">
<tr>
    <th>Student Name</th>
    <th>Email</th>
    <th>PRN</th>
    <th>Event ID</th>
    <th>Event Title</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3307/event_management",
        "root",
        "");

    String sql = "SELECT er.*, e.event_title " +
                 "FROM eventregisterstud er " +
                 "JOIN newevent e ON er.event_id = e.event_id " +
                 "WHERE er.status = 'Pending'";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getString("student_name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("prn") %></td>
    <td><%= rs.getInt("event_id") %></td>
    <td><%= rs.getString("event_title") %></td>
    <td><%= rs.getString("status") %></td>
    <td>
        <a href="ApproveRequestServlet?reg_id=<%=rs.getInt("reg_id")%>&action=approve">
            Approve
        </a>
        |
        <a href="ApproveRequestServlet?reg_id=<%=rs.getInt("reg_id")%>&action=reject">
            Reject
        </a>
    </td>
</tr>

<%
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>

</table>
    <a href="eventorganizerdashboard.html" class="back-btn">Back</a>

</body>
</html>
