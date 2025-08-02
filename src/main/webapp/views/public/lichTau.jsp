<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch tàu</title>
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
        <h2>Lịch tàu</h2>
        <%@ page import="java.sql.*, java.util.*" %>
        <%
            List<Map<String, String>> trains = new ArrayList<>();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlt", "root", "");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM Train");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<>();
                    row.put("trainId", rs.getString("trainId"));
                    row.put("trainType", rs.getString("trainType"));
                    row.put("departureTime", rs.getString("departureTime"));
                    row.put("departureStation", rs.getString("departureStation"));
                    row.put("arrivalStation", rs.getString("arrivalStation"));
                    trains.add(row);
                }
                rs.close(); st.close(); conn.close();
            } catch (Exception e) { out.print("<tr><td colspan='5' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
        %>
        <table>
            <tr>
                <th>Mã tàu</th>
                <th>Loại tàu</th>
                <th>Giờ xuất phát</th>
                <th>Ga đi</th>
                <th>Ga đến</th>
            </tr>
            <% for (Map<String, String> t : trains) { %>
            <tr>
                <td><%= t.get("trainId") %></td>
                <td><%= t.get("trainType") %></td>
                <td><%= t.get("departureTime") %></td>
                <td><%= t.get("departureStation") %></td>
                <td><%= t.get("arrivalStation") %></td>
            </tr>
            <% } %>
        </table>
        <p style="text-align:center;color:#888;">(Dữ liệu lấy từ CSDL bảng Train)</p>
    </div>
</body>
</html>
