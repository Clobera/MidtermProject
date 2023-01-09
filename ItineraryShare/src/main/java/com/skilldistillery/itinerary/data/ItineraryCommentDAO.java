package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryComment;
import com.skilldistillery.itinerary.entities.User;

public interface ItineraryCommentDAO {
	ItineraryComment addComment(int itineraryId, int userId, String body);

	List<ItineraryComment> findCommentsWithNullReply();

	List<ItineraryComment> findCommentsWithReply();

	ItineraryComment addCommentReply(int user, String post, int reply, int itinerary);

	ItineraryComment findCommentById(int id);

	List<ItineraryComment> findCommentsByReplyId(int id);

	List<ItineraryComment> findCommentsById(int itineraryId);
	
	
}
