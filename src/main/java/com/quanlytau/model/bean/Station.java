package com.quanlytau.model.bean;

public class Station {
    private String stationId;
    private String name;
    private String address;

    public Station() {}

    public Station(String stationId, String name, String address) {
        this.stationId = stationId;
        this.name = name;
        this.address = address;
    }

    public String getStationId() { return stationId; }
    public void setStationId(String stationId) { this.stationId = stationId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}
