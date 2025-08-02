package com.baodientu.model.bean;

public class Train {
    private String trainId;
    private String trainType;
    private String departureTime;
    private String arrivalTime;
    private int carriageCount;
    private String routeId;
    private String departureStation;
    private String arrivalStation;

    public Train() {}

    public Train(String trainId, String trainType, String departureTime, String arrivalTime, int carriageCount, String routeId, String departureStation, String arrivalStation) {
        this.trainId = trainId;
        this.trainType = trainType;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.carriageCount = carriageCount;
        this.routeId = routeId;
        this.departureStation = departureStation;
        this.arrivalStation = arrivalStation;
    }

    public String getTrainId() { return trainId; }
    public void setTrainId(String trainId) { this.trainId = trainId; }
    public String getTrainType() { return trainType; }
    public void setTrainType(String trainType) { this.trainType = trainType; }
    public String getDepartureTime() { return departureTime; }
    public void setDepartureTime(String departureTime) { this.departureTime = departureTime; }
    public String getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(String arrivalTime) { this.arrivalTime = arrivalTime; }
    public int getCarriageCount() { return carriageCount; }
    public void setCarriageCount(int carriageCount) { this.carriageCount = carriageCount; }
    public String getRouteId() { return routeId; }
    public void setRouteId(String routeId) { this.routeId = routeId; }
    public String getDepartureStation() { return departureStation; }
    public void setDepartureStation(String departureStation) { this.departureStation = departureStation; }
    public String getArrivalStation() { return arrivalStation; }
    public void setArrivalStation(String arrivalStation) { this.arrivalStation = arrivalStation; }
}
