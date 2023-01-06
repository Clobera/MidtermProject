package com.skilldistillery.itinerary.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;

@Service
@Transactional
public class ItineraryItemDAOImpl implements ItineraryItemDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public ItineraryItem createItineraryItem(Itinerary itinerary, Destination destination, ItineraryItem itineraryItem) {
		itineraryItem.setItinerary(itinerary);
		itineraryItem.setDestination(destination);
		em.persist(itineraryItem);
		em.flush();
		ItineraryItem newItineraryItem = findItineraryItemById(itineraryItem.getId());
		return newItineraryItem;
	}
	
	@Override
	public ItineraryItem findItineraryItemById (int id) {
		ItineraryItem result = em.find(ItineraryItem.class, id);
		return result;
	}

}
