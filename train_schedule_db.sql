-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 03, 2025 lúc 03:56 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `train_schedule_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `name`, `email`, `phone`) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com', '0901234567'),
(2, 'Trần Thị B', 'b@gmail.com', '0907654321');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  `departure_station_id` int(11) DEFAULT NULL,
  `arrival_station_id` int(11) DEFAULT NULL,
  `duration` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `route`
--

INSERT INTO `route` (`route_id`, `train_id`, `departure_station_id`, `arrival_station_id`, `duration`) VALUES
(1, 1, 1, 2, '30:00:00'),
(2, 2, 2, 3, '17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `available_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `route_id`, `departure_time`, `arrival_time`, `available_seats`) VALUES
(1, 1, '2025-08-05 06:00:00', '2025-08-06 12:00:00', 100),
(2, 2, '2025-08-07 08:30:00', '2025-08-07 22:00:00', 80);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `station`
--

CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `station`
--

INSERT INTO `station` (`station_id`, `name`, `address`) VALUES
(1, 'Ga Hà Nội', '120 Lê Duẩn, Hoàn Kiếm, Hà Nội'),
(2, 'Ga Sài Gòn', '1 Nguyễn Thông, Q.3, TP.HCM'),
(3, 'Ga Đà Nẵng', '791 Hải Phòng, Thanh Khê, Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `booking_time` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `schedule_id`, `passenger_id`, `seat_number`, `booking_time`, `price`) VALUES
(1, 1, 1, 'A01', '2025-08-01 10:00:00', 500000.00),
(2, 2, 2, 'B05', '2025-08-02 11:00:00', 400000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `train`
--

CREATE TABLE `train` (
  `train_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `train`
--

INSERT INTO `train` (`train_id`, `name`, `type`) VALUES
(1, 'SE1', 'Tàu nhanh'),
(2, 'SE2', 'Tàu thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `full_name`, `role`) VALUES
(1, 'admin', 'admin', 'Quản trị viên', 'admin'),
(2, 'staff1', 'staff123', 'Nhân viên 1', 'staff');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Chỉ mục cho bảng `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `departure_station_id` (`departure_station_id`),
  ADD KEY `arrival_station_id` (`arrival_station_id`);

--
-- Chỉ mục cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Chỉ mục cho bảng `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Chỉ mục cho bảng `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`train_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `station`
--
ALTER TABLE `station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `train`
--
ALTER TABLE `train`
  MODIFY `train_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`departure_station_id`) REFERENCES `station` (`station_id`),
  ADD CONSTRAINT `route_ibfk_3` FOREIGN KEY (`arrival_station_id`) REFERENCES `station` (`station_id`);

--
-- Các ràng buộc cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`);

--
-- Các ràng buộc cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
