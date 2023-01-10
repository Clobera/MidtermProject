package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

public interface ItineraryDAO {
	Itinerary createItinerary(User user, Itinerary inputs);
	List<Itinerary> findAllActiveItineraries();
	List<Itinerary> findUserItineraries(User user);
	Itinerary findItinerary(int id);
	boolean deleteItinerary(int id);
	Itinerary updateItinerary(Itinerary input, int id);
	List<Itinerary> findItinerariesByKeyword(String search);
	List<Itinerary> findAllInactiveItineraries();
}
