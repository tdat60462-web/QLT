package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Passenger;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassengerDAO {
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "username", "password");
    }

    public List<Passenger> getAllPassengers() {
        List<Passenger> passengers = new ArrayList<>();
        String sql = "SELECT * FROM Passenger";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Passenger p = new Passenger();
                p.setPassengerId(rs.getInt("passenger_id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                passengers.add(p);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return passengers;
    }

    public Passenger getPassengerById(int passengerId) {
        String sql = "SELECT * FROM Passenger WHERE passenger_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, passengerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Passenger p = new Passenger();
                    p.setPassengerId(rs.getInt("passenger_id"));
                    p.setName(rs.getString("name"));
                    p.setEmail(rs.getString("email"));
                    p.setPhone(rs.getString("phone"));
                    return p;
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean addPassenger(Passenger p) {
        String sql = "INSERT INTO Passenger (name, email, phone) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPhone());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean updatePassenger(Passenger p) {
        String sql = "UPDATE Passenger SET name=?, email=?, phone=? WHERE passenger_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPhone());
            ps.setInt(4, p.getPassengerId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean deletePassenger(int passengerId) {
        String sql = "DELETE FROM Passenger WHERE passenger_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, passengerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
