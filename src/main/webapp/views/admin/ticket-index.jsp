<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý vé</title>
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
    <h2>Danh sách vé</h2>
    <a class="add-btn" href="/QLT/views/admin/ticket-register.jsp">Thêm vé mới</a>
    <%@ page import="java.sql.*, java.util.*, com.quanlytau.model.bean.Ticket" %>
    <%
        List<Ticket> tickets = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
            Statement st = conn.createStatement();
            String sql = "SELECT tk.ticket_id, tk.schedule_id, tk.passenger_id, tk.seat_number, tk.price, tk.status, sch.departure_time, sch.arrival_time, p.name AS passenger_name FROM ticket tk JOIN schedule sch ON tk.schedule_id = sch.schedule_id JOIN passenger p ON tk.passenger_id = p.passenger_id";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setScheduleId(rs.getInt("schedule_id"));
                ticket.setPassengerId(rs.getInt("passenger_id"));
                ticket.setSeatNumber(rs.getString("seat_number"));
                ticket.setPrice(rs.getDouble("price"));
                ticket.setStatus(rs.getString("status"));
                ticket.setDepartureTime(rs.getString("departure_time"));
                ticket.setArrivalTime(rs.getString("arrival_time"));
                ticket.setPassengerName(rs.getString("passenger_name"));
                tickets.add(ticket);
            }
            rs.close(); st.close(); conn.close();
        } catch (Exception e) { out.print("<tr><td colspan='10' style='color:red;text-align:center;'>Lỗi kết nối CSDL!</td></tr>"); }
    %>
    <table>
        <tr>
            <th>Mã vé</th>
            <th>Mã lịch trình</th>
            <th>Hành khách</th>
            <th>Số ghế</th>
            <th>Giá vé</th>
            <th>Trạng thái</th>
            <th>Giờ xuất phát</th>
            <th>Giờ đến</th>
            <th>Hành động</th>
        </tr>
        <% for (Ticket tk : tickets) { %>
        <tr>
            <td><%= tk.getTicketId() %></td>
            <td><%= tk.getScheduleId() %></td>
            <td><%= tk.getPassengerName() %></td>
            <td><%= tk.getSeatNumber() %></td>
            <td><%= tk.getPrice() %></td>
            <td><%= tk.getStatus() %></td>
            <td><%= tk.getDepartureTime() %></td>
            <td><%= tk.getArrivalTime() %></td>
            <td>
                <a class="action-btn" href="/admin/ticket?action=edit&id=<%= tk.getTicketId() %>">Sửa</a>
                <a class="action-btn" href="/admin/ticket?action=delete&id=<%= tk.getTicketId() %>" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
