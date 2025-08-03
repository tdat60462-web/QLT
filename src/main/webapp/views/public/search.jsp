<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            max-width: 900px;
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
    <title>Tra cứu lịch tàu</title>
</head>
<body>
    <div class="container">
<h2>Tra cứu lịch tàu</h2>
<form method="get" action="/search">
    <table>
        <tr>
            <td>Tuyến:</td>
            <td><input type="text" name="routeId" /></td>
        </tr>
        <tr>
            <td>Ngày xuất phát:</td>
            <td><input type="date" name="departureDate" /></td>
        </tr>
        <tr>
            <td>Giờ xuất phát:</td>
            <td><input type="time" name="departureTime" /></td>
        </tr>
        <tr>
            <td>Ga đi:</td>
            <td><input type="text" name="departureStation" /></td>
        </tr>
        <tr>
            <td>Ga đến:</td>
            <td><input type="text" name="arrivalStation" /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Tra cứu</button></td>
        </tr>
    </table>
</form>
<%-- Hiển thị kết quả nếu có --%>
<% if (request.getAttribute("trains") != null) {
    java.util.List<com.quanlytau.model.bean.Train> trains = (java.util.List<com.quanlytau.model.bean.Train>)request.getAttribute("trains");
%>
<h3>Kết quả tra cứu</h3>
<table border="1">
    <tr>
        <th>Mã tàu</th>
        <th>Loại tàu</th>
        <th>Giờ xuất phát</th>
        <th>Giờ đến</th>
        <th>Số toa</th>
        <th>Tuyến</th>
        <th>Ga đi</th>
        <th>Ga đến</th>
    </tr>
    <% for (com.quanlytau.model.bean.Train train : trains) { %>
    <tr>
        <td><a href="/detail?id=<%= train.getTrainId() %>"><%= train.getTrainId() %></a></td>
        <td><%= train.getTrainType() %></td>
        <td><%= train.getDepartureTime() %></td>
        <td><%= train.getArrivalTime() %></td>
        <td><%= train.getCarriageCount() %></td>
        <td><%= train.getRouteId() %></td>
        <td><%= train.getDepartureStation() %></td>
        <td><%= train.getArrivalStation() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>
