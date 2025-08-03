<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý lịch trình</title>
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
            max-width: 1100px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        .add-btn {
            display: inline-block;
            background: #43a047;
            color: #fff;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 18px;
            transition: background 0.2s;
        }
        .add-btn:hover {
            background: #2e7d32;
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
        .delete-btn {
            background: #e53935;
        }
        .delete-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Danh sách lịch trình</h2>
    <a class="add-btn" href="/QLT/views/admin/schedule-register.jsp">Thêm lịch trình mới</a>
    <%@ page import="java.util.*, com.quanlytau.model.bean.Schedule" %>
    <%
        List<Schedule> schedules = (List<Schedule>) request.getAttribute("schedules");
        if (schedules == null) schedules = new ArrayList<>();
    %>
    <table>
        <tr>
            <th>Mã lịch trình</th>
            <th>Mã tuyến</th>
            <th>Tên tàu</th>
            <th>Ga đi</th>
            <th>Ga đến</th>
            <th>Giờ xuất phát</th>
            <th>Giờ đến</th>
            <th>Số ghế còn lại</th>
            <th>Hành động</th>
        </tr>
        <% for (Schedule sch : schedules) { %>
        <tr>
            <td><%= sch.getScheduleId() %></td>
            <td><%= sch.getRouteId() %></td>
            <td><%= sch.getTrainName() %></td>
            <td><%= sch.getDepartureStation() %></td>
            <td><%= sch.getArrivalStation() %></td>
            <td><%= sch.getDepartureTime() %></td>
            <td><%= sch.getArrivalTime() %></td>
            <td><%= sch.getAvailableSeats() %></td>
            <td>
                <a class="action-btn" href="/admin/schedule?action=edit&id=<%= sch.getScheduleId() %>">Sửa</a>
                <a class="action-btn delete-btn" href="/admin/schedule?action=delete&id=<%= sch.getScheduleId() %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
