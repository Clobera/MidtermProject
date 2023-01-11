package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.DestinationRating;

public interface DestinationRatingDAO {

	DestinationRating createDestinationRating(int rating, int userId, int destinationId);

	List<DestinationRating> findDestinationRatingsById(int destinationId);

	DestinationRating createDestinationRating(int rating, int userId, int destinationId, String reviewComment);

	DestinationRating findDestinationRatingByUserAndDestination(int userId, int destinationId);

	DestinationRating updateDestinationRating(int rating, int userId, int destinationId);

	DestinationRating updateDestinationRating(int rating, int userId, int destinationId, String reviewComment);

}
