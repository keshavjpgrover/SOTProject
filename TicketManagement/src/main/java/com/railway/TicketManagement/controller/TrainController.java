package com.railway.TicketManagement.controller;

import com.railway.TicketManagement.dto.AddTrainDTO;
import com.railway.TicketManagement.dto.TrainSearchDTO;
import com.railway.TicketManagement.entities.Trains;
import com.railway.TicketManagement.service.TrainService;

import jakarta.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
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

    @GetMapping("/search")
    public List<TrainSearchDTO> findTrains(@RequestParam("source") String src,
                                           @RequestParam("destination") String des,
                                           @RequestParam("date")  Date dateOfJourney) {

        return trainService.getTrainsBySrcDestDate(src, des, dateOfJourney);
    }
    
	@PostMapping("/addTrain")
	public Trains addTrain(@Valid @RequestBody AddTrainDTO train) {
		return trainService.addTrain(train);
	}

	@PutMapping("/remove/{trainNumber}")
	public void removeTrain(@PathVariable String trainNumber) {
		trainService.removeTrain(trainNumber);
	}

}
