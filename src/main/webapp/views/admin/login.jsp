<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập quản trị</title>
</head>
<body>
<h2>Đăng nhập quản trị</h2>
<form method="post" action="/admin/login">
    <table>
        <tr>
            <td>Tên đăng nhập:</td>
            <td><input type="text" name="username" required /></td>
        </tr>
        <tr>
            <td>Mật khẩu:</td>
            <td><input type="password" name="password" required /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Đăng nhập</button></td>
        </tr>
    </table>
</form>
<% if (request.getAttribute("error") != null) { %>
    <p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>
</body>
</html>
