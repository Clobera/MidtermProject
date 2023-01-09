package com.skilldistillery.itinerary.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.itinerary.data.ItineraryCommentDAO;
import com.skilldistillery.itinerary.data.ItineraryDAO;
import com.skilldistillery.itinerary.entities.ItineraryComment;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class ItineraryCommentController {

	@Autowired
	private ItineraryDAO itineraryDao;

	@Autowired
	private ItineraryCommentDAO itineraryCommentDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}

	@PostMapping(path = "createItineraryComment.do")
	public String createdItinerary(String itineraryComment, int itineraryId, @ModelAttribute("loggedInUser") User user, RedirectAttributes redir) {
		itineraryCommentDao.addComment(itineraryId, user.getId(), itineraryComment);
		redir.addFlashAttribute("id", itineraryId);
		
		return "redirect:viewItinerary.do";
	}
	
	@PostMapping(path = "goCreateItineraryCommentReply.do")
	public String goCreateReply(Model model, Integer itineraryCommentId, Integer itineraryId) {

		model.addAttribute("commentId", itineraryCommentId);
		model.addAttribute("itineraryId", itineraryId);
		return "createItineraryCommentReply";
	}

	@PostMapping(path = "CreateItineraryCommentReply.do")
	public String createReply(ItineraryComment reply, int itineraryId, Integer itineraryCommentId, RedirectAttributes redir) {
		
		redir.addFlashAttribute("id", itineraryId);
		return "redirect:viewItinerary.do";
	}
	
	
	
}
