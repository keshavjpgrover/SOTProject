package com.railway.TicketManagement.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Trains {
    @Id
    @Column(name = "train_number", length = 10)
    private String trainNumber;

    @Column(name = "train_name")
    private String trainName;

    @Column(name = "number_of_seats")
    private Integer numberOfSeats;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private Type type;

    public enum Type {
        local, express
    }

    @OneToMany(mappedBy = "train", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
     private List<Schedule> schedules;

    @OneToMany(mappedBy = "train", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Booking> bookings;

}