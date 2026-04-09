<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
int event_id = Integer.parseInt(request.getParameter("event_id"));

String student_name="";
String email="";
String prn="";
String event_title="";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3307/event_management","root","");

    // Get email from session
    email = (String)session.getAttribute("email");

    // DEBUG (very important)
    out.println("Session Email: " + email);

    if(email != null)
    {
        PreparedStatement ps1 = con.prepareStatement(
        "SELECT student_name,email,prn FROM student_registration WHERE email=?");

        ps1.setString(1,email);

        ResultSet rs1 = ps1.executeQuery();

        if(rs1.next())
        {
            student_name = rs1.getString("studentname");
            email = rs1.getString("email");
            prn = rs1.getString("prn");
        }
        else
        {
            out.println("No student found!");
        }
    }
    else
    {
        out.println("Email not found in session!");
    }

    // Fetch event title
    PreparedStatement ps2 = con.prepareStatement(
    "SELECT event_title FROM newevent WHERE event_id=?");

    ps2.setInt(1,event_id);

    ResultSet rs2 = ps2.executeQuery();

    if(rs2.next())
    {
        event_title = rs2.getString("event_title");
    }

    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Event Registration</title>

<style>
body{
font-family: Arial;
background: linear-gradient(135deg,#4e73df,#1cc88a);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 10px 25px rgba(0,0,0,0.2);
width:400px;
}

h2{
text-align:center;
}

.form-group{
margin-bottom:15px;
}

input{
width:100%;
padding:8px;
border-radius:5px;
border:1px solid #ccc;
}

input[type=submit]{
background:#4e73df;
color:white;
border:none;
padding:10px;
}

</style>

</head>

<body>

<div class="container">

<h2>Confirm Registration</h2>

<form action="registerforeventservlet" method="post">

<input type="hidden" name="event_id" value="<%=event_id%>">
<input type="hidden" name="event_title" value="<%=event_title%>">

<div class="form-group">
<label>Student Name</label>
<input type="text" name="student_name" value="<%=student_name%>" readonly>
</div>

<div class="form-group">
<label>Email</label>
<input type="text" name="email" value="<%=email%>" readonly>
</div>

<div class="form-group">
<label>PRN</label>
<input type="text" name="prn" value="<%=prn%>" readonly>
</div>

<div class="form-group">
<label>Event Title</label>
<input type="text" name="event_title_display" value="<%=event_title%>" readonly>
</div>

<input type="submit" value="Confirm Register">

</form>

</div>

</body>
</html>