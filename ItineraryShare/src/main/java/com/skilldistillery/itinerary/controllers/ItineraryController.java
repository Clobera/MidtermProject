package com.skilldistillery.itinerary.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	public User initSessionState() {
		return new User();
	}

	@GetMapping(path = "viewItinerary.do", params = {"id"})
	public String viewItinerary(Model model, Integer id) {
//		Integer id= (Integer) model.getAttribute("id");
		System.out.println("***********************************************************"+ id);
		Itinerary showItinerary = itineraryDao.findItinerary(id);
		model.addAttribute("itinerary", showItinerary);
		return "itinerary";
	}

	@GetMapping(path = "viewItinerary.do")
	public String viewItineraryAgain(Model model) {
		Integer id= (Integer) model.getAttribute("id");
		System.out.println("***********************************************************"+ id);
		Itinerary showItinerary = itineraryDao.findItinerary(id);
		model.addAttribute("itinerary", showItinerary);
		return "itinerary";
	}
	@GetMapping(path = "goCreateItinerary.do")
	public String goCreateItinerary(Model model, @ModelAttribute("loggedInUser") User user) {
		String destination = "createItinerary";
		if (user.getId() == 0) {
			destination = "home";
			List<Itinerary> itineraries = itineraryDao.findAllActiveItineraries();
			model.addAttribute("itineraries", itineraries);
		}
		return destination;
	}

	@PostMapping(path = "createItinerary.do")
	public String createdItinerary(Model model, Itinerary itinerary, @ModelAttribute("loggedInUser") User user) {
		itineraryDao.createItinerary(user, itinerary);
		List<Itinerary> itineraries = itineraryDao.findAllActiveItineraries();
		model.addAttribute("itineraries", itineraries);
		return "home";
	}
	
	@PostMapping(path = "deleteItinerary.do")
	public String deleteItinerary(Model model, Integer deleteId, @ModelAttribute("loggedInUser") User user) {
		itineraryDao.deleteItinerary(deleteId);
		List<Itinerary> itineraries = itineraryDao.findUserItineraries(user);
		model.addAttribute("itineraries", itineraries);
		return "profilePage";
	}
}
