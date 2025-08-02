package com.baodientu.model.bo;

import com.baodientu.model.bean.Station;
import com.baodientu.model.dao.StationDAO;
import java.util.List;

public class StationBO {
    private StationDAO stationDAO = new StationDAO();

    public List<Station> getAllStations() {
        return stationDAO.getAllStations();
    }

    public Station getStationById(String stationId) {
        return stationDAO.getStationById(stationId);
    }

    public boolean addStation(Station station) {
        return stationDAO.addStation(station);
    }

    public boolean updateStation(Station station) {
        return stationDAO.updateStation(station);
    }

    public boolean deleteStation(String stationId) {
        return stationDAO.deleteStation(stationId);
    }
}
