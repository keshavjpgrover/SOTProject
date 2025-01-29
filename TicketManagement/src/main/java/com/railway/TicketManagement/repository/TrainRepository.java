package com.railway.TicketManagement.repository;

import com.railway.TicketManagement.dto.TrainSearchDTO;
import com.railway.TicketManagement.entities.Trains;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface TrainRepository extends JpaRepository<Trains,String> {
    @Query(name = Trains.Search_Trains)
    List<TrainSearchDTO> searchTrains(  @Param("source") String src, 
                                        @Param("destination") String dest, 
                                        @Param("dateOfJourney") Date dateOfJourney);

}
