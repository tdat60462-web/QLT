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
    <h2>Danh sách lịch trình</h2>
    <a class="add-btn" href="/QLT/views/admin/schedule-register.jsp">Thêm lịch trình mới</a>
    <%@ page import="java.sql.*, java.util.*" %>
    <%
        List<Map<String, String>> schedules = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
            Statement st = conn.createStatement();
            String sql = "SELECT sch.schedule_id, r.route_id, t.name AS train_name, s1.name AS departure_station, s2.name AS arrival_station, sch.departure_time, sch.arrival_time, sch.available_seats FROM schedule sch JOIN route r ON sch.route_id = r.route_id JOIN train t ON r.train_id = t.train_id JOIN station s1 ON r.departure_station_id = s1.station_id JOIN station s2 ON r.arrival_station_id = s2.station_id";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("schedule_id", rs.getString("schedule_id"));
                row.put("route_id", rs.getString("route_id"));
                row.put("train_name", rs.getString("train_name"));
                row.put("departure_station", rs.getString("departure_station"));
                row.put("arrival_station", rs.getString("arrival_station"));
                row.put("departure_time", rs.getString("departure_time"));
                row.put("arrival_time", rs.getString("arrival_time"));
                row.put("available_seats", rs.getString("available_seats"));
                schedules.add(row);
            }
            rs.close(); st.close(); conn.close();
        } catch (Exception e) { out.print("<tr><td colspan='9' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
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
        <% for (Map<String, String> sch : schedules) { %>
        <tr>
            <td><%= sch.get("schedule_id") %></td>
            <td><%= sch.get("route_id") %></td>
            <td><%= sch.get("train_name") %></td>
            <td><%= sch.get("departure_station") %></td>
            <td><%= sch.get("arrival_station") %></td>
            <td><%= sch.get("departure_time") %></td>
            <td><%= sch.get("arrival_time") %></td>
            <td><%= sch.get("available_seats") %></td>
            <td>
                <a class="action-btn" href="/admin/schedule?action=edit&id=<%= sch.get("schedule_id") %>">Sửa</a>
                <a class="action-btn" href="/admin/schedule?action=delete&id=<%= sch.get("schedule_id") %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
