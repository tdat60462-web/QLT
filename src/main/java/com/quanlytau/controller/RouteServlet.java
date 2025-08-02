package com.quanlytau.controller;

import com.quanlytau.model.bean.Route;
import com.quanlytau.model.bo.RouteBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/route")
public class RouteServlet extends HttpServlet {
    private RouteBO routeBO = new RouteBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        if (action.equals("list")) {
            List<Route> routes = routeBO.getAllRoutes();
            request.setAttribute("routes", routes);
            request.getRequestDispatcher("/views/route/list.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            int routeId = Integer.parseInt(request.getParameter("id"));
            Route route = routeBO.getRouteById(routeId);
            request.setAttribute("route", route);
            request.getRequestDispatcher("/views/route/detail.jsp").forward(request, response);
        }
        // Thêm các action thêm/sửa/xóa nếu cần
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý thêm/sửa/xóa route
        // Ví dụ: lấy dữ liệu từ form, gọi routeBO.addRoute/updateRoute/deleteRoute
    }
}
