package com.quanlytau.controller;

import com.quanlytau.model.dao.StationDAO;
import com.quanlytau.model.bean.Station;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/station")
public class StationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StationDAO dao = new StationDAO();
        List<Station> stations = dao.getAllStations();
        request.setAttribute("stations", stations);
        request.getRequestDispatcher("/views/admin/station-index.jsp").forward(request, response);
    }
}
