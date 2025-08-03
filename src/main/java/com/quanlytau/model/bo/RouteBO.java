package com.quanlytau.model.bo;

import com.quanlytau.model.bean.Route;
import com.quanlytau.model.dao.RouteDAO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class RouteBO {
    private RouteDAO routeDAO;

    public RouteBO(Connection conn) {
        this.routeDAO = new RouteDAO(conn);
    }

    public List<Route> getAllRoutes() throws SQLException {
        return routeDAO.getAllRoutes();
    }

    public Route getRouteById(int routeId) throws SQLException {
        return routeDAO.getRouteById(routeId);
    }

    public boolean addRoute(Route route) throws SQLException {
        return routeDAO.addRoute(route);
    }

    public boolean updateRoute(Route route) throws SQLException {
        return routeDAO.updateRoute(route);
    }

    public boolean deleteRoute(int routeId) throws SQLException {
        return routeDAO.deleteRoute(routeId);
    }
}
