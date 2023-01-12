package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.TripPicture;

public interface TripPictureDAO {

	TripPicture findTripPictureById(int id);

	TripPicture addTripPicture(TripPicture tripPicture);

	TripPicture deleteTripPicture(int tripPictureId);

	List<TripPicture> findTripPicturesByItemId(int itemId);
	
	
}
