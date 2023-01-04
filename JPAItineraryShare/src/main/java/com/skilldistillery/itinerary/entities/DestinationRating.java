package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(DestinationRatingKey.class)
@Table(name="destination_rating")
public class DestinationRating {

	private int rating;
	
	@Column(name="rating_comment")
	private String ratingComment;
	@Id
	private User user;
	@Id
	private Destination destination;
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getRatingComment() {
		return ratingComment;
	}
	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Destination getDestination() {
		return destination;
	}
	public void setDestination(Destination destination) {
		this.destination = destination;
	}
	@Override
	public int hashCode() {
		return Objects.hash(destination, user);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DestinationRating other = (DestinationRating) obj;
		return Objects.equals(destination, other.destination) && Objects.equals(user, other.user);
	}
	@Override
	public String toString() {
		return "DestinationRating [rating=" + rating + ", ratingComment=" + ratingComment + ", user=" + user
				+ ", destination=" + destination + "]";
	}



}
