package com.railway.TicketManagement.service;

import com.railway.TicketManagement.entities.Station;
import com.railway.TicketManagement.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StationServiceImpl implements StationService {
    @Autowired
    private StationRepository stationDAO;

    @Override
    public List<Station> getAllStations() {
        return stationDAO.findAll();
    }
}
