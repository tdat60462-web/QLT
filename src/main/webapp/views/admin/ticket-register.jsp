<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.quanlytau.model.bean.Ticket" %>
<%@ page import="java.util.List, com.quanlytau.model.bean.Ticket, com.quanlytau.model.bean.Schedule, com.quanlytau.model.bean.Passenger" %>
<%
    Ticket ticket = (Ticket)request.getAttribute("ticket");
    boolean isEdit = (ticket != null);
    List<Schedule> schedules = (List<Schedule>)request.getAttribute("schedules");
    List<Passenger> passengers = (List<Passenger>)request.getAttribute("passengers");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Sửa vé" : "Thêm vé" %></title>
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
            max-width: 600px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        form {
            margin-top: 16px;
        }
        .form-row {
            margin-bottom: 18px;
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: 500;
            margin-bottom: 6px;
        }
        input[type="text"], input[type="number"], select {
            padding: 10px 14px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 1rem;
        }
        button {
            background: #1e90ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 12px 32px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 12px;
        }
        button:hover {
            background: #1565c0;
        }
        .msg {
            margin-bottom: 18px;
            text-align: center;
        }
        .msg.success { color: green; }
        .msg.error { color: red; }
        .back-link {
            display: block;
            margin-top: 18px;
            text-align: center;
            color: #1e90ff;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2><%= isEdit ? "Sửa vé" : "Thêm vé mới" %></h2>
    <% String message = (String) request.getAttribute("message");
       String error = (String) request.getAttribute("error");
       if (message != null) { %>
        <div class="msg success"><%= message %></div>
    <% }
       if (error != null) { %>
        <div class="msg error"><%= error %></div>
    <% } %>
    <form method="post" action="/admin/ticket">
        <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>" />
        <div class="form-row">
            <label for="ticketId">Mã vé:</label>
            <input type="text" id="ticketId" name="ticketId" value="<%= isEdit ? ticket.getTicketId() : "" %>" <%= isEdit ? "readonly" : "" %> required />
        </div>
        <div class="form-row">
            <label for="scheduleId">Lịch trình:</label>
            <select id="scheduleId" name="scheduleId" required>
                <option value="">-- Chọn lịch trình --</option>
                <% if (schedules != null) for (Schedule sch : schedules) { %>
                    <option value="<%= sch.getScheduleId() %>" <%= isEdit && ticket.getScheduleId() == sch.getScheduleId() ? "selected" : "" %>><%= sch.getScheduleId() %> - <%= sch.getDepartureTime() %> → <%= sch.getArrivalTime() %></option>
                <% } %>
            </select>
        </div>
        <div class="form-row">
            <label for="passengerId">Hành khách:</label>
            <select id="passengerId" name="passengerId" required>
                <option value="">-- Chọn hành khách --</option>
                <% if (passengers != null) for (Passenger p : passengers) { %>
                    <option value="<%= p.getPassengerId() %>" <%= isEdit && ticket.getPassengerId() == p.getPassengerId() ? "selected" : "" %>><%= p.getPassengerId() %> - <%= p.getName() %></option>
                <% } %>
            </select>
        </div>
        <div class="form-row">
            <label for="seatNumber">Số ghế:</label>
            <input type="text" id="seatNumber" name="seatNumber" value="<%= isEdit ? ticket.getSeatNumber() : "" %>" required />
        </div>
        <div class="form-row">
            <label for="price">Giá vé:</label>
            <input type="number" id="price" name="price" value="<%= isEdit ? ticket.getPrice() : "" %>" required />
        </div>
        <div class="form-row">
            <label for="status">Trạng thái:</label>
            <select id="status" name="status" required>
                <option value="booked" <%= isEdit && "booked".equals(ticket.getStatus()) ? "selected" : "" %>>Đã đặt</option>
                <option value="cancelled" <%= isEdit && "cancelled".equals(ticket.getStatus()) ? "selected" : "" %>>Đã hủy</option>
            </select>
        </div>
        <button type="submit"><%= isEdit ? "Cập nhật" : "Thêm mới" %></button>
    </form>
    <a class="back-link" href="/QLT/views/admin/ticket-index.jsp">Quay lại danh sách</a>
</div>
</body>
</html>
