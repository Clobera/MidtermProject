package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.DestinationPicture;

@Service
@Transactional
public class DestinationPictureDAOImpl implements DestinationPictureDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public DestinationPicture findDestinationPictureById (int id) {
		DestinationPicture result = em.find(DestinationPicture.class, id);
		return result;
	}
	
	@Override
	public List<DestinationPicture> findDestinationPicturesByItemId(int itemId) {
		String query = "SELECT dp FROM DestinationPicture dp WHERE dp.destination.id = :id";
		List<DestinationPicture> results = em.createQuery(query, DestinationPicture.class).setParameter("id", itemId).getResultList();
		return results;
	}

	
	@Override
	public DestinationPicture addDestinationPicture(DestinationPicture destinationPicture) {
		em.persist(destinationPicture);
		em.flush();
		DestinationPicture result = findDestinationPictureById(destinationPicture.getId());
		return result;
	}

	@Override
	public DestinationPicture deleteDestinationPicture(int destinationPictureId) {
		
		DestinationPicture deletedPic = null;
		DestinationPicture deleteMe = em.find(DestinationPicture.class, destinationPictureId);
		if (deleteMe != null ) {
			em.remove(deleteMe);
			deletedPic= deleteMe;
		}
		return deletedPic;
	}

}
