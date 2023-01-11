package com.skilldistillery.itinerary.data;

import com.skilldistillery.itinerary.entities.TripPicture;

public interface TripPictureDAO {

	TripPicture findTripPictureById(int id);

	TripPicture AddTripPicture(TripPicture tripPicture);

	boolean DeleteTripPicture(int tripPictureId);
	
	
}
