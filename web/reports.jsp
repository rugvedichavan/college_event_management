<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Reports</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 120px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .btn {
            padding: 10px 18px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn:hover {
            background-color: #1f6690;
        }

        .btn:active {
            transform: scale(0.95);
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 14px;
            background-color: #7f8c8d;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .back-btn:hover {
            background-color: #636e72;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Admin Reports</h2>

    <form action="ReportServlet" method="get">
        <button type="submit" class="btn">Download Excel Report</button>
    </form>

<button onclick="history.back()" class="back-btn">← Back</button>
</div>

</body>
</html>