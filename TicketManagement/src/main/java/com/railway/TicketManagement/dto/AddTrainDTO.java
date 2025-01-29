package com.railway.TicketManagement.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddTrainDTO {
    private String trainNumber;
    private String trainName;   
    private String number_of_seats;
    private String type;
}
