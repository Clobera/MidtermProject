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
	public ItineraryComment addCommentReply(int user, String post, int reply, int itinerary) {
		Itinerary originalItinerary = em.find(Itinerary.class, itinerary);
		User userCommenting = em.find(User.class, user);
		ItineraryComment comment = em.find(ItineraryComment.class, reply);
		ItineraryComment response = new ItineraryComment(userCommenting, post, comment, originalItinerary);
		em.persist(response);
		originalItinerary.addComment(response);
		return response;
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
	@Override
	public ItineraryComment findCommentById (int id) {
		ItineraryComment output = null;
		output = em.find(ItineraryComment.class, id);
		return output;
	}
	
	@Override
	public List<ItineraryComment> findCommentsByReplyId (int id) {
		List<ItineraryComment> output = null;
		String query = "SELECT ic FROM ItineraryComment ic WHERE ic.reply.id = :id";
		output = em.createQuery(query, ItineraryComment.class).setParameter("id", id).getResultList();
		return output;
	}
	
	@Override
	public List<ItineraryComment> findCommentsById (int itineraryId) {
		List<ItineraryComment> output = null;
		String query = "SELECT ic FROM ItineraryComment ic WHERE ic.itinerary.id = :id";
		
		output = em.createQuery(query, ItineraryComment.class).setParameter("id", itineraryId).getResultList();
		return output;
	}
}
