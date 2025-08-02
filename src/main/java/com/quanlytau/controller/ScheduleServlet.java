package com.quanlytau.controller;

import com.quanlytau.model.bean.Schedule;
import com.quanlytau.model.bo.ScheduleBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/schedule")
public class ScheduleServlet extends HttpServlet {
    private ScheduleBO scheduleBO = new ScheduleBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        if (action.equals("list")) {
            List<Schedule> schedules = scheduleBO.getAllSchedules();
            request.setAttribute("schedules", schedules);
            request.getRequestDispatcher("/views/schedule/list.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            int scheduleId = Integer.parseInt(request.getParameter("id"));
            Schedule schedule = scheduleBO.getScheduleById(scheduleId);
            request.setAttribute("schedule", schedule);
            request.getRequestDispatcher("/views/schedule/detail.jsp").forward(request, response);
        }
        // Thêm các action thêm/sửa/xóa nếu cần
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý thêm/sửa/xóa schedule
        // Ví dụ: lấy dữ liệu từ form, gọi scheduleBO.addSchedule/updateSchedule/deleteSchedule
    }
}
