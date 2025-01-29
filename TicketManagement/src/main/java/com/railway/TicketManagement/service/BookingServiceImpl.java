package com.railway.TicketManagement.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.railway.TicketManagement.dto.BookingDTO;
import com.railway.TicketManagement.entities.Booking;
import com.railway.TicketManagement.entities.Ticket;
import com.railway.TicketManagement.entities.Payment;
import com.railway.TicketManagement.repository.BookingDAO;
import com.railway.TicketManagement.repository.PaymentDAO;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingDAO bookingDao;

    @Autowired
    private PaymentDAO paymentDao;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public BookingDTO addNewBooking(BookingDTO bookingDTO) {
        Booking bookingEntity = modelMapper.map(bookingDTO, Booking.class);

        // Convert TicketDTO to TicketEntity and associate with booking
        Set<Ticket> tickets = bookingDTO.getTickets().stream().map(ticketDTO -> {
            Ticket ticketEntity = modelMapper.map(ticketDTO, Ticket.class);
            ticketEntity.setBooking(bookingEntity);
            return ticketEntity;
        }).collect(Collectors.toSet());

        bookingEntity.setTickets((List<Ticket>) tickets);

        // Save booking
        Booking savedBooking = bookingDao.save(bookingEntity);

        Payment payment = Payment.builder()
                .booking(savedBooking)              // Associate with saved booking
                .date(new Date())                   // Set payment date to current date
                .amount(bookingDTO.getTotalAmount()) // Use amount from BookingDTO
                .paymentMethod(Payment.PaymentMethod.Card) // Default Payment Method (can be dynamic)
                .paymentStatus(Payment.PaymentStatus.success) // Default Payment Status
                .build();

        paymentDao.save(payment);

        return modelMapper.map(savedBooking, BookingDTO.class);
    }

    @Override
    public List<BookingDTO> showAllBookings() {
        List<Booking> bookings = bookingDao.findAll();
        return bookings.stream()
                .map(booking -> modelMapper.map(booking, BookingDTO.class))
                .collect(Collectors.toList());
    }
}
