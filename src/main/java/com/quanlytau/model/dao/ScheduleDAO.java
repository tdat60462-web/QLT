package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Schedule;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//import java.time.LocalDateTime;

public class ScheduleDAO {
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
    }

    public List<Schedule> getAllSchedules() {
        List<Schedule> schedules = new ArrayList<>();
        String sql = "SELECT sch.schedule_id, sch.route_id, sch.departure_time, sch.arrival_time, sch.available_seats, " +
                "t.name AS train_name, s1.name AS departure_station, s2.name AS arrival_station " +
                "FROM schedule sch " +
                "JOIN route r ON sch.route_id = r.route_id " +
                "JOIN train t ON r.train_id = t.train_id " +
                "JOIN station s1 ON r.departure_station_id = s1.station_id " +
                "JOIN station s2 ON r.arrival_station_id = s2.station_id";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setScheduleId(rs.getInt("schedule_id"));
                s.setRouteId(rs.getInt("route_id"));
                s.setDepartureTime(rs.getTimestamp("departure_time").toLocalDateTime());
                s.setArrivalTime(rs.getTimestamp("arrival_time").toLocalDateTime());
                s.setAvailableSeats(rs.getInt("available_seats"));
                s.setTrainName(rs.getString("train_name"));
                s.setDepartureStation(rs.getString("departure_station"));
                s.setArrivalStation(rs.getString("arrival_station"));
                schedules.add(s);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return schedules;
    }

    public Schedule getScheduleById(int scheduleId) {
        String sql = "SELECT * FROM schedule WHERE schedule_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, scheduleId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Schedule s = new Schedule();
                    s.setScheduleId(rs.getInt("schedule_id"));
                    s.setRouteId(rs.getInt("route_id"));
                    s.setDepartureTime(rs.getTimestamp("departure_time").toLocalDateTime());
                    s.setArrivalTime(rs.getTimestamp("arrival_time").toLocalDateTime());
                    s.setAvailableSeats(rs.getInt("available_seats"));
                    return s;
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean addSchedule(Schedule s) {
        String sql = "INSERT INTO schedule (route_id, departure_time, arrival_time, available_seats) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, s.getRouteId());
            ps.setTimestamp(2, Timestamp.valueOf(s.getDepartureTime()));
            ps.setTimestamp(3, Timestamp.valueOf(s.getArrivalTime()));
            ps.setInt(4, s.getAvailableSeats());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean updateSchedule(Schedule s) {
        String sql = "UPDATE schedule SET route_id=?, departure_time=?, arrival_time=?, available_seats=? WHERE schedule_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, s.getRouteId());
            ps.setTimestamp(2, Timestamp.valueOf(s.getDepartureTime()));
            ps.setTimestamp(3, Timestamp.valueOf(s.getArrivalTime()));
            ps.setInt(4, s.getAvailableSeats());
            ps.setInt(5, s.getScheduleId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean deleteSchedule(int scheduleId) {
        String sql = "DELETE FROM schedule WHERE schedule_id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, scheduleId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
