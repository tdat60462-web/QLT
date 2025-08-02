package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Station;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StationDAO {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/qlt";
        String user = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(url, user, password);
    }

    public List<Station> getAllStations() {
        List<Station> stations = new ArrayList<>();
        String sql = "SELECT * FROM station";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Station station = new Station();
                station.setStationId(rs.getString("station_id"));
                station.setName(rs.getString("name"));
                station.setAddress(rs.getString("address"));
                stations.add(station);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stations;
    }

    public Station getStationById(String stationId) {
        String sql = "SELECT * FROM station WHERE station_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, stationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Station station = new Station();
                    station.setStationId(rs.getString("station_id"));
                    station.setName(rs.getString("name"));
                    station.setAddress(rs.getString("address"));
                    return station;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addStation(Station station) {
        String sql = "INSERT INTO station (station_id, name, address) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, station.getStationId());
            ps.setString(2, station.getName());
            ps.setString(3, station.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStation(Station station) {
        String sql = "UPDATE station SET name=?, address=? WHERE station_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, station.getName());
            ps.setString(2, station.getAddress());
            ps.setString(3, station.getStationId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteStation(String stationId) {
        String sql = "DELETE FROM station WHERE station_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, stationId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
