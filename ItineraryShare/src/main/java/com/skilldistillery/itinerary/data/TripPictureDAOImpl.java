package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.TripPicture;

@Service
@Transactional
public class TripPictureDAOImpl implements TripPictureDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public TripPicture findTripPictureById (int id) {
		TripPicture result = em.find(TripPicture.class, id);
		return result;
	}
	
	@Override
	public List<TripPicture> findTripPicturesByItemId(int itemId) {
		String query = "SELECT tp FROM TripPicture tp WHERE tp.itineraryItem.id = :id";
		List<TripPicture> results = em.createQuery(query, TripPicture.class).setParameter("id", itemId).getResultList();
		return results;
	}

	
	@Override
	public TripPicture addTripPicture(TripPicture tripPicture) {
		em.persist(tripPicture);
		em.flush();
		TripPicture result = findTripPictureById(tripPicture.getId());
		return result;
	}

	@Override
	public TripPicture deleteTripPicture(int tripPictureId) {
		
		TripPicture deletedPic = null;
		TripPicture deleteMe = em.find(TripPicture.class, tripPictureId);
		if (deleteMe != null ) {
			em.remove(deleteMe);
			deletedPic= deleteMe;
		}
		return deletedPic;
	}

}
