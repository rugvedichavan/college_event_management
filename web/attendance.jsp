<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String email = (String) session.getAttribute("student_login");

    if (email == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Event Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            background-color: #27ae60;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #219150;
        }
        .disabled {
            color: gray;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>My Event Attendance</h2>

<table>
    <tr>
        <th>Event ID</th>
        <th>Event Name</th>
        <th>Payment Status</th>
        <th>Attendance Status</th>
        <th>Action</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management", "root", ""
        );

        ps = con.prepareStatement(
                "SELECT event_id, event_title, payment_status, attendance_status FROM eventregisterstud WHERE email=?"
        );

        ps.setString(1, email);
        rs = ps.executeQuery();

        boolean found = false;

        while (rs.next()) {
            found = true;

            int eventId = rs.getInt("event_id");
            String title = rs.getString("event_title");
            String payment = rs.getString("payment_status");
            String attendance = rs.getString("attendance_status");
%>

    <tr>
        <td><%= eventId %></td>
        <td><%= title %></td>
        <td><%= payment %></td>
        <td><%= attendance %></td>

        <td>
            <%
                if ("Paid".equalsIgnoreCase(payment) && "NotMarked".equalsIgnoreCase(attendance)) {
            %>
                <form action="generateQR.jsp" method="post">
                    <input type="hidden" name="event_id" value="<%= eventId %>">
                    <input type="submit" value="Mark Attendance" class="btn">
                </form>
            <%
                } else if ("Marked".equalsIgnoreCase(attendance)) {
            %>
                <span class="disabled">Done</span>
            <%
                } else {
            %>
                <span class="disabled">Not Allowed</span>
            <%
                }
            %>
        </td>
    </tr>

<%
        }

        if (!found) {
%>
    <tr>
        <td colspan="5">No records found!</td>
    </tr>
<%
        }

    } catch (Exception e) {
%>
    <tr>
        <td colspan="5">Error: <%= e.getMessage() %></td>
    </tr>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

</table>

</body>
</html>