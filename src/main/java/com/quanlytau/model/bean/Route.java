package com.quanlytau.model.bean;

public class Route {
    private int routeId;
    private int trainId;
    private int departureStationId;
    private int arrivalStationId;
    private String duration;

    public Route() {}

    public Route(int routeId, int trainId, int departureStationId, int arrivalStationId, String duration) {
        this.routeId = routeId;
        this.trainId = trainId;
        this.departureStationId = departureStationId;
        this.arrivalStationId = arrivalStationId;
        this.duration = duration;
    }

    public int getRouteId() { return routeId; }
    public void setRouteId(int routeId) { this.routeId = routeId; }
    public int getTrainId() { return trainId; }
    public void setTrainId(int trainId) { this.trainId = trainId; }
    public int getDepartureStationId() { return departureStationId; }
    public void setDepartureStationId(int departureStationId) { this.departureStationId = departureStationId; }
    public int getArrivalStationId() { return arrivalStationId; }
    public void setArrivalStationId(int arrivalStationId) { this.arrivalStationId = arrivalStationId; }
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
}
