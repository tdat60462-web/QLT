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
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlt", "root", "");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM Route");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<>();
                    row.put("routeId", rs.getString("routeId"));
                    row.put("departureStation", rs.getString("departureStation"));
                    row.put("arrivalStation", rs.getString("arrivalStation"));
                    row.put("distance", rs.getString("distance"));
                    routes.add(row);
                }
                rs.close(); st.close(); conn.close();
            } catch (Exception e) { out.print("<tr><td colspan='4' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
        %>
        <table>
            <tr>
                <th>Mã tuyến</th>
                <th>Ga đi</th>
                <th>Ga đến</th>
                <th>Quãng đường (km)</th>
            </tr>
            <% for (Map<String, String> r : routes) { %>
            <tr>
                <td><%= r.get("routeId") %></td>
                <td><%= r.get("departureStation") %></td>
                <td><%= r.get("arrivalStation") %></td>
                <td><%= r.get("distance") %></td>
            </tr>
            <% } %>
        </table>
        <p style="text-align:center;color:#888;">(Dữ liệu lấy từ CSDL bảng Route)</p>
    </div>
</body>
</html>
