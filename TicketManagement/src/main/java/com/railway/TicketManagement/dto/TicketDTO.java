package com.railway.TicketManagement.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TicketDTO {
    private Long ticketID;
    private Long bookingID;
    private String seatNumber;
    private Long startStationId;
    private Long endStationId;
    private Boolean ticketConfirmation;
}
