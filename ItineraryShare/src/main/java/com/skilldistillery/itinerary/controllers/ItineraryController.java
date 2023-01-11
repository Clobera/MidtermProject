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

import com.skilldistillery.itinerary.data.BookmarkDAO;
import com.skilldistillery.itinerary.data.ItineraryCommentDAO;
import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.data.ItineraryItemDAO;
import com.skilldistillery.itinerary.entities.Bookmark;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryComment;
import com.skilldistillery.itinerary.entities.ItineraryItem;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class ItineraryController {

	@Autowired
	private ItineraryDAO itineraryDao;

	@Autowired
	private ItineraryItemDAO itineraryItemDao;
	
	@Autowired
	private ItineraryCommentDAO itineraryCommentDao;
	
	@Autowired
	private BookmarkDAO bookmarkDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}

	@GetMapping(path = "viewItinerary.do", params = {"itineraryId"})
	public String viewItinerary(Model model, @ModelAttribute("loggedInUser") User user, Integer itineraryId) {
		Bookmark bookmark = bookmarkDao.findBookmarkByUserIdAndItineraryId(user.getId(), itineraryId);
		Boolean bookmarked = false;
		if (bookmark != null) {
			bookmarked = true;
		}
		Itinerary showItinerary = itineraryDao.findItinerary(itineraryId);
		List<ItineraryItem> items= itineraryItemDao.findOrderedItineraryItemByItinerary(showItinerary);
		
		List<ItineraryComment> baseComments = new ArrayList<>();
		List<ItineraryComment> replies = new ArrayList<>();
		List<ItineraryComment> allComments = itineraryCommentDao.findCommentsById(itineraryId);
		for (ItineraryComment comment : allComments) {
			if (comment.getReply() == null) {
				baseComments.add(comment);
			} else {
				replies.add(comment);
			}
		}
		model.addAttribute("comments", baseComments);
		model.addAttribute("replies", replies);
		model.addAttribute("itinerary", showItinerary);
		model.addAttribute("itineraryDays", items);
		model.addAttribute("bookmarked", bookmarked);
		return "itinerary";
	}

	@GetMapping(path = "viewItinerary.do")
	public String viewItineraryAgain(Model model, @ModelAttribute("loggedInUser") User user) {
		Integer id= (Integer) model.getAttribute("itineraryId");
		Bookmark bookmark = bookmarkDao.findBookmarkByUserIdAndItineraryId(user.getId(), id);
		Boolean bookmarked = false;
		if (bookmark != null) {
			bookmarked = true;
		}
		Itinerary showItinerary = itineraryDao.findItinerary(id);
		List<ItineraryItem> items= itineraryItemDao.findOrderedItineraryItemByItinerary(showItinerary);
		List<ItineraryComment> baseComments = new ArrayList<>();
		List<ItineraryComment> replies = new ArrayList<>();
		List<ItineraryComment> allComments = itineraryCommentDao.findCommentsById(id);
		for (ItineraryComment comment : allComments) {
			if (comment.getReply() == null) {
				baseComments.add(comment);
			} else {
				replies.add(comment);
			}
		}
		
		System.out.println("*************************************************************");
		System.out.println(showItinerary.getUserId().getId());
		System.out.println(user.getId());
		System.out.println("*************************************************************");
		
		model.addAttribute("comments", baseComments);
		model.addAttribute("replies", replies);
		model.addAttribute("itinerary", showItinerary);
		model.addAttribute("itineraryDays", items);
		model.addAttribute("bookmarked", bookmarked);
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
	
	@PostMapping(path = "goUpdateItinerary.do")
	public String goUpdateItinerary(Model model, int updateId) {
		String destination = "updateItinerary";
		Itinerary itineraryToUpdate = itineraryDao.findItinerary(updateId);
		model.addAttribute("itinerary", itineraryToUpdate);
		return destination;
	}

	@PostMapping(path = "updateItinerary.do")
	public String updateItinerary(Itinerary update, int itineraryId, RedirectAttributes redir) {
		Itinerary itineraryToUpdate = itineraryDao.updateItinerary(update, itineraryId);
		redir.addFlashAttribute("itineraryId", itineraryToUpdate.getId());
		return "redirect:viewItinerary.do";
	}
	
	@PostMapping(path = "deleteItinerary.do")
	public String deleteItinerary(Model model, Integer deleteId, @ModelAttribute("loggedInUser") User user) {
		itineraryDao.deleteItinerary(deleteId);
		List<Itinerary> itineraries = itineraryDao.findUserItineraries(user);
		model.addAttribute("itineraries", itineraries);
		return "profilePage";
	}
	
	@GetMapping(path = "searchItinerary.do")
	public String searchItinerary(Model model, String search) {
		List<Itinerary> searchResults = itineraryDao.findItinerariesByKeyword(search);
		model.addAttribute("search", search);
		model.addAttribute("results", searchResults);
		return "searchResult";
	}
	
	@GetMapping(path= "adminViewAll.do")
	public String adminViewAllItineraries(Model model, @ModelAttribute("loggedInUser") User user) {
		List<Itinerary> activeItineraries = itineraryDao.findAllActiveItineraries();
		List<Itinerary> disabledItineraries = itineraryDao.findAllInactiveItineraries();
		model.addAttribute("active", activeItineraries);
		model.addAttribute("disabled", disabledItineraries);
		return "adminViewAll";
	}
	

}
