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

import com.skilldistillery.itinerary.data.DestinationCommentDAO;
import com.skilldistillery.itinerary.data.DestinationDAO;
import com.skilldistillery.itinerary.entities.DestinationComment;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class DestinationCommentController {

	@Autowired
	private DestinationCommentDAO destinationCommentDao;

	@Autowired
	private DestinationDAO destinationDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState() {
		return new User();
	}

	@PostMapping(path = "createDestinationComment.do")
	public String createdItinerary(String itineraryComment, int commentId, @ModelAttribute("loggedInUser") User user, RedirectAttributes redir) {
		destinationCommentDao.addComment(commentId, user.getId(), itineraryComment);
		redir.addFlashAttribute("commentId", commentId);
		return "redirect:viewDestination.do";
	}
	
	@PostMapping(path = "goCreateDestinationCommentReply.do")
	public String goCreateReply(Model model, Integer destinationCommentId, Integer commentId) {
		DestinationComment baseComment = null;
		List<DestinationComment> replies = new ArrayList<>();
		List<DestinationComment> allComments = destinationCommentDao.findCommentsById(commentId);
		for (DestinationComment comment : allComments) {
			if (comment.getId() == destinationCommentId) {
				baseComment = comment;
			} else if (comment.getReply() != null && comment.getReply().getId() == destinationCommentId){
				replies.add(comment);
			}
		}
		model.addAttribute("comment", baseComment);
		model.addAttribute("replies", replies);
		model.addAttribute("commentId", destinationCommentId);
		model.addAttribute("destination", destinationDao.findDestinationById(commentId));
		return "createDestinationCommentReply";
	}

	@PostMapping(path = "createDestinationCommentReply.do")
	public String createReply(@ModelAttribute("loggedInUser") User user, String itineraryComment, int commentId, Integer destinationCommentId, RedirectAttributes redir) {
		destinationCommentDao.addCommentReply(user.getId(), itineraryComment, destinationCommentId, commentId);
		redir.addFlashAttribute("commentId", commentId);
		return "redirect:viewDestination.do";
	}
}