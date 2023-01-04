package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="destination_rating")
public class DestinationRating {

	private int rating;
	@EmbeddedId
	private DestinationRatingKey id;
	@Column(name="rating_comment")
	private String ratingComment;
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="user")
	private User user;
	@ManyToOne
	@JoinColumn(name="destination_id")
	@MapsId(value="destination")
	private Destination destination;
	
	public DestinationRating () {}
	
	public DestinationRatingKey getId() {
		return id;
	}
	
	public void setId(DestinationRatingKey id) {
		this.id = id;
	}
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
		return Objects.hash(destination, rating, ratingComment, user);
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
		return destination == other.destination && rating == other.rating
				&& Objects.equals(ratingComment, other.ratingComment) && user == other.user;
	}
	@Override
	public String toString() {
		return "DestinationRating [rating=" + rating + ", ratingComment=" + ratingComment + ", user=" + user
				+ ", destination=" + destination + "]";
	}



}
