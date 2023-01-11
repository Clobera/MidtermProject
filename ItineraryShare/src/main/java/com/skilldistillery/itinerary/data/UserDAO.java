package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.User;

public interface UserDAO {

		User findById(int userId);
		User findByUsernameAndPassword(String username, String password);
		User addUser(User input);
		User updateUser(User user, int id);
		User deleteAccount(int id);
		List<User> findAllActiveUsers();
		List<User> findAllDisabledUsers();
		List<User> findUsersByKeyword(String search);
}
