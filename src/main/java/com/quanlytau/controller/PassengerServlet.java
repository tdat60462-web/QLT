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

@WebServlet("/admin/passenger")
public class PassengerServlet extends HttpServlet {
    private PassengerBO passengerBO = new PassengerBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "add":
                request.getRequestDispatcher("/views/admin/passenger-register.jsp").forward(request, response);
                break;
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Passenger passenger = passengerBO.getPassengerById(editId);
                request.setAttribute("passenger", passenger);
                request.getRequestDispatcher("/views/admin/passenger-register.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                passengerBO.deletePassenger(deleteId);
                response.sendRedirect("/admin/passenger");
                break;
            default:
                List<Passenger> passengers = passengerBO.getAllPassengers();
                request.setAttribute("passengers", passengers);
                request.getRequestDispatcher("/views/admin/passenger-index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "add";
        String idStr = request.getParameter("passengerId");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int passengerId = 0;
        if (idStr != null && !idStr.isEmpty()) {
            try { passengerId = Integer.parseInt(idStr); } catch (NumberFormatException e) { passengerId = 0; }
        }
        Passenger passenger = new Passenger(passengerId, name, email, phone);
        if ("edit".equals(action)) {
            passengerBO.updatePassenger(passenger);
        } else {
            passengerBO.addPassenger(passenger);
        }
        response.sendRedirect("/admin/passenger");
    }
}
