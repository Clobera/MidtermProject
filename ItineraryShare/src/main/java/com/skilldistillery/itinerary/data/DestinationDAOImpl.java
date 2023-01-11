package com.skilldistillery.itinerary.data;

import java.util.List;

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

	@Override
	public List<Destination> findAllDestinations() {
		String query = "Select d from Destination d ORDER BY d.name ASC";
		List<Destination> destinations = em.createQuery(query, Destination.class).getResultList();
		return destinations;
	}

	@Override
	public Destination updateDestination(int destinationId, Destination updateMe) {
		Destination output = em.find(Destination.class, destinationId);
		if (output != null) {
			output.setCity(updateMe.getCity());
			output.setCountry(updateMe.getCountry());
			output.setName(updateMe.getName());
			output.setImage(updateMe.getImage());
			output.setDescription(updateMe.getDescription());
		}
		
		return output;
	}
	
	@Override
	public List<Destination> findDestinationsByKeyword(String search) {
		String query = "SELECT DISTINCT d FROM Destination d WHERE d.city LIKE :search OR d.country LIKE :search OR d.name LIKE :search";
		List<Destination> resultList = em.createQuery(query, Destination.class).setParameter("search", "%" + search + "%").getResultList();
		
		return resultList;
	}

}
