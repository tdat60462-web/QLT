package com.quanlytau.controller;

import com.quanlytau.model.dao.TrainDAO;
import com.quanlytau.model.bean.Train;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/train-general")
public class TrainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TrainDAO trainDAO = new TrainDAO();
        List<Train> trains = trainDAO.getAllTrains();
        request.setAttribute("trains", trains);
        request.getRequestDispatcher("/views/admin/train-index.jsp").forward(request, response);
    }
}
