
package com.quanlytau.controller;

import com.quanlytau.model.dao.StationDAO;
import com.quanlytau.model.bean.Station;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/public/station")
public class PublicStationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StationDAO stationDAO = new StationDAO();
        List<Station> stations = stationDAO.getAllStations();
        request.setAttribute("stations", stations);
        request.getRequestDispatcher("/views/public/station.jsp").forward(request, response);
    }
}
