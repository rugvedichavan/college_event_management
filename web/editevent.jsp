<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.Event"%>


<!DOCTYPE html>
<html>
<head>
<title>Edit Event</title>

<style>
body{
    margin:0;<%
Event event = (Event) request.getAttribute("event");
%>

    padding:0;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(135deg,#667eea,#764ba2);
}

.container{
    width:420px;
    background:white;
    margin:60px auto;
    padding:30px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#333;
}

label{
    font-weight:bold;
    font-size:14px;
}

input{
    width:100%;
    padding:10px;
    margin:6px 0 15px 0;
    border-radius:6px;
    border:1px solid #ccc;
    font-size:14px;
}

input:focus{
    border-color:#667eea;
    outline:none;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:6px;
    background:#667eea;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#5a67d8;
}

.error{
    text-align:center;
    color:red;
    font-weight:bold;
}
</style>

</head>
<body>

<div class="container">

<h2>Edit Event</h2>

<% if(event != null){ %>

<form action="UpdateEventServlet" method="post">

<input type="hidden" name="event_id" value="<%= event.getEventId() %>">

<label>Title</label>
<input type="text" name="event_title" value="<%= event.getEventTitle() %>" required>

<label>Category</label>
<input type="text" name="event_category" value="<%= event.getEventCategory() %>" required>

<label>Date</label>
<input type="date" name="event_date" value="<%= event.getEventDate() %>" required>

<label>Start Time</label>
<input type="time" name="start_time" value="<%= event.getStartTime() %>" required>

<label>End Time</label>
<input type="time" name="end_time" value="<%= event.getEndTime() %>" required>

<label>Venue</label>
<input type="text" name="venue" value="<%= event.getVenue() %>" required>

<label>City</label>
<input type="text" name="city" value="<%= event.getCity() %>" required>

<label>Registration Fee</label>
<input type="number" name="registration_fee" value="<%= event.getRegistrationFee() %>" required>

<label>Status</label>
<input type="text" name="event_status" value="<%= event.getEventStatus() %>" required>

<button type="submit">Update Event</button>

</form>

<% } else { %>

<div class="error">No Event Data Found</div>

<% } %>

</div>

</body>
</html>