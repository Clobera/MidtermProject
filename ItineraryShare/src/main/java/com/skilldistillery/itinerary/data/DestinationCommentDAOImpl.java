package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.DestinationComment;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryComment;
import com.skilldistillery.itinerary.entities.User;

@Service
@Transactional
public class DestinationCommentDAOImpl implements DestinationCommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public DestinationComment addComment(int destinationId, int userId, String body) {
		Destination destination = em.find(Destination.class, destinationId);
		User user = em.find(User.class, userId);
		DestinationComment comment = new DestinationComment(user, body, destination);
		em.persist(comment);
		destination.addComment(comment);
		em.flush();
		return comment;
	}	

	@Override
	public DestinationComment addCommentReply(int user, String post, int reply, int destination) {
		Destination originalDestination = em.find(Destination.class, destination);
		User userCommenting = em.find(User.class, user);
		DestinationComment comment = em.find(DestinationComment.class, reply);
		DestinationComment response = new DestinationComment(userCommenting, post, comment, originalDestination);
		em.persist(response);
		originalDestination.addComment(response);
		return response;
	}
	
	@Override
	public List<DestinationComment> findCommentsWithNullReply () {
		List<DestinationComment> output = null;
		String query = "SELECT dc FROM DestinationComment dc WHERE dc.reply = null";
		output = em.createQuery(query, DestinationComment.class).getResultList();
		return output;
	}
	
	@Override
	public List<DestinationComment> findCommentsWithReply () {
		List<DestinationComment> output = null;
		String query = "SELECT dc FROM DestinationComment dc WHERE dc.reply != null ORDER BY dc.reply.id ASC";
		output = em.createQuery(query, DestinationComment.class).getResultList();
		return output;
	}
	@Override
	public DestinationComment findCommentById (int id) {
		DestinationComment output = null;
		output = em.find(DestinationComment.class, id);
		return output;
	}
	
	@Override
	public List<DestinationComment> findCommentsByReplyId (int id) {
		List<DestinationComment> output = null;
		String query = "SELECT dc FROM DestinationComment dc WHERE dc.reply.id = :id";
		output = em.createQuery(query, DestinationComment.class).setParameter("id", id).getResultList();
		return output;
	}
	
	@Override
	public List<DestinationComment> findCommentsById (int destinationId) {
		List<DestinationComment> output = null;
		String query = "SELECT dc FROM DestinationComment dc WHERE dc.destination.id = :id";
		
		output = em.createQuery(query, DestinationComment.class).setParameter("id", destinationId).getResultList();
		return output;
	}
}
