package com.quanlytau.model.bean;

import java.sql.Time;

public class Route {
    private int routeId;
    private int trainId;
    private int departureStationId;
    private int arrivalStationId;
    private Time duration;

    public int getRouteId() { return routeId; }
    public void setRouteId(int routeId) { this.routeId = routeId; }
    public int getTrainId() { return trainId; }
    public void setTrainId(int trainId) { this.trainId = trainId; }
    public int getDepartureStationId() { return departureStationId; }
    public void setDepartureStationId(int departureStationId) { this.departureStationId = departureStationId; }
    public int getArrivalStationId() { return arrivalStationId; }
    public void setArrivalStationId(int arrivalStationId) { this.arrivalStationId = arrivalStationId; }
    public Time getDuration() { return duration; }
    public void setDuration(Time duration) { this.duration = duration; }
}
