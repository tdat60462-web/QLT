package com.quanlytau.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.quanlytau.model.dao.TrainDAO;
import java.io.IOException;
import java.util.List;

@WebServlet("/public/search")
public class PublicSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số tìm kiếm
        String routeId = request.getParameter("routeId");
        String departureDate = request.getParameter("departureDate");
        String departureTime = request.getParameter("departureTime");
        String departureStation = request.getParameter("departureStation");
        String arrivalStation = request.getParameter("arrivalStation");
        // Gọi DAO để lấy danh sách tàu phù hợp
        TrainDAO dao = new TrainDAO();
        List<com.quanlytau.model.bean.Train> trains = dao.searchTrains(routeId, departureDate, departureTime, departureStation, arrivalStation);
        request.setAttribute("trains", trains);
        request.getRequestDispatcher("/views/public/search.jsp").forward(request, response);
    }
}
