<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tra cứu lịch tàu</title>
</head>
<body>
<h2>Tra cứu lịch tàu</h2>
<form method="get" action="/search">
    <table>
        <tr>
            <td>Tuyến:</td>
            <td><input type="text" name="routeId" /></td>
        </tr>
        <tr>
            <td>Ngày xuất phát:</td>
            <td><input type="date" name="departureDate" /></td>
        </tr>
        <tr>
            <td>Giờ xuất phát:</td>
            <td><input type="time" name="departureTime" /></td>
        </tr>
        <tr>
            <td>Ga đi:</td>
            <td><input type="text" name="departureStation" /></td>
        </tr>
        <tr>
            <td>Ga đến:</td>
            <td><input type="text" name="arrivalStation" /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Tra cứu</button></td>
        </tr>
    </table>
</form>
<%-- Hiển thị kết quả nếu có --%>
<% if (request.getAttribute("trains") != null) {
    java.util.List<quanlytau.model.bean.Train> trains = (java.util.List<quanlytau.model.bean.Train>)request.getAttribute("trains");
%>
<h3>Kết quả tra cứu</h3>
<table border="1">
    <tr>
        <th>Mã tàu</th>
        <th>Loại tàu</th>
        <th>Giờ xuất phát</th>
        <th>Giờ đến</th>
        <th>Số toa</th>
        <th>Tuyến</th>
        <th>Ga đi</th>
        <th>Ga đến</th>
    </tr>
    <% for (quanlytau.model.bean.Train train : trains) { %>
    <tr>
        <td><a href="/detail?id=<%= train.getTrainId() %>"><%= train.getTrainId() %></a></td>
        <td><%= train.getTrainType() %></td>
        <td><%= train.getDepartureTime() %></td>
        <td><%= train.getArrivalTime() %></td>
        <td><%= train.getCarriageCount() %></td>
        <td><%= train.getRouteId() %></td>
        <td><%= train.getDepartureStation() %></td>
        <td><%= train.getArrivalStation() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>
