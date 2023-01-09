package com.skilldistillery.itinerary.data;

import com.skilldistillery.itinerary.entities.ItineraryComment;

public interface ItineraryCommentDAO {
	ItineraryComment addComment(int itineraryId, int userId, String body);
	
	
}
