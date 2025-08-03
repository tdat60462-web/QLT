<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quanlytau.model.bean.Train" %>
<%
    Train train = (Train)request.getAttribute("train");
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #f8f9fa;
            color: #222;
            margin: 0;
        }
        .container {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            padding: 32px;
            margin: 32px auto;
            max-width: 700px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 24px;
        }
        th, td {
            border: 1px solid #e0e0e0;
            padding: 12px 16px;
            text-align: left;
        }
        th {
            background: #f5f5f5;
            color: #222;
        }
        .action-btn {
            background: #1e90ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            margin-right: 8px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.2s;
        }
        .action-btn:hover {
            background: #1565c0;
        }
    </style>
    <title>Chi tiết chuyến tàu</title>
</head>
<body>
    <div class="container">
<% String message = (String) request.getAttribute("message");
   String error = (String) request.getAttribute("error");
   if (message != null) { %>
    <div style="color: green;"><%= message %></div>
<% }
   if (error != null) { %>
    <div style="color: red;"><%= error %></div>
<% } %>
<h2>Chi tiết chuyến tàu</h2>
<% if (train != null) { %>
<table border="1">
    <tr><td>Mã tàu:</td><td><%= train.getTrainId() %></td></tr>
    <tr><td>Loại tàu:</td><td><%= train.getTrainType() %></td></tr>
    <tr><td>Giờ xuất phát:</td><td><%= train.getDepartureTime() %></td></tr>
    <tr><td>Giờ đến:</td><td><%= train.getArrivalTime() %></td></tr>
    <tr><td>Số toa:</td><td><%= train.getCarriageCount() %></td></tr>
    <tr><td>Tuyến:</td><td><%= train.getRouteId() %></td></tr>
    <tr><td>Ga đi:</td><td><%= train.getDepartureStation() %></td></tr>
    <tr><td>Ga đến:</td><td><%= train.getArrivalStation() %></td></tr>
</table>
<% } else { %>
<p>Không tìm thấy chuyến tàu!</p>
<% } %>
<a href="/search">Quay lại tra cứu</a>
</body>
</html>
