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
        .nav a.active {
            /* Không có màu nền mặc định */
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
</head>
<body>
    <div class="header">
        <div class="logo">QLT</div>
        <div class="nav">
            <a href="/QLT/views/index.jsp">Trang chủ</a>           
            <a href="/QLT/views/public/trainSchedule.jsp" target="mainframe">Lịch trình</a>
            <a href="/QLT/views/public/route.jsp" target="mainframe">Tuyến đường</a>
            <a href="/QLT/views/public/contact.jsp" target="mainframe">Liên hệ - Phản hồi</a>
            <a href="/QLT/views/admin/login.jsp" target="mainframe" class="login-btn">Đăng nhập</a>
        </div>
    </div>
    <div class="main">
        <iframe name="mainframe" src="/QLT/views/mainframe.jsp"></iframe>
    </div>
</body>
</html>
