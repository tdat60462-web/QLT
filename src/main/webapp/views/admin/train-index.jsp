<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tàu</title>
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
    <h2>Danh sách tàu</h2>
    <a class="add-btn" href="/QLT/views/admin/train-register.jsp">Thêm tàu mới</a>
    <%@ page import="java.sql.*, java.util.*" %>
    <%
        List<Map<String, String>> trains = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
            Statement st = conn.createStatement();
            String sql = "SELECT train_id, name, type FROM train";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("train_id", rs.getString("train_id"));
                row.put("name", rs.getString("name"));
                row.put("type", rs.getString("type"));
                trains.add(row);
            }
            rs.close(); st.close(); conn.close();
        } catch (Exception e) { out.print("<tr><td colspan='4' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
    %>
    <table>
        <tr>
            <th>Mã tàu</th>
            <th>Tên tàu</th>
            <th>Loại tàu</th>
            <th>Hành động</th>
        </tr>
        <% for (Map<String, String> t : trains) { %>
        <tr>
            <td><%= t.get("train_id") %></td>
            <td><%= t.get("name") %></td>
            <td><%= t.get("type") %></td>
            <td>
                <a class="action-btn" href="/admin/train?action=edit&id=<%= t.get("train_id") %>">Sửa</a>
                <a class="action-btn" href="/admin/train?action=delete&id=<%= t.get("train_id") %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
