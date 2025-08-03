package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Route;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteDAO {
    public List<java.util.Map<String, String>> getPublicRoutes() {
        List<java.util.Map<String, String>> routes = new ArrayList<>();
        String sql = "SELECT r.route_id, t.name AS train_name, t.type, s1.name AS departure_station, s2.name AS arrival_station, r.duration " +
            "FROM route r " +
            "JOIN train t ON r.train_id = t.train_id " +
            "JOIN station s1 ON r.departure_station_id = s1.station_id " +
            "JOIN station s2 ON r.arrival_station_id = s2.station_id";
        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                java.util.Map<String, String> row = new java.util.HashMap<>();
                row.put("route_id", rs.getString("route_id"));
                row.put("train_name", rs.getString("train_name"));
                row.put("type", rs.getString("type"));
                row.put("departure_station", rs.getString("departure_station"));
                row.put("arrival_station", rs.getString("arrival_station"));
                row.put("duration", rs.getString("duration"));
                routes.add(row);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return routes;
    }
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
    }

    public List<Route> getAllRoutes() {
        List<Route> routes = new ArrayList<>();
        String sql = "SELECT * FROM route";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Route route = new Route();
                route.setRouteId(rs.getInt("route_id"));
                route.setTrainId(rs.getInt("train_id"));
                route.setDepartureStationId(rs.getInt("departure_station_id"));
                route.setArrivalStationId(rs.getInt("arrival_station_id"));
                route.setDuration(rs.getTime("duration"));
                routes.add(route);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return routes;
    }

    public Route getRouteById(int routeId) {
        String sql = "SELECT * FROM route WHERE route_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Route route = new Route();
                    route.setRouteId(rs.getInt("route_id"));
                    route.setTrainId(rs.getInt("train_id"));
                    route.setDepartureStationId(rs.getInt("departure_station_id"));
                    route.setArrivalStationId(rs.getInt("arrival_station_id"));
                    route.setDuration(rs.getTime("duration"));
                    return route;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addRoute(Route route) {
        String sql = "INSERT INTO route (train_id, departure_station_id, arrival_station_id, duration) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, route.getTrainId());
            ps.setInt(2, route.getDepartureStationId());
            ps.setInt(3, route.getArrivalStationId());
            ps.setTime(4, route.getDuration());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRoute(Route route) {
        String sql = "UPDATE Route SET train_id=?, departure_station_id=?, arrival_station_id=?, duration=? WHERE route_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, route.getTrainId());
            ps.setInt(2, route.getDepartureStationId());
            ps.setInt(3, route.getArrivalStationId());
            ps.setTime(4, route.getDuration());
            ps.setInt(5, route.getRouteId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRoute(int routeId) {
        String sql = "DELETE FROM Route WHERE route_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
