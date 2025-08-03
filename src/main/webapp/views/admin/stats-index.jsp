<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thống kê hệ thống</title>
    <style>
        body { font-family: 'Roboto', 'Segoe UI', Arial, sans-serif; background: #f8f9fa; color: #222; margin: 0; }
        .container { background: #fff; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,0.10); padding: 32px; margin: 32px auto; max-width: 900px; }
        h2 { color: #1e90ff; font-size: 2rem; margin-bottom: 24px; text-align: center; }
        .stat-box { display: flex; flex-wrap: wrap; gap: 32px; justify-content: center; margin-bottom: 32px; }
        .stat-item { background: #f5f5f5; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); padding: 24px 40px; min-width: 220px; text-align: center; }
        .stat-label { font-size: 1.1rem; color: #1565c0; margin-bottom: 8px; }
        .stat-value { font-size: 2.2rem; font-weight: bold; color: #1e90ff; }
    </style>
</head>
<body>
<%@ include file="logout-link.jsp" %>
<div class="container">
    <h2>Thống kê hệ thống</h2>
    <div class="stat-box">
        <%
            int totalTickets = request.getAttribute("totalTickets") != null ? (Integer) request.getAttribute("totalTickets") : 0;
            int totalPassengers = request.getAttribute("totalPassengers") != null ? (Integer) request.getAttribute("totalPassengers") : 0;
            int totalTrains = request.getAttribute("totalTrains") != null ? (Integer) request.getAttribute("totalTrains") : 0;
            int totalSchedules = request.getAttribute("totalSchedules") != null ? (Integer) request.getAttribute("totalSchedules") : 0;
            double totalRevenue = request.getAttribute("totalRevenue") != null ? (Double) request.getAttribute("totalRevenue") : 0;
        %>
        <div class="stat-item">
            <div class="stat-label">Tổng số vé đã bán</div>
            <div class="stat-value"><%= totalTickets %></div>
        </div>
        <div class="stat-item">
            <div class="stat-label">Tổng số hành khách</div>
            <div class="stat-value"><%= totalPassengers %></div>
        </div>
        <div class="stat-item">
            <div class="stat-label">Tổng số tàu</div>
            <div class="stat-value"><%= totalTrains %></div>
        </div>
        <div class="stat-item">
            <div class="stat-label">Tổng số lịch trình</div>
            <div class="stat-value"><%= totalSchedules %></div>
        </div>
        <div class="stat-item">
            <div class="stat-label">Tổng doanh thu</div>
            <div class="stat-value"><%= String.format("%,.0f", totalRevenue) %> VNĐ</div>
        </div>
    </div>
</div>
</body>
</html>
