package com.quanlytau.model.bo;

import com.quanlytau.model.bean.Passenger;
import com.quanlytau.model.dao.PassengerDAO;
import java.util.List;

public class PassengerBO {
    private PassengerDAO passengerDAO = new PassengerDAO();

    public List<Passenger> getAllPassengers() {
        return passengerDAO.getAllPassengers();
    }

    public Passenger getPassengerById(int passengerId) {
        return passengerDAO.getPassengerById(passengerId);
    }

    public boolean addPassenger(Passenger p) {
        return passengerDAO.addPassenger(p);
    }

    public boolean updatePassenger(Passenger p) {
        return passengerDAO.updatePassenger(p);
    }

    public boolean deletePassenger(int passengerId) {
        return passengerDAO.deletePassenger(passengerId);
    }
}
