package com.railway.TicketManagement.controller;

import com.railway.TicketManagement.entities.Trains;
import com.railway.TicketManagement.service.TrainService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

//    @CrossOrigin(origins = "*")
//    @GetMapping("/search")
//    public List<TrainDTO> viewTrainsBySrcAndDes(@RequestParam("source") String src,
//                                                      @RequestParam("destination") String des,
//                                                      @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate dateOfJourney) {
//
//        return trainService.getTrainsBySrcDescDate(src, des, dateOfJourney);
//    }
//
//    // Admin can add trains
//    @PostMapping("/add")
//    // @PreAuthorize("hasRole('ADMIN')")
//    public AddTrainDTO addTrain(@Valid @RequestBody AddTrainDTO trainDTO) {
//        return trainService.addTrain(trainDTO);
//    }
//
//    // Admin can remove trains (make them inactive)
//    @PutMapping("/remove/{trainNumber}")
//    // @PreAuthorize("hasRole('ADMIN')")
//    @CrossOrigin(origins = "*")
//    public void removeTrain(@PathVariable long trainNumber) {
//        trainService.removeTrain(trainNumber);
//    }
//
//    @PutMapping("/activate/{trainNumber}")
//    @CrossOrigin(origins = "*")
//    public void activateTrain(@PathVariable long trainNumber) {
//        trainService.activateTrain(trainNumber);
//    }

}
