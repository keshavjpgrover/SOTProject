package com.railway.TicketManagement.repository;

import com.railway.TicketManagement.entities.Trains;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrainRepository extends JpaRepository<Trains,String> {
}
