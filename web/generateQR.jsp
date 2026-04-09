<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.UUID" %>

<%
    String email = (String) session.getAttribute("student_login");

    if (email == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }
    

    String eventParam = request.getParameter("event_id");
    if (eventParam == null) {
        out.println("<h3>Invalid Request!</h3>");
        return;
    }
    

    int eventId = Integer.parseInt(eventParam);
    String token = UUID.randomUUID().toString();

    Connection con = null;
    PreparedStatement ps = null;

    String qrURL = "";
%>

<!DOCTYPE html>
<html>
<head>
    <title>QR Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            text-align: center;
            margin-top: 50px;
        }
        .container {
            background: white;
            padding: 20px;
            width: 350px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }
        h2 {
            margin-bottom: 20px;
        }
        img {
            margin: 15px 0;
        }
        .btn {
            padding: 8px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>

<div class="container">

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management", "root", ""
        );

        ps = con.prepareStatement(
                "UPDATE eventregisterstud SET qr_token=? WHERE event_id=? AND email=?"
        );

        ps.setString(1, token);
        ps.setInt(2, eventId);
        ps.setString(3, email);

        int updated = ps.executeUpdate();

        if (updated > 0) {
            qrURL = "http://localhost:8080/YourProject/markAttendance?token=" + token;
%>

    <h2>Scan QR to Mark Attendance</h2>

    <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=<%= qrURL %>" alt="QR Code">

    <br><br>

    <form action="attendanceservlet" method="post">
        <input type="hidden" name="token" value="<%= token %>">

        <label>
            <input type="checkbox" name="confirm" required>
            I confirm my attendance
        </label>

        <br><br>
        <input type="submit" value="Submit Attendance" class="btn">
    </form>

<%
        } else {
%>
    <h3>Failed to generate QR. Please try again.</h3>
<%
        }

    } catch (Exception e) {
%>
    <h3>Error: <%= e.getMessage() %></h3>
<%
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

</div>

</body>
</html>