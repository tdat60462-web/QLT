package com.quanlytau.model.bean;

import java.time.LocalDateTime;

public class Schedule {
    // Setter cho departureTime nhận LocalDateTime (dùng cho DAO)
    public void setDepartureTime(LocalDateTime departureTime) {
        this.departureTime = departureTime;
    }

    // Setter cho arrivalTime nhận LocalDateTime (dùng cho DAO)
    public void setArrivalTime(LocalDateTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
    public String getDepartureTimeAsString() {
        return departureTime != null ? departureTime.toString().replace('T', ' ') : "";
    }

    public String getArrivalTimeAsString() {
        return arrivalTime != null ? arrivalTime.toString().replace('T', ' ') : "";
    }
    private int scheduleId;
    private int routeId;
    private String trainName;
    private String departureStation;
    private String arrivalStation;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private int availableSeats;

    // Getter và Setter cho scheduleId
    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    // Getter và Setter cho routeId
    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    // Getter và Setter cho trainName
    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    // Getter và Setter cho departureStation
    public String getDepartureStation() {
        return departureStation;
    }

    public void setDepartureStation(String departureStation) {
        this.departureStation = departureStation;
    }

    // Getter và Setter cho arrivalStation
    public String getArrivalStation() {
        return arrivalStation;
    }

    public void setArrivalStation(String arrivalStation) {
        this.arrivalStation = arrivalStation;
    }

    // Getter cho departureTime
    public LocalDateTime getDepartureTime() {
        return departureTime;
    }

    // Setter cho departureTime (nhận String từ JSP)
    public void setDepartureTime(String departureTime) {
        if (departureTime != null) {
            this.departureTime = LocalDateTime.parse(departureTime.replace(' ', 'T'));
        }
    }

    // Getter cho arrivalTime
    public LocalDateTime getArrivalTime() {
        return arrivalTime;
    }

    // Setter cho arrivalTime (nhận String từ JSP)
    public void setArrivalTime(String arrivalTime) {
        if (arrivalTime != null) {
            this.arrivalTime = LocalDateTime.parse(arrivalTime.replace(' ', 'T'));
        }
    }

    // Getter và Setter cho availableSeats
    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }
}
