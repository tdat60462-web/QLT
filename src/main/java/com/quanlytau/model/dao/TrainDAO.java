package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Train;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainDAO {
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
