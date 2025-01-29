package com.railway.TicketManagement.dto;

import java.sql.Time;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TrainSearchDTO {
    private String trainNumber;
    private String trainName;
    private Double totalDistance;
    private Double farePrice;
    private Time departureTimeFromSource;
    private Time arrivalTimeAtDestination;
    private Integer availableSeats;
}