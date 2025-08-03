package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Train;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainDAO {
    public List<Train> searchTrains(String routeId, String departureDate, String departureTime, String departureStation, String arrivalStation) {
        List<Train> trains = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT t.train_id, t.name, t.type FROM train t JOIN route r ON t.train_id = r.train_id JOIN schedule sch ON r.route_id = sch.route_id WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (routeId != null && !routeId.isEmpty()) {
            sql.append(" AND r.route_id = ?");
            params.add(routeId);
        }
        if (departureDate != null && !departureDate.isEmpty()) {
            sql.append(" AND DATE(sch.departure_time) = ?");
            params.add(departureDate);
        }
        if (departureTime != null && !departureTime.isEmpty()) {
            sql.append(" AND TIME(sch.departure_time) = ?");
            params.add(departureTime);
        }
        if (departureStation != null && !departureStation.isEmpty()) {
            sql.append(" AND r.departure_station_id = ?");
            params.add(departureStation);
        }
        if (arrivalStation != null && !arrivalStation.isEmpty()) {
            sql.append(" AND r.arrival_station_id = ?");
            params.add(arrivalStation);
        }
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Train train = new Train();
                    train.setTrainId(rs.getInt("train_id"));
                    train.setName(rs.getString("name"));
                    train.setType(rs.getString("type"));
                    trains.add(train);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return trains;
    }
    public List<java.util.Map<String, String>> getPublicTrainSchedules() {
        List<java.util.Map<String, String>> trains = new ArrayList<>();
        String sql = "SELECT t.train_id, t.name AS train_name, t.type, r.route_id, s1.name AS departure_station, s2.name AS arrival_station, sch.departure_time, sch.arrival_time " +
            "FROM train t " +
            "JOIN route r ON t.train_id = r.train_id " +
            "JOIN station s1 ON r.departure_station_id = s1.station_id " +
            "JOIN station s2 ON r.arrival_station_id = s2.station_id " +
            "JOIN schedule sch ON r.route_id = sch.route_id ";
        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                java.util.Map<String, String> row = new java.util.HashMap<>();
                row.put("train_id", rs.getString("train_id"));
                row.put("train_name", rs.getString("train_name"));
                row.put("type", rs.getString("type"));
                row.put("route_id", rs.getString("route_id"));
                row.put("departure_station", rs.getString("departure_station"));
                row.put("arrival_station", rs.getString("arrival_station"));
                row.put("departure_time", rs.getString("departure_time"));
                row.put("arrival_time", rs.getString("arrival_time"));
                trains.add(row);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return trains;
    }
    // Chức năng searchTrains không còn phù hợp với bảng mới, chỉ giữ lại getAllTrains, getTrainById, addTrain, updateTrain, deleteTrain
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/train_schedule_db";
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
        String sql = "SELECT * FROM Train";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Train train = new Train();
                train.setTrainId(rs.getInt("train_id"));
                train.setName(rs.getString("name"));
                train.setType(rs.getString("type"));
                trains.add(train);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }

    public Train getTrainById(String trainId) {
        String sql = "SELECT * FROM Train WHERE train_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(trainId));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Train train = new Train();
                    train.setTrainId(rs.getInt("train_id"));
                    train.setName(rs.getString("name"));
                    train.setType(rs.getString("type"));
                    return train;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addTrain(Train train) {
        String sql = "INSERT INTO Train (name, type) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, train.getName());
            ps.setString(2, train.getType());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateTrain(Train train) {
        String sql = "UPDATE Train SET name=?, type=? WHERE train_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, train.getName());
            ps.setString(2, train.getType());
            ps.setInt(3, train.getTrainId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTrain(String trainId) {
        String sql = "DELETE FROM Train WHERE train_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(trainId));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
