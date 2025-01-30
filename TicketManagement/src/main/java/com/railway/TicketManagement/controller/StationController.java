package com.railway.TicketManagement.controller;

import com.railway.TicketManagement.entities.Station;
import com.railway.TicketManagement.service.StationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/stations")
public class StationController {
    @Autowired
    private StationService stationService;


    public StationController(StationService stationService) {
        this.stationService = stationService;
    }

    @GetMapping("")
    public List<Station> getAllStations() {
        return stationService.getAllStations();
    }


}
