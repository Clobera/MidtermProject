package com.skilldistillery.itinerary.data;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;

public interface ItineraryItemDAO {
	ItineraryItem createItineraryItem(Itinerary itinerary, Destination destination, ItineraryItem itineraryItem);
	ItineraryItem findItineraryItemById (int id);
}
