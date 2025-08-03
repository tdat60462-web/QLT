<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch trình tàu</title>
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
            max-width: 1000px;
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
</head>
<body>
    <div class="container">
        <h2>Lịch trình tàu</h2>
        <%@ page import="java.util.*" %>
        <%
            List<Map<String, String>> trains = (List<Map<String, String>>) request.getAttribute("trains");
            if (trains == null) trains = new ArrayList<>();
        %>
        <table>
            <tr>
                <th>Mã tàu</th>
                <th>Tên tàu</th>
                <th>Loại tàu</th>
                <th>Mã tuyến</th>
                <th>Ga đi</th>
                <th>Ga đến</th>
                <th>Giờ xuất phát</th>
                <th>Giờ đến</th>
            </tr>
            <% for (Map<String, String> t : trains) { %>
            <tr>
                <td><%= t.get("train_id") %></td>
                <td><%= t.get("train_name") %></td>
                <td><%= t.get("type") %></td>
                <td><%= t.get("route_id") %></td>
                <td><%= t.get("departure_station") %></td>
                <td><%= t.get("arrival_station") %></td>
                <td><%= t.get("departure_time") %></td>
                <td><%= t.get("arrival_time") %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
