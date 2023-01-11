package com.skilldistillery.itinerary.controllers;

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
import com.skilldistillery.itinerary.data.DestinationRatingDAO;
import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.DestinationComment;
import com.skilldistillery.itinerary.entities.DestinationRating;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class DestinationController {

	@Autowired
	private ItineraryDAO itineraryDao;
	
	@Autowired
	private DestinationDAO destinationDao;
	
	@Autowired
	private DestinationCommentDAO destinationCommentDao;
	
	@Autowired
	private DestinationRatingDAO destinationRatingDao;

	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}

	@PostMapping(path = "goCreateDestination.do", params= {"itineraryId"})
	public String goCreateDestination(Model model, Integer itineraryId) {
		String view = "createDestination";
		model.addAttribute("itineraryId", itineraryId);
		return view;
	}
	
	@PostMapping(path = "goCreateDestination.do")
	public String goCreateDestinationNoItinerary() {
		String view = "createDestination";
		return view;
	}

	@PostMapping(path = "createDestination.do", params= {"itineraryId", "destination"})
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
	
	@PostMapping(path = "createDestination.do")
	public String createdDestinationNoItinerary(Model model, Destination destination) {
		destinationDao.createDestination(destination);
		List<Itinerary> itineraries = itineraryDao.findAllActiveItineraries();
		model.addAttribute("itineraries", itineraries);
		return "home";
	}
	
	@GetMapping(path = "viewDestination.do", params = {"destinationId"})
	public String viewDestination(Model model, @ModelAttribute("loggedInUser") User user, Integer destinationId) {
		Destination destination = destinationDao.findDestinationById(destinationId);
		int userId = user.getId();
		
		List<DestinationRating> ratings = destinationRatingDao.findDestinationRatingsById(destinationId);
		List<DestinationComment> baseComments = new ArrayList<>();
		List<DestinationComment> replies = new ArrayList<>();
		List<DestinationComment> allComments = destinationCommentDao.findCommentsById(destinationId);
		for (DestinationComment comment : allComments) {
			if (comment.getReply() == null) {
				baseComments.add(comment);
			} else {
				replies.add(comment);
			}
		}
		model.addAttribute("destination", destination);
		model.addAttribute("comments", baseComments);
		model.addAttribute("replies", replies);
		model.addAttribute("ratings", ratings);
		return "destination";
	}
	

}
