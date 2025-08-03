package com.quanlytau.controller;

import com.quanlytau.model.dao.StatsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/stats")
public class StatsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StatsDAO dao = new StatsDAO();
        int totalTrains = dao.getTotalTrains();
        int totalTickets = dao.getTotalTickets();
        int totalPassengers = dao.getTotalPassengers();
        int totalSchedules = dao.getTotalSchedules();
        double totalRevenue = dao.getTotalRevenue();

        request.setAttribute("totalTrains", totalTrains);
        request.setAttribute("totalTickets", totalTickets);
        request.setAttribute("totalPassengers", totalPassengers);
        request.setAttribute("totalSchedules", totalSchedules);
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("/views/admin/stats-index.jsp").forward(request, response);
    }
}
