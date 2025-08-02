<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ</title>
    <style>
        body {
            font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
            background: #fff;
            color: #222;
            margin: 0;
        }
        .box {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            padding: 32px;
            margin: 32px auto;
            max-width: 600px;
        }
        h2 {
            color: #1e90ff;
            font-size: 2rem;
            margin-bottom: 24px;
            text-align: center;
        }
        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
        }
        input, textarea {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 1rem;
            margin-bottom: 16px;
            box-sizing: border-box;
        }
        button {
            background: #1e90ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 12px 32px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
        }
        button:hover {
            background: #1565c0;
        }
        .info {
            margin-top: 24px;
            color: #555;
            font-size: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Liên hệ</h2>
        <form method="post" action="#">
            <label for="name">Họ và tên:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="message">Nội dung:</label>
            <textarea id="message" name="message" rows="4" required></textarea>
            <button type="submit">Gửi liên hệ</button>
        </form>
        <div class="info">
            <p>Hotline: 0848525036</p>
            <p>Email: truongquangdat1103@gmail.com</p>
            <p>Địa chỉ: 75 Đồng Kè</p>
        </div>
    </div>
</body>
</html>
