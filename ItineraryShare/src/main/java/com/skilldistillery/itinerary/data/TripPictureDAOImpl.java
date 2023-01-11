package com.skilldistillery.itinerary.data;

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
	public TripPicture AddTripPicture(TripPicture tripPicture) {
		em.persist(tripPicture);
		em.flush();
		TripPicture result = findTripPictureById(tripPicture.getId());
		return result;
	}

	@Override
	public boolean DeleteTripPicture(int tripPictureId) {
		
		boolean deletedPic = false;
		TripPicture deleteMe = em.find(TripPicture.class, tripPictureId);
		if (deleteMe != null ) {
			em.remove(deleteMe);
			deletedPic= true;
		}
		return deletedPic;
	}

}
