package com.quanlytau.model.bo;

import com.quanlytau.model.bean.Schedule;
import com.quanlytau.model.dao.ScheduleDAO;
import java.util.List;

public class ScheduleBO {
    private ScheduleDAO scheduleDAO = new ScheduleDAO();

    public List<Schedule> getAllSchedules() {
        return scheduleDAO.getAllSchedules();
    }

    public Schedule getScheduleById(int scheduleId) {
        return scheduleDAO.getScheduleById(scheduleId);
    }

    public boolean addSchedule(Schedule s) {
        return scheduleDAO.addSchedule(s);
    }

    public boolean updateSchedule(Schedule s) {
        return scheduleDAO.updateSchedule(s);
    }

    public boolean deleteSchedule(int scheduleId) {
        return scheduleDAO.deleteSchedule(scheduleId);
    }
}
