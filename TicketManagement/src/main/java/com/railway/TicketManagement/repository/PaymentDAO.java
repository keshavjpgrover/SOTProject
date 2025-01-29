package com.railway.TicketManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.railway.TicketManagement.entities.Payment;

public interface PaymentDAO extends JpaRepository<Payment, Long> {
}
