package com.skilldistillery.itinerary.controllers;

import java.util.ArrayList;
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
		redir.addFlashAttribute("itineraryId", itineraryId);
		
		return "redirect:viewItinerary.do";
	}
	
	@PostMapping(path = "goCreateItineraryCommentReply.do")
	public String goCreateReply(Model model, Integer itineraryCommentId, Integer itineraryId) {
		ItineraryComment baseComment = null;
		List<ItineraryComment> replies = new ArrayList<>();
		List<ItineraryComment> allComments = itineraryCommentDao.findCommentsById(itineraryId);
		for (ItineraryComment comment : allComments) {
			if (comment.getId() == itineraryCommentId) {
				baseComment = comment;
			} else if (comment.getReply() != null && comment.getReply().getId() == itineraryCommentId){
				replies.add(comment);
			}
		}
		model.addAttribute("comment", baseComment);
		model.addAttribute("replies", replies);
		model.addAttribute("commentId", itineraryCommentId);
		model.addAttribute("itinerary", itineraryDao.findItinerary(itineraryId));
		return "createItineraryCommentReply";
	}

	@PostMapping(path = "createItineraryCommentReply.do")
	public String createReply(@ModelAttribute("loggedInUser") User user, String itineraryComment, int itineraryId, Integer itineraryCommentId, RedirectAttributes redir) {
		itineraryCommentDao.addCommentReply(user.getId(), itineraryComment, itineraryCommentId, itineraryId);
		
		redir.addFlashAttribute("itineraryId", itineraryId);
		return "redirect:viewItinerary.do";
	}
	
	
	
}
