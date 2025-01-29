package com.railway.TicketManagement.service;

import com.railway.TicketManagement.dto.BookingDTO;

import java.util.List;

public interface BookingService {
    BookingDTO addNewBooking(BookingDTO bookingDTO);
    List<BookingDTO> showAllBookings();
}
