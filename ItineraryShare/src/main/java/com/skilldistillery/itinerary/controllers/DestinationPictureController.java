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
import com.skilldistillery.itinerary.data.DestinationPictureDAO;
import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.DestinationPicture;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class DestinationPictureController {
	
	@Autowired
	private DestinationPictureDAO destinationPictureDao;
	
	@Autowired
	private DestinationDAO destinationDao;

	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}
	
	@GetMapping(path="viewDestinationPictures.do", params={"destinationId"})
	public String viewDestinationPictures(Model model, int destinationId) {
		List<DestinationPicture> pictures = destinationPictureDao.findDestinationPicturesByItemId(destinationId);
		model.addAttribute("pictures", pictures);
		return "viewDestinationPictures";
	}
	
	@GetMapping(path="viewDestinationPictures.do")
	public String viewDestinationPictures(Model model) {
		Integer destinationId = (Integer) model.getAttribute("destinationId");
		List<DestinationPicture> pictures = destinationPictureDao.findDestinationPicturesByItemId(destinationId);
		model.addAttribute("pictures", pictures);
		return "viewDestinationPictures";
	}
	
	@PostMapping(path="createDestinationPicture.do")
	public String createDestinationPicture(String imageUrl, int destinationId, RedirectAttributes redir) {
		Destination destination = destinationDao.findDestinationById(destinationId);
		DestinationPicture destinationPicture = new DestinationPicture(imageUrl, destination);
		destinationPictureDao.addDestinationPicture(destinationPicture);
		
		redir.addFlashAttribute("destinationId", destinationPicture.getDestination().getId());
		return "redirect:viewDestination.do";
	}
	
	@PostMapping(path="deleteDestinationPicture.do")
	public String deleteDestinationPicture(int pictureId, RedirectAttributes redir) {
		DestinationPicture deleted = destinationPictureDao.deleteDestinationPicture(pictureId);
		redir.addFlashAttribute("destinationId", deleted.getDestination().getId());
		return "redirect:viewDestinationPictures.do";
	}
}
