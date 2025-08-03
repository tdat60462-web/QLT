<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.quanlytau.model.bean.Route" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
    Route route = (Route)request.getAttribute("route");
    boolean isEdit = (route != null);
    List<Map<String, String>> trains = (List<Map<String, String>>)request.getAttribute("trains");
    List<Map<String, String>> stations = (List<Map<String, String>>)request.getAttribute("stations");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Sửa tuyến" : "Thêm tuyến" %></title>
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
        input[type="text"], select {
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
    <h2><%= isEdit ? "Sửa tuyến" : "Thêm tuyến mới" %></h2>
    <% String message = (String) request.getAttribute("message");
       String error = (String) request.getAttribute("error");
       if (message != null) { %>
        <div class="msg success"><%= message %></div>
    <% }
       if (error != null) { %>
        <div class="msg error"><%= error %></div>
    <% } %>
    <form method="post" action="/admin/route">
        <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>" />
        <div class="form-row">
            <label for="routeId">Mã tuyến:</label>
            <input type="text" id="routeId" name="routeId" value="<%= isEdit ? route.getRouteId() : "" %>" <%= isEdit ? "readonly" : "" %> required />
        </div>
        <div class="form-row">
            <label for="trainId">Tàu:</label>
            <select id="trainId" name="trainId" required>
                <option value="">-- Chọn tàu --</option>
                <% if (trains != null) for (Map<String, String> t : trains) { %>
                    <option value="<%= t.get("train_id") %>" <%= isEdit && route.getTrainId() == Integer.parseInt(t.get("train_id")) ? "selected" : "" %>><%= t.get("name") %> (<%= t.get("type") %>)</option>
                <% } %>
            </select>
        </div>
        <div class="form-row">
            <label for="departureStationId">Ga đi:</label>
            <select id="departureStationId" name="departureStationId" required>
                <option value="">-- Chọn ga đi --</option>
                <% if (stations != null) for (Map<String, String> s : stations) { %>
                    <option value="<%= s.get("station_id") %>" <%= isEdit && route.getDepartureStationId() == Integer.parseInt(s.get("station_id")) ? "selected" : "" %>><%= s.get("name") %></option>
                <% } %>
            </select>
        </div>
        <div class="form-row">
            <label for="arrivalStationId">Ga đến:</label>
            <select id="arrivalStationId" name="arrivalStationId" required>
                <option value="">-- Chọn ga đến --</option>
                <% if (stations != null) for (Map<String, String> s : stations) { %>
                    <option value="<%= s.get("station_id") %>" <%= isEdit && route.getArrivalStationId() == Integer.parseInt(s.get("station_id")) ? "selected" : "" %>><%= s.get("name") %></option>
                <% } %>
            </select>
        </div>
        <div class="form-row">
            <label for="duration">Thời gian (hh:mm:ss):</label>
            <input type="text" id="duration" name="duration" value="<%= isEdit ? route.getDuration() : "" %>" required />
        </div>
        <button type="submit"><%= isEdit ? "Cập nhật" : "Thêm mới" %></button>
    </form>
    <a class="back-link" href="/QLT/views/admin/station-index.jsp">Quay lại danh sách</a>
</div>
</body>
</html>
