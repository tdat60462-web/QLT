package quanlytau.controller;

import quanlytau.model.bean.Train;
import quanlytau.model.bo.TrainBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class TrainSearchServlet extends HttpServlet {
    private TrainBO trainBO = new TrainBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String routeId = request.getParameter("routeId");
        String departureDate = request.getParameter("departureDate");
        String departureTime = request.getParameter("departureTime");
        String departureStation = request.getParameter("departureStation");
        String arrivalStation = request.getParameter("arrivalStation");

        // Validate input
        if ((routeId == null || routeId.trim().isEmpty()) &&
            (departureDate == null || departureDate.trim().isEmpty()) &&
            (departureTime == null || departureTime.trim().isEmpty()) &&
            (departureStation == null || departureStation.trim().isEmpty()) &&
            (arrivalStation == null || arrivalStation.trim().isEmpty())) {
            request.setAttribute("error", "Vui lòng nhập ít nhất một tiêu chí để tra cứu!");
            request.getRequestDispatcher("/views/user/search.jsp").forward(request, response);
            return;
        }

        List<Train> trains = trainBO.searchTrains(routeId, departureDate, departureTime, departureStation, arrivalStation);
        request.setAttribute("trains", trains);
        if (trains == null || trains.isEmpty()) {
            request.setAttribute("error", "Không tìm thấy chuyến tàu phù hợp!");
        } else {
            request.setAttribute("message", "Tìm thấy " + trains.size() + " chuyến tàu.");
        }
        request.getRequestDispatcher("/views/user/search.jsp").forward(request, response);
    }
}
