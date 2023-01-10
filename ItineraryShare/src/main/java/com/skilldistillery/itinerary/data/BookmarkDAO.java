package com.skilldistillery.itinerary.data;

import java.util.List;

import com.skilldistillery.itinerary.entities.Bookmark;

public interface BookmarkDAO {
	public List<Bookmark> findBookmarksByUserId (int userId);
	public Bookmark createBookmark (int userId, int itineraryId);
	public Bookmark deleteBookmark (Bookmark bookmark);
	Bookmark findBookmarkByUserIdAndItineraryId(int userId, int itineraryId);
}
