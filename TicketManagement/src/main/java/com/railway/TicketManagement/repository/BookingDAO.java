package com.railway.TicketManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.railway.TicketManagement.entities.Booking;

import java.util.List;

public interface BookingDAO extends JpaRepository<Booking, Long> {
    List<Booking> findByUser_UserId(Long userId);
}
