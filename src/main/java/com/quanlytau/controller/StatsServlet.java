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
        request.setAttribute("totalTrains", totalTrains);
        request.getRequestDispatcher("/views/admin/stats-index.jsp").forward(request, response);
    }
}
