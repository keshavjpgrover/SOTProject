package com.railway.TicketManagement.service;

import com.railway.TicketManagement.dto.AddTrainDTO;
import com.railway.TicketManagement.dto.TrainSearchDTO;
import com.railway.TicketManagement.entities.Trains;

import jakarta.validation.Valid;

import java.util.Date;
import java.util.List;

public interface TrainService {
    List<Trains> getAllTrains();

    List<TrainSearchDTO> getTrainsBySrcDestDate(String src, String des, Date dateOfJourney);

    Trains addTrain(AddTrainDTO train);

    void removeTrain(String trainNumber);
}
