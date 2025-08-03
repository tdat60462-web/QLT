package com.quanlytau.controller;

import com.quanlytau.model.bean.Route;
import com.quanlytau.model.bo.RouteBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/route")
public class RouteServlet extends HttpServlet {
    private RouteBO routeBO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/train_schedule_db", "root", ""
            );
            routeBO = new RouteBO(conn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Sử dụng DAO để lấy dữ liệu dạng Map cho view admin
            com.quanlytau.model.dao.RouteDAO dao = new com.quanlytau.model.dao.RouteDAO();
            List<Map<String, String>> routes = dao.getPublicRoutes();
            request.setAttribute("routes", routes);
            request.getRequestDispatcher("/views/admin/route-index.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("add".equals(action)) {
                Route route = new Route(
                    0,
                    Integer.parseInt(request.getParameter("trainId")),
                    Integer.parseInt(request.getParameter("departureStationId")),
                    Integer.parseInt(request.getParameter("arrivalStationId")),
                    request.getParameter("duration")
                );
                routeBO.addRoute(route);
                request.setAttribute("message", "Thêm tuyến thành công!");
            } else if ("edit".equals(action)) {
                Route route = new Route(
                    Integer.parseInt(request.getParameter("routeId")),
                    Integer.parseInt(request.getParameter("trainId")),
                    Integer.parseInt(request.getParameter("departureStationId")),
                    Integer.parseInt(request.getParameter("arrivalStationId")),
                    request.getParameter("duration")
                );
                routeBO.updateRoute(route);
                request.setAttribute("message", "Cập nhật tuyến thành công!");
            } else if ("delete".equals(action)) {
                int routeId = Integer.parseInt(request.getParameter("routeId"));
                routeBO.deleteRoute(routeId);
                request.setAttribute("message", "Xóa tuyến thành công!");
            }
            doGet(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi xử lý: " + e.getMessage());
            doGet(request, response);
        }
    }
}
