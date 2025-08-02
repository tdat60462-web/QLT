<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.baodientu.model.bean.Train" %>
<%
    Train train = (Train)request.getAttribute("train");
    boolean isEdit = (train != null);
%>
<html>
<head>
    <title><%= isEdit ? "Sửa chuyến tàu" : "Thêm chuyến tàu" %></title>
</head>
<body>
<h2><%= isEdit ? "Sửa chuyến tàu" : "Thêm chuyến tàu mới" %></h2>
<form method="post" action="/admin/train">
    <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>" />
    <table>
        <tr>
            <td>Mã tàu:</td>
            <td><input type="text" name="trainId" value="<%= isEdit ? train.getTrainId() : "" %>" <%= isEdit ? "readonly" : "" %> required /></td>
        </tr>
        <tr>
            <td>Loại tàu:</td>
            <td><input type="text" name="trainType" value="<%= isEdit ? train.getTrainType() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Giờ xuất phát:</td>
            <td><input type="text" name="departureTime" value="<%= isEdit ? train.getDepartureTime() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Giờ đến:</td>
            <td><input type="text" name="arrivalTime" value="<%= isEdit ? train.getArrivalTime() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Số toa:</td>
            <td><input type="number" name="carriageCount" value="<%= isEdit ? train.getCarriageCount() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Tuyến:</td>
            <td><input type="text" name="routeId" value="<%= isEdit ? train.getRouteId() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Ga đi:</td>
            <td><input type="text" name="departureStation" value="<%= isEdit ? train.getDepartureStation() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Ga đến:</td>
            <td><input type="text" name="arrivalStation" value="<%= isEdit ? train.getArrivalStation() : "" %>" required /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit"><%= isEdit ? "Cập nhật" : "Thêm mới" %></button></td>
        </tr>
    </table>
</form>
<a href="/admin/train">Quay lại danh sách</a>
</body>
</html>
