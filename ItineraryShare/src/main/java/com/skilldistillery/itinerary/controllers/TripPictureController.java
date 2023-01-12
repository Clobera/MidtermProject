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

import com.skilldistillery.itinerary.data.ItineraryItemDAO;
import com.skilldistillery.itinerary.data.TripPictureDAO;
import com.skilldistillery.itinerary.entities.ItineraryItem;
import com.skilldistillery.itinerary.entities.TripPicture;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class TripPictureController {
	
	@Autowired
	private TripPictureDAO tripPictureDao;
	
	@Autowired
	private ItineraryItemDAO itineraryItemDao;

	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}
	
	@GetMapping(path="viewTripPictures.do", params={"itineraryItemId"})
	public String viewTripPictures(Model model, int itineraryItemId) {
		List<TripPicture> pictures = tripPictureDao.findTripPicturesByItemId(itineraryItemId);
		model.addAttribute("pictures", pictures);
		return "viewTripPictures";
	}
	
	@GetMapping(path="viewTripPictures.do")
	public String viewTripPictures(Model model) {
		Integer itineraryItemId = (Integer) model.getAttribute("itineraryItemId");
		List<TripPicture> pictures = tripPictureDao.findTripPicturesByItemId(itineraryItemId);
		model.addAttribute("pictures", pictures);
		return "viewTripPictures";
	}
	
	@PostMapping(path="createTripPicture.do")
	public String createTripPicture(String imageUrl, int itineraryItemId, RedirectAttributes redir) {
		ItineraryItem itineraryItem = itineraryItemDao.findItineraryItemById(itineraryItemId);
		TripPicture tripPicture = new TripPicture(imageUrl, itineraryItem);
		tripPictureDao.addTripPicture(tripPicture);
		
		redir.addFlashAttribute("itineraryId", tripPicture.getItineraryItem().getItinerary().getId());
		return "redirect:viewItinerary.do";
	}
	
	@PostMapping(path="deleteTripPicture.do")
	public String deleteTripPicture(int pictureId, RedirectAttributes redir) {
		TripPicture deleted = tripPictureDao.deleteTripPicture(pictureId);
		redir.addFlashAttribute("itineraryItemId", deleted.getItineraryItem().getId());
		return "redirect:viewTripPictures";
	}
}
