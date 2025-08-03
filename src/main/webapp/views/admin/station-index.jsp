
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Station Management</title>
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
    <h2>Danh sách ga tàu</h2>
    <a class="add-btn" href="/QLT/views/admin/station-register.jsp">Thêm ga tàu mới</a>
    <%@ page import="java.sql.*, java.util.*" %>
    <%
        List<Map<String, String>> stations = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
            Statement st = conn.createStatement();
            String sql = "SELECT station_id, name, address FROM station";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("station_id", rs.getString("station_id"));
                row.put("name", rs.getString("name"));
                row.put("address", rs.getString("address"));
                stations.add(row);
            }
            rs.close(); st.close(); conn.close();
        } catch (Exception e) { out.print("<tr><td colspan='4' style='color:red;text-align:center;'>Database connection error!</td></tr>"); }
    %>
    <table>
        <tr>
            <th>Mã ga</th>
            <th>Tên ga</th>
            <th>Địa chỉ</th>
            <th>Hành động</th>
        </tr>
        <% for (Map<String, String> s : stations) { %>
        <tr>
            <td><%= s.get("station_id") %></td>
            <td><%= s.get("name") %></td>
            <td><%= s.get("address") %></td>
            <td>
                <a class="action-btn" href="/admin/station?action=edit&id=<%= s.get("station_id") %>">Sửa</a>
                <a class="action-btn" href="/admin/station?action=delete&id=<%= s.get("station_id") %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
