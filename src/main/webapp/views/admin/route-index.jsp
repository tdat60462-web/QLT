<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tuyến</title>
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
        .add-btn {
            display: inline-block;
            background: #1e90ff;
            color: #fff;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 18px;
            transition: background 0.2s;
        }
        .add-btn:hover {
            background: #1565c0;
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
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Danh sách tuyến</h2>
    <a class="add-btn" href="/QLT/views/admin/route-register.jsp">Thêm tuyến mới</a>
    <%@ page import="java.util.*" %>
    <%
        List<Map<String, String>> routes = (List<Map<String, String>>) request.getAttribute("routes");
        if (routes == null) routes = new ArrayList<>();
    %>
    <table>
        <tr>
            <th>Mã tuyến</th>
            <th>Tên tàu</th>
            <th>Loại tàu</th>
            <th>Ga đi</th>
            <th>Ga đến</th>
            <th>Thời gian (hh:mm:ss)</th>
            <th>Hành động</th>
        </tr>
        <% for (Map<String, String> r : routes) { %>
        <tr>
            <td><%= r.get("route_id") %></td>
            <td><%= r.get("train_name") %></td>
            <td><%= r.get("type") %></td>
            <td><%= r.get("departure_station") %></td>
            <td><%= r.get("arrival_station") %></td>
            <td><%= r.get("duration") %></td>
            <td>
                <a class="action-btn" href="/admin/route?action=edit&id=<%= r.get("route_id") %>">Sửa</a>
                <a class="action-btn" href="/admin/route?action=delete&id=<%= r.get("route_id") %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
