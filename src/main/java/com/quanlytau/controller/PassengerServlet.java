package com.quanlytau.controller;

import com.quanlytau.model.bean.Passenger;
import com.quanlytau.model.bo.PassengerBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/passenger")
public class PassengerServlet extends HttpServlet {
    private PassengerBO passengerBO = new PassengerBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        if (action.equals("list")) {
            List<Passenger> passengers = passengerBO.getAllPassengers();
            request.setAttribute("passengers", passengers);
            request.getRequestDispatcher("/views/passenger/list.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            int passengerId = Integer.parseInt(request.getParameter("id"));
            Passenger passenger = passengerBO.getPassengerById(passengerId);
            request.setAttribute("passenger", passenger);
            request.getRequestDispatcher("/views/passenger/detail.jsp").forward(request, response);
        }
        // Thêm các action thêm/sửa/xóa nếu cần
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý thêm/sửa/xóa passenger
        // Ví dụ: lấy dữ liệu từ form, gọi passengerBO.addPassenger/updatePassenger/deletePassenger
    }
}
