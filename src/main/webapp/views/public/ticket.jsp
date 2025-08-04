<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Bảng giá vé</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Bảng giá vé</h2>
        <table>
            <tr>
                <th>Mã vé</th>
                <th>Tuyến đường</th>
                <th>Loại vé</th>
                <th>Giá</th>
            </tr>
            <% 
                List<com.quanlytau.model.bean.Ticket> tickets = (List<com.quanlytau.model.bean.Ticket>)request.getAttribute("tickets");
                if (tickets != null) {
                    for (com.quanlytau.model.bean.Ticket ticket : tickets) {
            %>
            <tr>
                <td><%= ticket.getTicketId() %></td>
                <td><%= ticket.getScheduleId() %></td>
                <td><%= ticket.getSeatNumber() %></td>
                <td><%= ticket.getPrice() %></td>
            </tr>
            <%      }
                } else { %>
            <tr><td colspan="4" style="text-align:center;">Không có dữ liệu vé.</td></tr>
            <% } %>
        </table>
    </div>
</body>
</html>
