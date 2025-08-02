package com.baodientu.model.dao;

import com.baodientu.model.bean.Train;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainDAO {
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

    public List<Train> getAllTrains() {
        List<Train> trains = new ArrayList<>();
        String sql = "SELECT * FROM train";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Train train = new Train();
                train.setTrainId(rs.getString("train_id"));
                train.setTrainType(rs.getString("train_type"));
                train.setDepartureTime(rs.getString("departure_time"));
                train.setArrivalTime(rs.getString("arrival_time"));
                train.setCarriageCount(rs.getInt("carriage_count"));
                train.setRouteId(rs.getString("route_id"));
                train.setDepartureStation(rs.getString("departure_station"));
                train.setArrivalStation(rs.getString("arrival_station"));
                trains.add(train);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }

    public Train getTrainById(String trainId) {
        String sql = "SELECT * FROM train WHERE train_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, trainId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Train train = new Train();
                    train.setTrainId(rs.getString("train_id"));
                    train.setTrainType(rs.getString("train_type"));
                    train.setDepartureTime(rs.getString("departure_time"));
                    train.setArrivalTime(rs.getString("arrival_time"));
                    train.setCarriageCount(rs.getInt("carriage_count"));
                    train.setRouteId(rs.getString("route_id"));
                    train.setDepartureStation(rs.getString("departure_station"));
                    train.setArrivalStation(rs.getString("arrival_station"));
                    return train;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addTrain(Train train) {
        String sql = "INSERT INTO train (train_id, train_type, departure_time, arrival_time, carriage_count, route_id, departure_station, arrival_station) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, train.getTrainId());
            ps.setString(2, train.getTrainType());
            ps.setString(3, train.getDepartureTime());
            ps.setString(4, train.getArrivalTime());
            ps.setInt(5, train.getCarriageCount());
            ps.setString(6, train.getRouteId());
            ps.setString(7, train.getDepartureStation());
            ps.setString(8, train.getArrivalStation());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateTrain(Train train) {
        String sql = "UPDATE train SET train_type=?, departure_time=?, arrival_time=?, carriage_count=?, route_id=?, departure_station=?, arrival_station=? WHERE train_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, train.getTrainType());
            ps.setString(2, train.getDepartureTime());
            ps.setString(3, train.getArrivalTime());
            ps.setInt(4, train.getCarriageCount());
            ps.setString(5, train.getRouteId());
            ps.setString(6, train.getDepartureStation());
            ps.setString(7, train.getArrivalStation());
            ps.setString(8, train.getTrainId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTrain(String trainId) {
        String sql = "DELETE FROM train WHERE train_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, trainId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
