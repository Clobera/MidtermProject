package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Bookmark;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

@Service
@Transactional
public class BookmarkDAOImpl implements BookmarkDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Bookmark> findBookmarksByUserId(int userId) {
		List<Bookmark> output = null;
		String query =  "SELECT b FROM Bookmark b WHERE b.user.id = :id AND b.itinerary.active = true";
		output = em.createQuery(query, Bookmark.class).setParameter("id", userId).getResultList();
		return output;
	}
	
	@Override
	public Bookmark findBookmarkByUserIdAndItineraryId(int userId, int itineraryId) {
		String query =  "SELECT b FROM Bookmark b WHERE b.user.id = :userId AND b.itinerary.id = :itineraryId";
		Bookmark output = em.createQuery(query, Bookmark.class).setParameter("userId", userId).setParameter("itineraryId", itineraryId).getSingleResult();
		return output;
	}

	@Override
	public Bookmark createBookmark(int userId, int itineraryId) {
		User user = em.find(User.class, userId);
		Itinerary itinerary = em.find(Itinerary.class, itineraryId);
		Bookmark output = new Bookmark(user, itinerary);
		em.persist(output);
		user.addBookmarks(output);
		itinerary.addBookmark(output);
		return output;
	}

	@Override
	public Bookmark deleteBookmark(Bookmark bookmark) {
		String query =  "SELECT b FROM Bookmark b WHERE b.user.id = :userId AND b.itinerary.id = :itineraryId";
		Bookmark deleteMe = em.createQuery(query, Bookmark.class).setParameter("userId", bookmark.getUser().getId()).setParameter("itineraryId", bookmark.getItinerary().getId()).getSingleResult();
		deleteMe.getUser().removeBookmarks(deleteMe);
		deleteMe.getItinerary().removeBookmark(deleteMe);
		em.remove(deleteMe);
		return deleteMe;
	}

}
