package com.quanlytau.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.quanlytau.model.dao.TrainDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/public/trainSchedule")
public class PublicTrainScheduleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TrainDAO dao = new TrainDAO();
        List<Map<String, String>> trains = dao.getPublicTrainSchedules();
        request.setAttribute("trains", trains);
        request.getRequestDispatcher("/views/public/trainSchedule.jsp").forward(request, response);
    }
}
