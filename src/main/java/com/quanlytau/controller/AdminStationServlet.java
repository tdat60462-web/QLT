package com.quanlytau.controller;

import com.quanlytau.model.bean.Station;
import com.quanlytau.model.bo.StationBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/station-admin")
public class AdminStationServlet extends HttpServlet {
    private StationBO stationBO = new StationBO();

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
                request.getRequestDispatcher("/views/admin/station-register.jsp").forward(request, response);
                break;
            case "edit":
                String stationId = request.getParameter("id");
                Station station = stationBO.getStationById(stationId);
                request.setAttribute("station", station);
                request.getRequestDispatcher("/views/admin/station-register.jsp").forward(request, response);
                break;
            case "delete":
                stationId = request.getParameter("id");
                stationBO.deleteStation(stationId);
                response.sendRedirect("/admin/station");
                break;
            default:
                List<Station> stations = stationBO.getAllStations();
                request.setAttribute("stations", stations);
                request.getRequestDispatcher("/views/admin/station-index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "add";
        String stationIdStr = request.getParameter("stationId");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int stationId = 0;
        if (stationIdStr != null && !stationIdStr.isEmpty()) {
            try {
                stationId = Integer.parseInt(stationIdStr);
            } catch (NumberFormatException e) {
                stationId = 0;
            }
        }
        Station station = new Station(stationId, name, address);
        if ("edit".equals(action)) {
            stationBO.updateStation(station);
        } else {
            stationBO.addStation(station);
        }
        response.sendRedirect("/admin/station");
    }
}
