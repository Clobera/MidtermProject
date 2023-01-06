package com.skilldistillery.itinerary.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.itinerary.data.DestinationDAO;
import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class DestinationController {

	@Autowired
	private ItineraryDAO itineraryDao;
	
	@Autowired
	private DestinationDAO destinationDao;

	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}

	@GetMapping(path = "goCreateDestination.do")
	public String goCreateDestination(Model model, Integer itineraryId, @ModelAttribute("loggedInUser") User user) {
		String view = "createDestination";
		if (user.getId() == 0) {
			view = "home";
			List<Itinerary> itineraries = itineraryDao.findAllActiveItineraries();
			model.addAttribute("itineraries", itineraries);
		} else {
			model.addAttribute("itineraryId", itineraryId);
		}
		return view;
	}

	@PostMapping(path = "createDestination.do")
	public String createdDestination(Model model, Integer itineraryId, Destination destination, RedirectAttributes redir) {
		destinationDao.createDestination(destination);
		String view = "redirect:viewItinerary.do";
		if(itineraryId == null) {
			view = "home";
			List<Itinerary> itineraries = itineraryDao.findAllActiveItineraries();
			model.addAttribute("itineraries", itineraries);
		}else {
			redir.addFlashAttribute("id", itineraryId);
		}
		return view;
	}

}
