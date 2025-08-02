<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu hệ thống quản lý lịch tàu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
        }
        .header {
            background: #111;
            padding: 16px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 4px 16px rgba(0,0,0,0.15);
        }
        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #fff;
            margin-left: 40px;
        }
        .nav {
            margin-right: 40px;
        }
        .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 16px;
            font-size: 1rem;
            position: relative;
        }
        .nav a.active, .nav a:hover {
            color: #1e90ff;
        }
        .main {
            background: #fff;
            min-height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 80px 60px;
            position: relative;
            border-radius: 0 0 16px 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
        }
        /* Xóa lớp phủ tối, chỉ nền trắng */
        .main-content {
            position: relative;
            z-index: 2;
            max-width: 600px;
        }
        .main-content h1 {
            font-size: 2.5rem;
            color: #fff;
            margin-bottom: 16px;
        }
        .main-content h1 span {
            color: #ff6600;
            font-weight: bold;
        }
        .main-content p {
            font-size: 1.2rem;
            margin-bottom: 32px;
            color: #eee;
        }
        .btn {
            padding: 12px 32px;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            margin-right: 16px;
            font-weight: bold;
            transition: background 0.2s;
        }
        .btn-primary {
            background: #1e90ff;
            color: #fff;
        }
        .btn-primary:hover {
            background: #1565c0;
        }
        .btn-secondary {
            background: #ff6600;
            color: #fff;
        }
        .btn-secondary:hover {
            background: #e65100;
        }
        @media (max-width: 700px) {
            .main { padding: 40px 10px; }
            .main-content { max-width: 100%; }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">QLT</div>
        <div class="nav">
            <a href="/QLT/views/indexmenu.jsp" class="active">Trang chủ</a>
            <a href="#">Giới thiệu</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Bảng giá</a>
            <a href="#">Liên hệ</a>
            <a href="/QLT/views/admin/login.jsp" target="mainframe" style="background:#1e90ff; color:#fff; padding:8px 16px; border-radius:4px; margin-left:16px;">Đăng nhập</a>
        </div>
    </div>
    <div class="main">
        <iframe name="mainframe" src="/QLT/views/mainframe.jsp" style="width:100%;height:500px;border:1.5px solid #e0e0e0;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,0.10);z-index:2;position:relative;background:#fff;"></iframe>
    </div>
</body>
</html>
