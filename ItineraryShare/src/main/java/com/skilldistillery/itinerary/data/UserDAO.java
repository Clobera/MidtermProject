package com.skilldistillery.itinerary.data;

import com.skilldistillery.itinerary.entities.User;

public interface UserDAO {

		User findById(int userId);
		User findByUsernameAndPassword(String username, String password);
		
}
