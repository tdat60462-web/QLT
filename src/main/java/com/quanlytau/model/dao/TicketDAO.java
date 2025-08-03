package com.quanlytau.model.dao;

import com.quanlytau.model.bean.Ticket;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO {
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/train_schedule_db", "root", "");
    }

    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT tk.ticket_id, tk.schedule_id, tk.passenger_id, tk.seat_number, tk.booking_time, tk.price, sch.departure_time, sch.arrival_time, p.name AS passenger_name " +
                     "FROM ticket tk " +
                     "JOIN schedule sch ON tk.schedule_id = sch.schedule_id " +
                     "JOIN passenger p ON tk.passenger_id = p.passenger_id";
        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Ticket tk = new Ticket();
                tk.setTicketId(rs.getInt("ticket_id"));
                tk.setScheduleId(rs.getInt("schedule_id"));
                tk.setPassengerId(rs.getInt("passenger_id"));
                tk.setSeatNumber(rs.getString("seat_number"));
                tk.setBookingTime(rs.getTimestamp("booking_time"));
                tk.setPrice(rs.getDouble("price"));
                tk.setDepartureTime(rs.getString("departure_time"));
                tk.setArrivalTime(rs.getString("arrival_time"));
                tk.setPassengerName(rs.getString("passenger_name"));
                tickets.add(tk);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return tickets;
    }
}