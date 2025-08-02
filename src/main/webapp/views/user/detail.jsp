<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="quanlytau.model.bean.Train" %>
<%
    Train train = (Train)request.getAttribute("train");
%>
<html>
<head>
    <title>Chi tiết chuyến tàu</title>
</head>
<body>
<% String message = (String) request.getAttribute("message");
   String error = (String) request.getAttribute("error");
   if (message != null) { %>
    <div style="color: green;"><%= message %></div>
<% }
   if (error != null) { %>
    <div style="color: red;"><%= error %></div>
<% } %>
<h2>Chi tiết chuyến tàu</h2>
<% if (train != null) { %>
<table border="1">
    <tr><td>Mã tàu:</td><td><%= train.getTrainId() %></td></tr>
    <tr><td>Loại tàu:</td><td><%= train.getTrainType() %></td></tr>
    <tr><td>Giờ xuất phát:</td><td><%= train.getDepartureTime() %></td></tr>
    <tr><td>Giờ đến:</td><td><%= train.getArrivalTime() %></td></tr>
    <tr><td>Số toa:</td><td><%= train.getCarriageCount() %></td></tr>
    <tr><td>Tuyến:</td><td><%= train.getRouteId() %></td></tr>
    <tr><td>Ga đi:</td><td><%= train.getDepartureStation() %></td></tr>
    <tr><td>Ga đến:</td><td><%= train.getArrivalStation() %></td></tr>
</table>
<% } else { %>
<p>Không tìm thấy chuyến tàu!</p>
<% } %>
<a href="/search">Quay lại tra cứu</a>
</body>
</html>
