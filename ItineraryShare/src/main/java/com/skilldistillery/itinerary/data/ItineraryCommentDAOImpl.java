package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryComment;
import com.skilldistillery.itinerary.entities.User;

@Service
@Transactional
public class ItineraryCommentDAOImpl implements ItineraryCommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public ItineraryComment addComment(int itineraryId, int userId, String body) {
		Itinerary itinerary = em.find(Itinerary.class, itineraryId);
		User user = em.find(User.class, userId);
		ItineraryComment comment = new ItineraryComment(user, body, itinerary);
		em.persist(comment);
		itinerary.addComment(comment);
		em.flush();
		return comment;
	}
	
	@Override
	public List<ItineraryComment> findCommentsWithNullReply () {
		List<ItineraryComment> output = null;
		String query = "SELECT ic FROM ItineraryComment ic WHERE ic.reply = null";
		
		output = em.createQuery(query, ItineraryComment.class).getResultList();
		return output;
	}
	
	@Override
	public List<ItineraryComment> findCommentsWithReply () {
		List<ItineraryComment> output = null;
		String query = "SELECT ic FROM ItineraryComment ic WHERE ic.reply != null ORDER BY ic.reply.id ASC";
		
		output = em.createQuery(query, ItineraryComment.class).getResultList();
		return output;
	}
}
