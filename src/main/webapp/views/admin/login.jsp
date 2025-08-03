<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý lịch tàu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
            margin: 0;
        }
        .header {
            background: #111;
            color: #fff;
            padding: 16px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 16px rgba(0,0,0,0.15);
        }
        .logo {
            font-size: 2rem;
            font-weight: bold;
            margin-left: 32px;
            letter-spacing: 2px;
        }
        .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 1.1rem;
            padding: 8px 12px;
            transition: all 0.2s;
            border-radius: 6px;
        }
        .nav a:hover {
            background-color: #444;
            color: #fff;
        }
        .nav .login-btn {
            background: #1e90ff;
            color: #fff;
            padding: 8px 16px;
            border-radius: 4px;
            margin-left: 16px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
        }
        .nav .login-btn:hover {
            background: #1565c0;
        }
        .main {
            background: #fff;
            min-height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: stretch;
            padding: 0;
        }
        iframe {
            width: 100%;
            height: 100vh;
            border: none;
            border-radius: 0;
            box-shadow: none;
            background: transparent;
        }
    </style>
    <meta charset="UTF-8">
    <title>Đăng nhập quản trị</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
            margin: 0;
        }
        .login-box {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            padding: 32px;
            margin: 32px auto;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
        }
        .form-row {
            margin-bottom: 18px;
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 1rem;
            color: #333;
            margin-bottom: 6px;
        }
        input[type="text"], input[type="password"] {
            padding: 10px 14px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 1rem;
            background: #f9f9f9;
            transition: border 0.2s;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border: 1.5px solid #1e90ff;
            outline: none;
        }
        .login-btn {
            width: 100%;
            padding: 12px 0;
            background: #1e90ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            margin-top: 8px;
            box-shadow: 0 2px 8px rgba(30,144,255,0.08);
            transition: background 0.2s;
        }
        .login-btn:hover {
            background: #1565c0;
        }
        .error {
            color: #e53935;
            text-align: center;
            margin-top: 12px;
            font-size: 1rem;
        }
    </style>
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">QLT</div>
        <div class="nav">
            <a href="/QLT/views/index.jsp">Trang chủ</a>           
            <a href="/QLT/public/trainSchedule" target="mainframe">Lịch trình</a>
            <a href="/QLT/public/route" target="mainframe">Tuyến đường</a>
            <a href="/QLT/views/public/contact.jsp" target="mainframe">Liên hệ - Phản hồi</a>
            <a href="/QLT/views/admin/login.jsp" target="mainframe" class="login-btn">Đăng nhập</a>
        </div>
    </div>
<div class="login-box">
        <h2>Đăng nhập quản trị</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin/login">
            <div class="form-row">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required />
            </div>
            <div class="form-row">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required />
            </div>
            <button type="submit" class="login-btn">Đăng nhập</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
    </div>

</body>
</html>
