package quanlytau.model.bo;

import quanlytau.model.bean.Train;
import quanlytau.model.dao.TrainDAO;
import java.util.List;

public class TrainBO {
    private TrainDAO trainDAO = new TrainDAO();

    public List<Train> searchTrains(String routeId, String departureDate, String departureTime, String departureStation, String arrivalStation) {
        return trainDAO.searchTrains(routeId, departureDate, departureTime, departureStation, arrivalStation);
    }

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
