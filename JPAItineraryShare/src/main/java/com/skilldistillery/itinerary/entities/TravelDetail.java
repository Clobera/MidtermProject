package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="travel_detail")
public class TravelDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="itinerary_item_id")
	private ItineraryItem itineraryItem;
	
	@ManyToOne
	@JoinColumn(name="travel_detail_type_id")
	private TravelDetailType travelDetailType;
	
	public TravelDetail () {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ItineraryItem getItineraryItem() {
		return itineraryItem;
	}

	public void setItineraryItem(ItineraryItem itineraryItem) {
		this.itineraryItem = itineraryItem;
	}

	public TravelDetailType getTravelDetailType() {
		return travelDetailType;
	}

	public void setTravelDetailType(TravelDetailType travelDetailType) {
		this.travelDetailType = travelDetailType;
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
		TravelDetail other = (TravelDetail) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "TravelDetail [id=" + id + ", description=" + description + ", travelDetailType=" + travelDetailType
				+ "]";
	}
	
	
}
