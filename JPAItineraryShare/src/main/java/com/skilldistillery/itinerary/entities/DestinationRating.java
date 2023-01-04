package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="destination_rating")
@Entity
public class DestinationRating {

	private int rating;
	
	@Column(name="rating_comment")
	private String ratingComment;
	
	@Id
	private int destinationId;
	
	@Column(name="user_id")
	private int userId;

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

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "DestinationRating [rating=" + rating + ", ratingComment=" + ratingComment + ", destinationId="
				+ destinationId + ", userId=" + userId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(destinationId, rating, ratingComment, userId);
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
		return destinationId == other.destinationId && rating == other.rating
				&& Objects.equals(ratingComment, other.ratingComment) && userId == other.userId;
	}
}
