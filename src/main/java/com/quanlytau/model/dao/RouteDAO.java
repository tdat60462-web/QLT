package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Route;
import java.sql.*;
import java.util.*;

public class RouteDAO {
    private Connection conn;

    // Constructor không tham số cho public servlet
    public RouteDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/train_schedule_db", "root", ""
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public RouteDAO(Connection conn) {
        this.conn = conn;
    }
    // Lấy danh sách tuyến đường cho public, trả về List<Map<String, String>>
    public List<Map<String, String>> getPublicRoutes() {
        List<Map<String, String>> routes = new ArrayList<>();
        String sql = "SELECT r.route_id, t.name AS train_name, t.type, " +
                "s1.name AS departure_station, s2.name AS arrival_station, r.duration " +
                "FROM route r " +
                "JOIN train t ON r.train_id = t.train_id " +
                "JOIN station s1 ON r.departure_station_id = s1.station_id " +
                "JOIN station s2 ON r.arrival_station_id = s2.station_id";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("route_id", rs.getString("route_id"));
                map.put("train_name", rs.getString("train_name"));
                map.put("type", rs.getString("type"));
                map.put("departure_station", rs.getString("departure_station"));
                map.put("arrival_station", rs.getString("arrival_station"));
                map.put("duration", rs.getString("duration"));
                routes.add(map);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return routes;
    }

    public List<Route> getAllRoutes() throws SQLException {
        List<Route> routes = new ArrayList<>();
        String sql = "SELECT * FROM route";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Route route = new Route(
                    rs.getInt("route_id"),
                    rs.getInt("train_id"),
                    rs.getInt("departure_station_id"),
                    rs.getInt("arrival_station_id"),
                    rs.getString("duration")
                );
                routes.add(route);
            }
        }
        return routes;
    }

    public Route getRouteById(int routeId) throws SQLException {
        String sql = "SELECT * FROM route WHERE route_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Route(
                        rs.getInt("route_id"),
                        rs.getInt("train_id"),
                        rs.getInt("departure_station_id"),
                        rs.getInt("arrival_station_id"),
                        rs.getString("duration")
                    );
                }
            }
        }
        return null;
    }

    public boolean addRoute(Route route) throws SQLException {
        String sql = "INSERT INTO route (train_id, departure_station_id, arrival_station_id, duration) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, route.getTrainId());
            ps.setInt(2, route.getDepartureStationId());
            ps.setInt(3, route.getArrivalStationId());
            ps.setString(4, route.getDuration());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateRoute(Route route) throws SQLException {
        String sql = "UPDATE route SET train_id=?, departure_station_id=?, arrival_station_id=?, duration=? WHERE route_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, route.getTrainId());
            ps.setInt(2, route.getDepartureStationId());
            ps.setInt(3, route.getArrivalStationId());
            ps.setString(4, route.getDuration());
            ps.setInt(5, route.getRouteId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteRoute(int routeId) throws SQLException {
        String sql = "DELETE FROM route WHERE route_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            return ps.executeUpdate() > 0;
        }
    }
}
