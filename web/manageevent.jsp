<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Event"%>

<%
List<Event> eventList = (List<Event>) request.getAttribute("eventList");
%>
<%
String msg = request.getParameter("msg");
if("updated".equals(msg)){
%>

<div class="success">
    Event Updated Successfully ✅
</div>

<%
}
%>
<html>
<head>
<title>Manage Events</title>
                    
<style>
    .success{
    width:60%;
    margin:20px auto;
    padding:12px;
    background:#d4edda;
    color:#155724;
    border:1px solid #c3e6cb;
    text-align:center;
    font-weight:bold;
    border-radius:6px;
}
table{
    border-collapse:collapse;
    width:90%;
    margin:auto;
}
th,td{
    border:1px solid black;
    padding:8px;
    text-align:center;
}
th{
    background:#007BFF;
    color:white;
}
a{
    text-decoration:none;
    padding:5px 10px;
    background:green;
    color:white;
}
.delete{
    background:red;
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

<h2 style="text-align:center;">Manage Events</h2>

<table>
<tr>
<th>ID</th>
<th>Title</th>
<th>Date</th>
<th>City</th>
<th>Action</th>
</tr>

<%
if(eventList != null){
    for(Event e : eventList){
%>

<tr>
<td><%= e.getEventId() %></td>
<td><%= e.getEventTitle() %></td>
<td><%= e.getEventDate() %></td>
<td><%= e.getCity() %></td>

<td>
<a href="<%= request.getContextPath() %>/EditEventServlet?event_id=<%= e.getEventId() %>">
Edit
</a>

&nbsp;

<a class="delete" href="DeleteEventServlet?event_id=<%= e.getEventId() %>">
Delete
</a>
</td>

</tr>

<%
    }
}
%>

</table>
    <a href="eventorganizerdashboard.html" class="back-btn">Back</a>

</body>
</html>