<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.quanlytau.model.bean.Train" %>
<%
    Train train = (Train)request.getAttribute("train");
    boolean isEdit = (train != null);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Sửa tàu" : "Thêm tàu" %></title>
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
            max-width: 500px;
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
        input[type="text"] {
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
    <h2><%= isEdit ? "Sửa tàu" : "Thêm tàu mới" %></h2>
    <% String message = (String) request.getAttribute("message");
       String error = (String) request.getAttribute("error");
       if (message != null) { %>
        <div class="msg success"><%= message %></div>
    <% }
       if (error != null) { %>
        <div class="msg error"><%= error %></div>
    <% } %>
    <form method="post" action="/admin/train">
        <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>" />
        <div class="form-row">
            <label for="trainId">Mã tàu:</label>
            <input type="text" id="trainId" name="trainId" value="<%= isEdit ? train.getTrainId() : "" %>" <%= isEdit ? "readonly" : "" %> required />
        </div>
        <div class="form-row">
            <label for="name">Tên tàu:</label>
            <input type="text" id="name" name="name" value="<%= isEdit ? train.getName() : "" %>" required />
        </div>
        <div class="form-row">
            <label for="type">Loại tàu:</label>
            <input type="text" id="type" name="type" value="<%= isEdit ? train.getType() : "" %>" required />
        </div>
        <button type="submit"><%= isEdit ? "Cập nhật" : "Thêm mới" %></button>
    </form>
    <a class="back-link" href="/QLT/views/admin/station-index.jsp">Quay lại danh sách</a>
</div>
</body>
</html>
