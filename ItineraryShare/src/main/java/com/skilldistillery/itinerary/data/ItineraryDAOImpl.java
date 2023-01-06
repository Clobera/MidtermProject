package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.User;

@Service
@Transactional
public class ItineraryDAOImpl implements ItineraryDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Itinerary createItinerary(User user, Itinerary itinerary) {
		itinerary.setUserId(user);
		if(itinerary.getImage() == null || itinerary.getImage().equals("")) {
			itinerary.setImage("https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA=");
		}
		em.persist(itinerary);
		em.flush();
		return itinerary;
	}
	

	@Override
	public List<Itinerary> findAllActiveItineraries () {
		List<Itinerary> results = null;
		String query = "SELECT i FROM Itinerary i WHERE i.active = true";
		results = em.createQuery(query, Itinerary.class).getResultList();
		return results;
	}
}
