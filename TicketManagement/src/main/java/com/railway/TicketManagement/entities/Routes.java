package com.railway.TicketManagement.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Routes {
    @Id
    @Column(name="route_id")
    private String routeId;

    @ManyToOne
    @JoinColumn(name = "train_number")
    private Trains train;

    @ManyToOne
    @JoinColumn(name = "station_id")
    private Station station;

    @Column(name="stop_order")
    private Integer stopOrder;

    @Column(name="distance_from_start")
    private Double distanceFromStart;
}
