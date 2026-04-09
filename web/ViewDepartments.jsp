<%@page import="java.util.*"%>

<html>
<head>
<title>View Departments</title>

<style>
table{
border-collapse: collapse;
width:90%;
margin:auto;
}

th,td{
border:1px solid black;
padding:10px;
text-align:center;
}

th{
background:#f2f2f2;
}
.back-btn {
    display: inline-block;
    padding: 8px 16px;
    background-color: #34495e;
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin: 10px;
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

<h2 align="center">Departments List</h2>

<table>

<tr>
<th>ID</th>
<th>College Name</th>
<th>Email</th>
<th>Code</th>
<th>Address</th>
<th>Batch</th>
<th>Course</th>
</tr>

<%
ArrayList<String[]> deptList = (ArrayList<String[]>)request.getAttribute("deptList");

if(deptList != null && deptList.size() > 0){
for(String[] d : deptList){
%>

<tr>
<td><%= d[0] %></td>
<td><%= d[1] %></td>
<td><%= d[2] %></td>
<td><%= d[3] %></td>
<td><%= d[4] %></td>
<td><%= d[5] %></td>
<td><%= d[6] %></td>
</tr>

<%
}
}else{
%>

<tr>
<td colspan="7">No Records Found</td>
</tr>

<%
}
%>

</table>
<a href="admindashboard.html" class="back-btn">Back</a>
</body>
</html>