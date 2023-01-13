package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Destination;
import com.skilldistillery.itinerary.entities.Itinerary;
import com.skilldistillery.itinerary.entities.ItineraryItem;
import com.skilldistillery.itinerary.entities.TripPicture;

@Service
@Transactional
public class ItineraryItemDAOImpl implements ItineraryItemDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public ItineraryItem createItineraryItem(Itinerary itinerary, Destination destination, ItineraryItem itineraryItem) {
		itineraryItem.setItinerary(itinerary);
		itineraryItem.setDestination(destination);
		System.out.println(itineraryItem);
		System.out.println(itinerary.getId());
		System.out.println(destination.getId());
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

	@Override
	public List<ItineraryItem> findItineraryItemByItinerary (Itinerary itinerary) {
		List<ItineraryItem> items = null;
		String query = "Select i FROM ItineraryItem i WHERE i.itinerary.id = :id";
		items = em.createQuery(query, ItineraryItem.class).setParameter("id", itinerary.getId()).getResultList();
		return items;
	}

	@Override
	public List<ItineraryItem> findOrderedItineraryItemByItinerary (Itinerary itinerary) {
		List<ItineraryItem> items = null;
		String query = "Select i FROM ItineraryItem i WHERE i.itinerary.id = :id ORDER BY i.tripDay asc";
		items = em.createQuery(query, ItineraryItem.class).setParameter("id", itinerary.getId()).getResultList();
		return items;
	}
	
	@Override
	public List<ItineraryItem> findItineraryItemByDay (int day, Itinerary itinerary) {
		List<ItineraryItem> items = null;
		String query = "Select i FROM ItineraryItem i WHERE i.tripDay = :day AND i.itinerary.id = :id";
		items = em.createQuery(query, ItineraryItem.class).setParameter("day", day).setParameter("id", itinerary.getId()).getResultList();
		return items;
	}
	
	@Override
	public ItineraryItem removeItineraryItem (int itemId) {
		ItineraryItem removal = em.find(ItineraryItem.class, itemId);
		String query = "SELECT tp FROM TripPicture tp WHERE tp.itineraryItem.id = :id";
		List<TripPicture> pictureList = em.createQuery(query, TripPicture.class).setParameter("id", itemId).getResultList();
		if (pictureList.size() > 0) {
			for (TripPicture picture : pictureList) {
				em.remove(picture);
			}
		}
		em.remove(removal);
		return removal;
	}
}
