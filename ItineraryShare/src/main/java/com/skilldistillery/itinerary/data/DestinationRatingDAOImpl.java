package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.DestinationRating;
import com.skilldistillery.itinerary.entities.DestinationRatingKey;
import com.skilldistillery.itinerary.entities.User;

@Service
@Transactional
public class DestinationRatingDAOImpl implements DestinationRatingDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<DestinationRating> findDestinationRatingsById(int destinationId) {
		List<DestinationRating> output = null;
		String query =  "SELECT dr FROM DestinationRating dr WHERE dr.destination.id = :id";
		output = em.createQuery(query, DestinationRating.class).setParameter("id", destinationId).getResultList();
		return output;
	}

	@Override
	public DestinationRating createDestinationRating(int rating, int userId, int destinationId) {
		User user = em.find(User.class, userId);
		Destination destination = em.find(Destination.class, destinationId);
		DestinationRatingKey key = new DestinationRatingKey(destinationId, userId);
		DestinationRating output = new DestinationRating(rating, key, user, destination);
		em.persist(output);
		return output;
	}
	
	@Override
	public DestinationRating updateDestinationRating(int rating, int ratingId) {
		String query = "SELECT dr FROM DestinationRating dr WHERE dr.id = :id";
		List<DestinationRating> results = em.createQuery(query, DestinationRating.class).setParameter("id", ratingId).getResultList();
		DestinationRating output = null;
		if (results.size() > 0) {
			output = results.get(0);
		}
		return output;
	}

}
