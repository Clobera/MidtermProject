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
	public List<Itinerary> findUserItineraries(User user) {
		String query = "SELECT i FROM Itinerary i WHERE i.userId = :user AND i.active = true";
		List<Itinerary> userQuery = em.createQuery(query, Itinerary.class).setParameter("user", user).getResultList();
		if (userQuery.size() == 0) {
			userQuery =null;
		}
		return userQuery;
	}
	
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
	
	@Override
	public List<Itinerary> findAllInactiveItineraries () {
		List<Itinerary> results = null;
		String query = "SELECT i FROM Itinerary i WHERE i.active = false";
		results = em.createQuery(query, Itinerary.class).getResultList();
		return results;
	}
	
	@Override
	public Itinerary findItinerary(int id) {
		String query = "SELECT i From Itinerary i where i.id = :id";
		Itinerary byId = em.createQuery(query, Itinerary.class).setParameter("id", id).getSingleResult();
		return byId;
	}

	@Override
	public boolean deleteItinerary(int id) {
		boolean deletedItinerary = false;
		Itinerary itinerary = em.find(Itinerary.class, id);
		if (itinerary != null ) {
			itinerary.setActive(false);
			deletedItinerary= true;
		}
		return deletedItinerary;
	}
	
	@Override
	public Itinerary updateItinerary (Itinerary input, int id) {
		Itinerary output = em.find(Itinerary.class, id);
		output.setName(input.getName());
		output.setDescription(input.getDescription());
		output.setBudget(input.getBudget());
		output.setStartDate(input.getStartDate());
		output.setEndDate(input.getEndDate());
		output.setImage(input.getImage());
		return output;
	}

	@Override
	public List<Itinerary> findItinerariesByKeyword(String search) {
		String query = "SELECT DISTINCT i FROM Itinerary i WHERE i.active = true AND (i.description LIKE :search OR i.name LIKE :search)";
		List<Itinerary> resultList = em.createQuery(query, Itinerary.class).setParameter("search", "%" + search + "%").getResultList();
		
		return resultList;
	}

	
}
