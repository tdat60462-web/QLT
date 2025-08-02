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
import java.util.ArrayList;

@WebServlet("/search")
public class TrainSearchServlet extends HttpServlet {
    private TrainBO trainBO = new TrainBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        List<Train> trains = trainBO.getAllTrains();
        // Nếu có tiêu chí tìm kiếm, lọc danh sách
        if ((name != null && !name.trim().isEmpty()) || (type != null && !type.trim().isEmpty())) {
            List<Train> filtered = new ArrayList<>();
            for (Train t : trains) {
                boolean match = true;
                if (name != null && !name.trim().isEmpty() && !t.getName().toLowerCase().contains(name.trim().toLowerCase())) match = false;
                if (type != null && !type.trim().isEmpty() && !t.getType().toLowerCase().contains(type.trim().toLowerCase())) match = false;
                if (match) filtered.add(t);
            }
            trains = filtered;
        }
        request.setAttribute("trains", trains);
        if (trains == null || trains.isEmpty()) {
            request.setAttribute("error", "Không tìm thấy chuyến tàu phù hợp!");
        } else {
            request.setAttribute("message", "Tìm thấy " + trains.size() + " chuyến tàu.");
        }
        request.getRequestDispatcher("/views/user/search.jsp").forward(request, response);
    }
}
