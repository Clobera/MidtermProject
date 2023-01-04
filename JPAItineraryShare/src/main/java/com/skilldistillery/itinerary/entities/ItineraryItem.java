package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="itinerary_item")
public class ItineraryItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="itinerary_id")
	private Itinerary itinerary;
	
	@Column(name="trip_day")
	private Integer tripDay;
	
	@ManyToOne
	@JoinColumn(name="destination_id")
	private Destination destination;
	
	private String description;
	
	public ItineraryItem () {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Itinerary getItinerary() {
		return itinerary;
	}

	public void setItinerary(Itinerary itinerary) {
		this.itinerary = itinerary;
	}

	public Integer getTripDay() {
		return tripDay;
	}

	public void setTripDay(Integer tripDay) {
		this.tripDay = tripDay;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItineraryItem other = (ItineraryItem) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ItineraryItem [id=" + id + ", tripDay=" + tripDay + ", destination=" + destination + ", description="
				+ description + "]";
	}
	
	
}
