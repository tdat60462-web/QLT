package com.quanlytau.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.quanlytau.model.dao.RouteDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/public/route")
public class PublicRouteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RouteDAO dao = new RouteDAO();
        List<Map<String, String>> routes = dao.getPublicRoutes();
        request.setAttribute("routes", routes);
        request.getRequestDispatcher("/views/public/route.jsp").forward(request, response);
    }
}
