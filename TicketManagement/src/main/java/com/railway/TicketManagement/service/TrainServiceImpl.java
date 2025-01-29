package com.railway.TicketManagement.service;

import com.railway.TicketManagement.entities.Trains;
import com.railway.TicketManagement.repository.TrainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainRepository trainDao;

    @Override
    public List<Trains> getAllTrains() {
        return trainDao.findAll();
    }
}
