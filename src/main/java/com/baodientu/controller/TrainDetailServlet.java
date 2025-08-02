package com.baodientu.controller;

import com.baodientu.model.bean.Train;
import com.baodientu.model.bo.TrainBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detail")
public class TrainDetailServlet extends HttpServlet {
    private TrainBO trainBO = new TrainBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainId = request.getParameter("id");
        Train train = trainBO.getTrainById(trainId);
        request.setAttribute("train", train);
        request.getRequestDispatcher("/views/user/detail.jsp").forward(request, response);
    }
}
