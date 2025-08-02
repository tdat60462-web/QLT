<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.baodientu.model.bean.Station" %>
<%
    Station station = (Station)request.getAttribute("station");
    boolean isEdit = (station != null);
%>
<html>
<head>
    <title><%= isEdit ? "Sửa ga tàu" : "Thêm ga tàu" %></title>
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
<%@ include file="logout-link.jsp" %>
<h2><%= isEdit ? "Sửa ga tàu" : "Thêm ga tàu mới" %></h2>
<form method="post" action="/admin/station">
    <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>" />
    <table>
        <tr>
            <td>Mã ga:</td>
            <td><input type="text" name="stationId" value="<%= isEdit ? station.getStationId() : "" %>" <%= isEdit ? "readonly" : "" %> required /></td>
        </tr>
        <tr>
            <td>Tên ga:</td>
            <td><input type="text" name="name" value="<%= isEdit ? station.getName() : "" %>" required /></td>
        </tr>
        <tr>
            <td>Địa chỉ:</td>
            <td><input type="text" name="address" value="<%= isEdit ? station.getAddress() : "" %>" required /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit"><%= isEdit ? "Cập nhật" : "Thêm mới" %></button></td>
        </tr>
    </table>
</form>
<a href="/admin/station">Quay lại danh sách</a>
</body>
</html>
