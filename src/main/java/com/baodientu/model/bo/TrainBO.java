package com.baodientu.model.bo;

import com.baodientu.model.bean.Train;
import com.baodientu.model.dao.TrainDAO;
import java.util.List;

public class TrainBO {
    private TrainDAO trainDAO = new TrainDAO();

    public List<Train> getAllTrains() {
        return trainDAO.getAllTrains();
    }

    public Train getTrainById(String trainId) {
        return trainDAO.getTrainById(trainId);
    }

    public boolean addTrain(Train train) {
        return trainDAO.addTrain(train);
    }

    public boolean updateTrain(Train train) {
        return trainDAO.updateTrain(train);
    }

    public boolean deleteTrain(String trainId) {
        return trainDAO.deleteTrain(trainId);
    }
}
