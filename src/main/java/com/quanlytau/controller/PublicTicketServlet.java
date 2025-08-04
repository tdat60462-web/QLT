package com.quanlytau.controller;

import com.quanlytau.model.dao.TicketDAO;
import com.quanlytau.model.bean.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/public/ticket")
public class PublicTicketServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TicketDAO ticketDAO = new TicketDAO();
        List<Ticket> tickets = ticketDAO.getAllTickets();
        request.setAttribute("tickets", tickets);
        request.getRequestDispatcher("/views/public/ticket.jsp").forward(request, response);
    }
}
