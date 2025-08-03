package com.quanlytau.model.dao;

import java.sql.*;

public class StatsDAO {
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
    }

    public int getTotalTrains() {
        String sql = "SELECT COUNT(*) FROM train";
        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    // Add more stats methods as needed
}
