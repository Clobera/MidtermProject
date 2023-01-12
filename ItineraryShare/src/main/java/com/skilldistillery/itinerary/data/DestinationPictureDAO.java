package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.DestinationPicture;

public interface DestinationPictureDAO {

	DestinationPicture findDestinationPictureById(int id);

	DestinationPicture addDestinationPicture(DestinationPicture destinationPicture);

	DestinationPicture deleteDestinationPicture(int destinationPictureId);

	List<DestinationPicture> findDestinationPicturesByItemId(int itemId);
	
	
}
