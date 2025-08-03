<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quanlytau.model.bean.Passenger" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Hành khách</title>
    <style>
        body { font-family: 'Roboto', 'Segoe UI', Arial, sans-serif; background: #f8f9fa; color: #222; margin: 0; }
        .container { background: #fff; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,0.10); padding: 32px; margin: 32px auto; max-width: 900px; }
        h2 { color: #1e90ff; font-size: 2rem; margin-bottom: 24px; text-align: center; }
        .add-btn { display: inline-block; background: #43a047; color: #fff; padding: 10px 24px; border-radius: 8px; font-weight: bold; text-decoration: none; margin-bottom: 18px; transition: background 0.2s; }
        .add-btn:hover { background: #2e7d32; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 24px; }
        th, td { border: 1px solid #e0e0e0; padding: 12px 16px; text-align: left; }
        th { background: #f5f5f5; color: #222; }
        .action-btn { background: #1e90ff; color: #fff; border: none; border-radius: 6px; padding: 8px 16px; margin-right: 8px; font-weight: bold; text-decoration: none; cursor: pointer; transition: background 0.2s; }
        .action-btn:hover { background: #1565c0; }
        .delete-btn { background: #e53935; }
        .delete-btn:hover { background: #b71c1c; }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Danh sách Hành khách</h2>
    <a class="add-btn" href="/QLT/views/admin/passenger-register.jsp">Thêm hành khách mới</a>
    <table>
        <tr>
            <th>Mã hành khách</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Hành động</th>
        </tr>
        <% List<Passenger> passengers = (List<Passenger>) request.getAttribute("passengers");
           if (passengers != null && !passengers.isEmpty()) {
               for (Passenger p : passengers) { %>
        <tr>
            <td><%= p.getPassengerId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPhone() %></td>
            <td><%= p.getEmail() %></td>
            <td>
                <a class="action-btn" href="#">Sửa</a>
                <a class="action-btn delete-btn" href="#" onclick="return confirm('Bạn có chắc muốn xóa hành khách này?');">Xóa</a>
            </td>
        </tr>
        <%    }
           } else { %>
        <tr>
            <td colspan="5" style="text-align:center;">Không có dữ liệu hành khách.</td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
