<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Tuyến đường</title>
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
            max-width: 1200px;
        }
        h2 {
            color: #2196f3;
            font-size: 2.2rem;
            margin-bottom: 24px;
            text-align: center;
            font-weight: bold;
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
            font-weight: bold;
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
        .add-btn {
            background: #43a047;
            margin-bottom: 18px;
        }
        .add-btn:hover {
            background: #2e7d32;
        }
        .delete-btn {
            background: #e53935;
        }
        .delete-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh sách Tuyến đường</h2>
    <a class="action-btn add-btn" href="/QLT/views/admin/route-register.jsp">Thêm tuyến mới</a>
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
        <% List<Map<String, String>> routes = (List<Map<String, String>>) request.getAttribute("routes");
           if (routes != null) for (Map<String, String> r : routes) { %>
        <tr>
            <td><%= r.get("route_id") %></td>
            <td><%= r.get("train_name") %></td>
            <td><%= r.get("type") %></td>
            <td><%= r.get("departure_station") %></td>
            <td><%= r.get("arrival_station") %></td>
            <td><%= r.get("duration") %></td>
            <td>
                <form method="post" action="/admin/route" style="display:inline;">
                    <input type="hidden" name="action" value="edit" />
                    <input type="hidden" name="routeId" value="<%= r.get("route_id") %>" />
                    <button class="action-btn" type="submit">Sửa</button>
                </form>
                <form method="post" action="/admin/route" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa tuyến này?');">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="routeId" value="<%= r.get("route_id") %>" />
                    <button class="action-btn delete-btn" type="submit">Xóa</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
