package com.skilldistillery.itinerary.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class ItineraryItemController {

	@Autowired
	private ItineraryItemDAO itineraryItemDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}
	
	@PostMapping(path = "goCreateItineraryItem.do")
	public String goCreateItinerary(Model model, @ModelAttribute("loggedInUser") User user) {
		String destination = "createItineraryItem";
		if (user.getId() == 0) {
			destination = "home";
			ItineraryItem itineraryItem = itineraryItemDao.createItineraryItem();
			model.addAttribute("itineraryItem", itineraryItem);
		}
		return destination;
	}
}
