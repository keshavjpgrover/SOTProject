package com.railway.TicketManagement.controller;

import com.railway.TicketManagement.entities.Trains;
import com.railway.TicketManagement.service.TrainService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/trains")
public class TrainController {
    private final TrainService trainService;

    public TrainController(TrainService trainService) {
        this.trainService = trainService;
    }

    @GetMapping("/view")
    public List<Trains> viewTrains() {
        return trainService.getAllTrains();
    }

}
