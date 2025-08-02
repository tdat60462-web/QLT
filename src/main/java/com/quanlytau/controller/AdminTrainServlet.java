package com.quanlytau.controller;

import com.quanlytau.model.bean.Train;
import com.quanlytau.model.bo.TrainBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/train")
public class AdminTrainServlet extends HttpServlet {
    private TrainBO trainBO = new TrainBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra đăng nhập admin
        jakarta.servlet.http.HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/login");
            return;
        }
        String action = request.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "add":
                request.getRequestDispatcher("/views/admin/register.jsp").forward(request, response);
                break;
            case "edit":
                String trainId = request.getParameter("id");
                Train train = trainBO.getTrainById(trainId);
                request.setAttribute("train", train);
                request.getRequestDispatcher("/views/admin/register.jsp").forward(request, response);
                break;
            case "delete":
                trainId = request.getParameter("id");
                trainBO.deleteTrain(trainId);
                response.sendRedirect("/admin/train");
                break;
            default:
                List<Train> trains = trainBO.getAllTrains();
                request.setAttribute("trains", trains);
                request.getRequestDispatcher("/views/admin/index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "add";
        String trainIdStr = request.getParameter("trainId");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int trainId = 0;
        if (trainIdStr != null && !trainIdStr.isEmpty()) {
            try {
                trainId = Integer.parseInt(trainIdStr);
            } catch (NumberFormatException e) {
                trainId = 0;
            }
        }
        Train train = new Train(trainId, name, type);
        if ("edit".equals(action)) {
            trainBO.updateTrain(train);
        } else {
            trainBO.addTrain(train);
        }
        response.sendRedirect("/admin/train");
    }
}
