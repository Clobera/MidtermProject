package com.skilldistillery.itinerary.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.itinerary.entities.Destination;

@Service
@Transactional
public class DestinationDAOImpl implements DestinationDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Destination createDestination(Destination input) {
		em.persist(input);
		em.flush();
		Destination result = findDestinationById(input.getId());
		return result;
	}
	
	@Override
	public Destination findDestinationById (int id) {
		Destination result = em.find(Destination.class, id);
		return result;
	}

}
