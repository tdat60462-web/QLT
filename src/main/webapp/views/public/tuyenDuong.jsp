<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tuyến đường</title>
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
            margin: 0;
        }
        .box {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            padding: 32px;
            margin: 32px auto;
            max-width: 700px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 24px;
        }
        th, td {
            border: 1px solid #e0e0e0;
            padding: 10px 14px;
            text-align: left;
        }
        th {
            background: #f5f5f5;
            color: #222;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Tuyến đường</h2>
        <%@ page import="java.sql.*, java.util.*" %>
        <%
            List<Map<String, String>> routes = new ArrayList<>();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
                Statement st = conn.createStatement();
                String sql = "SELECT r.route_id, t.name AS train_name, t.type, s1.name AS departure_station, s2.name AS arrival_station, r.duration, sch.departure_time, sch.arrival_time " +
                    "FROM route r " +
                    "JOIN train t ON r.train_id = t.train_id " +
                    "JOIN station s1 ON r.departure_station_id = s1.station_id " +
                    "JOIN station s2 ON r.arrival_station_id = s2.station_id " +
                    "LEFT JOIN schedule sch ON r.route_id = sch.route_id ";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Map<String, String> row = new HashMap<>();
                    row.put("route_id", rs.getString("route_id"));
                    row.put("train_name", rs.getString("train_name"));
                    row.put("type", rs.getString("type"));
                    row.put("departure_station", rs.getString("departure_station"));
                    row.put("arrival_station", rs.getString("arrival_station"));
                    row.put("duration", rs.getString("duration"));
                    row.put("departure_time", rs.getString("departure_time"));
                    row.put("arrival_time", rs.getString("arrival_time"));
                    routes.add(row);
                }
                rs.close(); st.close(); conn.close();
            } catch (Exception e) { out.print("<tr><td colspan='8' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
        %>
        <table>
            <tr>
                <th>Mã tuyến</th>
                <th>Tên tàu</th>
                <th>Loại tàu</th>
                <th>Ga đi</th>
                <th>Ga đến</th>
                <th>Thời gian (hh:mm:ss)</th>
                <th>Giờ xuất phát</th>
                <th>Giờ đến</th>
            </tr>
            <% for (Map<String, String> r : routes) { %>
            <tr>
                <td><%= r.get("route_id") %></td>
                <td><%= r.get("train_name") %></td>
                <td><%= r.get("type") %></td>
                <td><%= r.get("departure_station") %></td>
                <td><%= r.get("arrival_station") %></td>
                <td><%= r.get("duration") %></td>
                <td><%= r.get("departure_time") %></td>
                <td><%= r.get("arrival_time") %></td>
            </tr>
            <% } %>
        </table>
        <p style="text-align:center;color:#888;">(Dữ liệu lấy từ nhiều bảng: route, train, station, schedule)</p>
    </div>
</body>
</html>
