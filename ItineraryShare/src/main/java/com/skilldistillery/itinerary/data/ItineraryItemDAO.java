package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;

public interface ItineraryItemDAO {
	ItineraryItem createItineraryItem(Itinerary itinerary, Destination destination, ItineraryItem itineraryItem);
	ItineraryItem findItineraryItemById (int id);
	List<ItineraryItem> findItineraryItemByItinerary(Itinerary itinerary);
	List<ItineraryItem> findItineraryItemByDay(int day, Itinerary itinerary);
	List<ItineraryItem> findOrderedItineraryItemByItinerary(Itinerary itinerary);
	ItineraryItem removeItineraryItem(int itemId);
}
