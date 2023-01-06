package com.skilldistillery.itinerary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class ItineraryController {

	@Autowired
	private ItineraryDAO itineraryDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState () {
		return new User();
	}
	
	@RequestMapping(path = "goCreateItinerary.do" )
	public String goCreateItinerary(@ModelAttribute("loggedInUser") User user) {
		System.out.println(user);
		return "createItinerary";
	}
	
	@RequestMapping(path = "createItinerary.do" )
	public String createdItinerary(Itinerary itinerary, @ModelAttribute("loggedInUser") User user) {
		itineraryDao.createItinerary(user, itinerary);
		return "home";
	}
}
