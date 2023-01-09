package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.ItineraryComment;

public interface ItineraryCommentDAO {
	ItineraryComment addComment(int itineraryId, int userId, String body);

	List<ItineraryComment> findCommentsWithNullReply();

	List<ItineraryComment> findCommentsWithReply();
	
	
}
