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

import com.skilldistillery.itinerary.data.BookmarkDAO;
import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.data.UserDAO;
import com.skilldistillery.itinerary.entities.Bookmark;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class BookmarkController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private ItineraryDAO itineraryDao;
	@Autowired
	private BookmarkDAO bookmarkDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState () {
		return new User();
	}
	
	@PostMapping(path = "addBookmark.do")
	public String createBookmark(@ModelAttribute("loggedInUser") User user, int itineraryId, RedirectAttributes redir) {
		bookmarkDao.createBookmark(user.getId(), itineraryId);
		redir.addFlashAttribute("id", itineraryId);
		return "redirect:viewItinerary";
	}
	
	@PostMapping(path = "removeBookmark.do")
	public String deleteBookmark(@ModelAttribute("loggedInUser") User user, int itineraryId, RedirectAttributes redir) {
		Bookmark deleteMe = bookmarkDao.findBookmarkByUserIdAndItineraryId(user.getId(), itineraryId);
		bookmarkDao.deleteBookmark(deleteMe);
		redir.addFlashAttribute("id", itineraryId);
		return "viewItinerary";
	}
	
	@GetMapping(path="viewBookmarks.do")
	public String viewBookmarks (Model model, @ModelAttribute("loggedInUser") User user) {
		String view = "bookmarksPage";
		if (user.getId() == 0) {
			view = "loginScreen";
		} else {
		List<Bookmark> bookmarks = bookmarkDao.findBookmarksByUserId(user.getId());
		model.addAttribute("bookmarks", bookmarks);
		}
		return view;
	}
}
