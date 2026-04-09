<%@page import="java.sql.*"%>

<html>
<head>
<title>Student Event Registrations</title>
</head>

<body>

<h2 align="center">Registered Students</h2>

<table border="1" align="center">

<tr>
<th>Reg ID</th>
<th>Event ID</th>
<th>Event Title</th>
<th>Student Name</th>
<th>Email</th>
<th>PRN</th>

</tr>

<%

ResultSet rs = (ResultSet)request.getAttribute("data");

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("reg_id")%></td>
<td><%=rs.getInt("event_id")%></td>
<td><%=rs.getInt("event_title")%></td>
<td><%=rs.getString("student_name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("prn")%></td>


</tr>

<%
}
%>

</table>

</body>
</html>