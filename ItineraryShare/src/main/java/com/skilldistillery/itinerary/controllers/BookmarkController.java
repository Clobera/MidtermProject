package com.skilldistillery.itinerary.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String createBookmark(Model model, int userId, int bookmarkId) {
		List<Bookmark> userBookmarks = bookmarkDao.findBookmarksByUserId(userId);
		Bookmark bookmark = bookmarkDao.createBookmark(userId, bookmarkId);
		userBookmarks.add(bookmark);
		model.addAllAttributes(userBookmarks);
		return "bookmarksPage";
	}
	
	@PostMapping(path = "removeBookmark.do")
	public String deleteBookmark(int userId, int bookmarkId) {
		List<Bookmark> userBookmarks = bookmarkDao.findBookmarksByUserId(userId);
		userBookmarks.remove(bookmarkId);
		return "itinerary";
	}
}
