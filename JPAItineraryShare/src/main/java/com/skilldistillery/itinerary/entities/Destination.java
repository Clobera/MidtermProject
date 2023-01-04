package com.skilldistillery.itinerary.entities;

import java.util.ArrayList;
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
	@OneToMany(mappedBy="destination")
	private List<DestinationPicture> pictures;
	
	public Destination () {}

	public void addComment(DestinationComment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(comment)) {
			comments.add(comment);
			comment.getDestination().removeComment(comment);
		}
	}

	public void removeComment(DestinationComment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
		}
	}
	
	public void addRating(DestinationRating rating) {
		if (ratings == null) {
			ratings = new ArrayList<>();
		}
		if (!ratings.contains(rating)) {
			ratings.add(rating);
			rating.getDestination().removeRating(rating);
		}
	}

	public void removeRating(DestinationRating rating) {
		if (ratings != null && ratings.contains(rating)) {
			ratings.remove(rating);
		}
	}
	
	public void addDestinationPicture(DestinationPicture destinationPicture) {
		if (pictures == null) {
			pictures = new ArrayList<>();
		}
		if (!pictures.contains(destinationPicture)) {
			pictures.add(destinationPicture);
			destinationPicture.getDestination().removeDestinationPicture(destinationPicture);
		}
	}
	
	public void removeDestinationPicture(DestinationPicture destinationPicture) {
		if (pictures != null && pictures.contains(destinationPicture)) {
			pictures.remove(destinationPicture);
		}
	}
	
	public void addItineraryItem(ItineraryItem itineraryItem) {
		if (itineraryItems == null) {
			itineraryItems = new ArrayList<>();
		}
		if (!itineraryItems.contains(itineraryItem)) {
			itineraryItems.add(itineraryItem);
			itineraryItem.getDestination().removeItineraryItem(itineraryItem);
		}
	}
	
	public void removeItineraryItem(ItineraryItem itineraryItem) {
		if (itineraryItems != null && itineraryItems.contains(itineraryItem)) {
			itineraryItems.remove(itineraryItem);
		}
	}
	
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

	public List<DestinationPicture> getPictures() {
		return pictures;
	}

	public void setPictures(List<DestinationPicture> pictures) {
		this.pictures = pictures;
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
