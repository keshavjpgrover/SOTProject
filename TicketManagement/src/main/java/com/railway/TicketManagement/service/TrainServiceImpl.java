package com.railway.TicketManagement.service;

import com.railway.TicketManagement.dto.AddTrainDTO;
import com.railway.TicketManagement.dto.TrainSearchDTO;
import com.railway.TicketManagement.entities.Trains;
import com.railway.TicketManagement.repository.TrainRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainRepository trainDao;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<Trains> getAllTrains() {
        return trainDao.findAll();
    }

    @Override
    public List<TrainSearchDTO> getTrainsBySrcDestDate(String src, String dest, Date dateOfJourney) {
        List<TrainSearchDTO> searchedTrains = trainDao.searchTrains(src, dest, dateOfJourney);
        return searchedTrains;
    }

    @Override
    public Trains addTrain(AddTrainDTO trainDTO) {
        Trains trainEntity = new Trains();
        trainEntity.setTrainNumber(trainDTO.getTrainNumber());
        trainEntity.setTrainName(trainDTO.getTrainName());
        trainEntity.setNumberOfSeats(Integer.parseInt(trainDTO.getNumber_of_seats()));
        trainEntity.setType(Trains.Type.valueOf(trainDTO.getType()));

        return trainDao.save(trainEntity);
    }

    @Override
    public void removeTrain(String trainNumber) {
        Optional<Trains> trainEntity = trainDao.findById(trainNumber);
        if(trainEntity.isPresent()) {
            trainDao.delete(trainEntity.get());
        }
        else{
            //throw new ResourceNotFoundException("Train not found");
        }
    } 
}
