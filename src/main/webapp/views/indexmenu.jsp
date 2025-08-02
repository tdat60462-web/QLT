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
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #222;
            color: #fff;
        }
        .header {
            background: #111;
            padding: 16px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
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
            background: url('https://i.imgur.com/2QZb6zB.jpg') center/cover no-repeat;
            min-height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 80px 60px;
            position: relative;
        }
        .main::after {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.45);
            z-index: 1;
        }
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
            <a href="index.jsp" class="active">Trang chủ</a>
            <a href="#">Giới thiệu</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Bảng giá</a>
            <a href="#">Liên hệ</a>
            <a href="login.jsp" style="background:#1e90ff; color:#fff; padding:8px 16px; border-radius:4px; margin-left:16px;">Đăng nhập hệ thống</a>
        </div>
    </div>
    <div class="main">
        <div class="main-content">
            <h1><span>Thông tin</span> hành trình tàu</h1>
            <p>Giải pháp theo dõi tàu thuyền toàn diện phục vụ quản lý nhà nước chuyên ngành và hỗ trợ các doanh nghiệp ra quyết định.</p>
            <button class="btn btn-primary" onclick="location.href='login.jsp'">Đăng Nhập Hệ Thống</button>
            <button class="btn btn-secondary" onclick="location.href='#'">Tìm Hiểu Thêm</button>
        </div>
    </div>
</body>
</html>
