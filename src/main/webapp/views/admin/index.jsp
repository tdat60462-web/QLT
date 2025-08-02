<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.baodientu.model.bean.Train" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Quản lý chuyến tàu</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #eee; }
        .action-btn { margin-right: 5px; }
    </style>
</head>
<body>
<h2>Danh sách chuyến tàu</h2>
<a href="/admin/train?action=add">Thêm chuyến tàu mới</a>
<table>
    <tr>
        <th>Mã tàu</th>
        <th>Loại tàu</th>
        <th>Giờ xuất phát</th>
        <th>Giờ đến</th>
        <th>Số toa</th>
        <th>Tuyến</th>
        <th>Ga đi</th>
        <th>Ga đến</th>
        <th>Hành động</th>
    </tr>
    <%
        List<Train> trains = (List<Train>)request.getAttribute("trains");
        if (trains != null) {
            for (Train train : trains) {
    %>
    <tr>
        <td><%= train.getTrainId() %></td>
        <td><%= train.getTrainType() %></td>
        <td><%= train.getDepartureTime() %></td>
        <td><%= train.getArrivalTime() %></td>
        <td><%= train.getCarriageCount() %></td>
        <td><%= train.getRouteId() %></td>
        <td><%= train.getDepartureStation() %></td>
        <td><%= train.getArrivalStation() %></td>
        <td>
            <a class="action-btn" href="/admin/train?action=edit&id=<%= train.getTrainId() %>">Sửa</a>
            <a class="action-btn" href="/admin/train?action=delete&id=<%= train.getTrainId() %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
        </td>
    </tr>
    <%      }
        }
    %>
</table>
</body>
</html>
