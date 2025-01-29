package com.railway.TicketManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.railway.TicketManagement.dto.BookingDTO;
import com.railway.TicketManagement.service.BookingService;

import java.util.List;

@RestController
@RequestMapping("/bookings")
@CrossOrigin
@Validated
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/allbookings")
    public ResponseEntity<List<BookingDTO>> showAllBookings() {
        return ResponseEntity.ok(bookingService.showAllBookings());
    }

    @PostMapping("/addnewbooking")
    public ResponseEntity<String> addNewBooking(@RequestBody BookingDTO bookingDTO) {
        System.out.println(bookingDTO.toString());
        bookingService.addNewBooking(bookingDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body("Booking successfully created!");
    }
}
