package com.skilldistillery.itinerary.controllers;


import java.time.Period;
import java.util.ArrayList;
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
import com.skilldistillery.itinerary.data.ItineraryItemDAO;
import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class ItineraryItemController {

	@Autowired
	private ItineraryItemDAO itineraryItemDao;
	
	@Autowired
	private ItineraryDAO itineraryDao;
	
	@Autowired
	private DestinationDAO destinationDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}
	
	@GetMapping(path = "goCreateItineraryItem.do")
	public String goCreateItinerary(Model model, @ModelAttribute("loggedInUser") User user, Integer id) {
		String destination = "createItineraryItem";
		if (user.getId() == 0) {
			destination = "home";
		}
		List<Destination> destinations = destinationDao.findAllDestinations();
		Itinerary itinerary = itineraryDao.findItinerary(id);
		List<Integer> days = new ArrayList<>();
		for (int i = 1; i <= Period.between(itinerary.getStartDate(), itinerary.getEndDate()).getDays(); i++) {
			days.add(i);
		}
		model.addAttribute("destinations", destinations);
		model.addAttribute("itinerary", id);
		model.addAttribute("days", days);
		return destination;
	}
	
	@PostMapping(path = "createItineraryItem.do")
	public String createItineraryItem(ItineraryItem itineraryItem, Integer itineraryId, Integer destinationId, RedirectAttributes redir) {
		Itinerary iteneraryCreated = itineraryDao.findItinerary(itineraryId);
		Destination destinationCreated = destinationDao.findDestinationById(destinationId);
		ItineraryItem newItineraryItem = itineraryItemDao.createItineraryItem(iteneraryCreated, destinationCreated, itineraryItem);
		redir.addFlashAttribute("id", iteneraryCreated.getId());
		return "redirect:viewItinerary.do";
	}
}
