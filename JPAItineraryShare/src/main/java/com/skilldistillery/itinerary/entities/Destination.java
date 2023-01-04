package com.skilldistillery.itinerary.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private String image;
	private String country;
	private String city;
	@OneToMany(mappedBy="destination")
	private List<DestinationComment> comments;
	@OneToMany(mappedBy="destination")
	private List<DestinationRating> ratings;
	@OneToMany(mappedBy="destination")
	private List<ItineraryItem> itineraryItems;
	
	
	public Destination () {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<DestinationComment> getComments() {
		return comments;
	}

	public void setComments(List<DestinationComment> comments) {
		this.comments = comments;
	}

	public List<DestinationRating> getRatings() {
		return ratings;
	}

	public void setRatings(List<DestinationRating> ratings) {
		this.ratings = ratings;
	}

	public List<ItineraryItem> getItineraryItems() {
		return itineraryItems;
	}

	public void setItineraryItems(List<ItineraryItem> itineraryItems) {
		this.itineraryItems = itineraryItems;
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
		Destination other = (Destination) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Destination [id=" + id + ", name=" + name + ", description=" + description + ", image=" + image
				+ ", country=" + country + ", city=" + city + "]";
	}
	
	
}
