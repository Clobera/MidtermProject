package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

public interface UserDAO {

		User findById(int userId);
		User findByUsernameAndPassword(String username, String password);
		User addUser(User input);
		Itinerary createItinerary(User user, Itinerary inputs);
		List<Itinerary> findAllActiveItineraries();
}
