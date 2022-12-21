package com.skilldistillery.itinerary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.itinerary.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
}
