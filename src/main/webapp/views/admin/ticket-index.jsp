
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quanlytau.model.bean.Ticket" %>
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
            max-width: 1000px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        .add-btn {
            background: #43a047;
            color: #fff;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 18px;
            transition: background 0.2s;
            display: inline-block;
        }
        .add-btn:hover {
            background: #2e7d32;
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
        .delete-btn {
            background: #e53935;
        }
        .delete-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Danh sách vé</h2>
    <a class="add-btn" href="/QLT/views/admin/ticket-register.jsp">Thêm vé mới</a>
    <table>
        <tr>
            <th>Mã vé</th>
            <th>Mã lịch trình</th>
            <th>Mã hành khách</th>
            <th>Tên hành khách</th>
            <th>Số ghế</th>
            <th>Giờ đặt vé</th>
            <th>Giá vé</th>
            <th>Giờ xuất phát</th>
            <th>Giờ đến</th>
            <th>Hành động</th>
        </tr>
        <%
            List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
            if (tickets != null && !tickets.isEmpty()) {
                for (Ticket tk : tickets) {
        %>
        <tr>
            <td><%= tk.getTicketId() %></td>
            <td><%= tk.getScheduleId() %></td>
            <td><%= tk.getPassengerId() %></td>
            <td><%= tk.getPassengerName() %></td>
            <td><%= tk.getSeatNumber() %></td>
            <td><%= tk.getBookingTime() %></td>
            <td><%= tk.getPrice() %></td>
            <td><%= tk.getDepartureTime() %></td>
            <td><%= tk.getArrivalTime() %></td>
            <td>
                <form method="post" action="/admin/ticket" style="display:inline;">
                    <input type="hidden" name="action" value="view" />
                    <input type="hidden" name="ticketId" value="<%= tk.getTicketId() %>" />
                    <button class="action-btn" type="submit">Xem</button>
                </form>
                <form method="post" action="/admin/ticket" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa vé này?');">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="ticketId" value="<%= tk.getTicketId() %>" />
                    <button class="action-btn delete-btn" type="submit">Xóa</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="10" style="text-align:center;">Không có dữ liệu vé.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>