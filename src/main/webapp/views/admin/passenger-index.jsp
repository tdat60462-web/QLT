
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quanlytau.model.bean.Passenger" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý hành khách</title>
    <style>
        body { font-family: 'Roboto', 'Segoe UI', Arial, sans-serif; background: #f8f9fa; color: #222; margin: 0; }
        .container { background: #fff; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,0.10); padding: 32px; margin: 32px auto; max-width: 1000px; }
        h2 { color: #1e90ff; font-size: 2rem; margin-bottom: 24px; text-align: center; }
        .add-btn { display: inline-block; background: #1e90ff; color: #fff; padding: 10px 24px; border-radius: 8px; font-weight: bold; text-decoration: none; margin-bottom: 18px; transition: background 0.2s; }
        .add-btn:hover { background: #1565c0; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 24px; }
        th, td { border: 1px solid #e0e0e0; padding: 12px 16px; text-align: left; }
        th { background: #f5f5f5; color: #222; }
        .action-btn { background: #1e90ff; color: #fff; border: none; border-radius: 6px; padding: 8px 16px; margin-right: 8px; font-weight: bold; text-decoration: none; cursor: pointer; transition: background 0.2s; }
        .action-btn:hover { background: #1565c0; }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Danh sách hành khách</h2>
    <a class="add-btn" href="/QLT/views/admin/passenger-register.jsp">Thêm hành khách mới</a>
    <%
        List<Passenger> passengers = (List<Passenger>) request.getAttribute("passengers");
        if (passengers == null) passengers = new ArrayList<>();
    %>
    <table>
        <tr>
            <th>Mã hành khách</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Hành động</th>
        </tr>
        <% for (Passenger p : passengers) { %>
        <tr>
            <td><%= p.getPassengerId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPhone() %></td>
            <td><%= p.getEmail() %></td>
            <td>
                <a class="action-btn" href="/admin/passenger?action=edit&id=<%= p.getPassengerId() %>">Sửa</a>
                <a class="action-btn" href="/admin/passenger?action=delete&id=<%= p.getPassengerId() %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
