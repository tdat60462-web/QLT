package com.quanlytau.model.bo;

import com.quanlytau.model.bean.Route;
import com.quanlytau.model.dao.RouteDAO;
import java.util.List;

public class RouteBO {
    private RouteDAO routeDAO = new RouteDAO();

    public List<Route> getAllRoutes() {
        return routeDAO.getAllRoutes();
    }

    public Route getRouteById(int routeId) {
        return routeDAO.getRouteById(routeId);
    }

    public boolean addRoute(Route route) {
        return routeDAO.addRoute(route);
    }

    public boolean updateRoute(Route route) {
        return routeDAO.updateRoute(route);
    }

    public boolean deleteRoute(int routeId) {
        return routeDAO.deleteRoute(routeId);
    }
}
