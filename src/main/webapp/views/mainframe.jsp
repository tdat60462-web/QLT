<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu hệ thống quản lý lịch tàu</title>
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
            margin: 0;
        }
        .main-box {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            padding: 32px;
            margin: 32px auto;
            max-width: 700px;
            text-align: center;
        }
        .main-title {
            font-size: 2.2rem;
            color: #1e90ff;
            font-weight: 500;
            margin-bottom: 18px;
        }
        .main-desc {
            font-size: 1.2rem;
            color: #555;
            max-width: 600px;
            margin: 0 auto 32px auto;
        }
        .main-img {
            width: 320px;
            max-width: 90vw;
            margin-bottom: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
        }
    </style>
</head>
<body>
    <div class="main-box">
        <img src="<%=request.getContextPath()%>/images/train.jpg" alt="Train" class="main-img" />
        <div class="main-title">Hệ thống quản lý lịch tàu</div>
        <div class="main-desc">
            Chào mừng bạn đến với hệ thống quản lý lịch tàu!<br>
            Tra cứu thông tin tàu, lịch trình, ga và quản lý dễ dàng.<br>
            Vui lòng chọn chức năng ở menu phía trên để bắt đầu.
        </div>
    </div>
</body>
</html>
