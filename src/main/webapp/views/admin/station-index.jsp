<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.baodientu.model.bean.Station" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Quản lý ga tàu</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #eee; }
        .action-btn { margin-right: 5px; }
    </style>
</head>
<body>
<h2>Danh sách ga tàu</h2>
<a href="/admin/station?action=add">Thêm ga tàu mới</a>
<table>
    <tr>
        <th>Mã ga</th>
        <th>Tên ga</th>
        <th>Địa chỉ</th>
        <th>Hành động</th>
    </tr>
    <%
        List<Station> stations = (List<Station>)request.getAttribute("stations");
        if (stations != null) {
            for (Station station : stations) {
    %>
    <tr>
        <td><%= station.getStationId() %></td>
        <td><%= station.getName() %></td>
        <td><%= station.getAddress() %></td>
        <td>
            <a class="action-btn" href="/admin/station?action=edit&id=<%= station.getStationId() %>">Sửa</a>
            <a class="action-btn" href="/admin/station?action=delete&id=<%= station.getStationId() %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
        </td>
    </tr>
    <%      }
        }
    %>
</table>
</body>
</html>
