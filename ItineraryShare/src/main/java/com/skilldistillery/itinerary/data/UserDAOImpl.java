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
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		User loggedInUser = null;
		String query = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw";
		List<User> userQuery = em.createQuery(query, User.class).setParameter("un", username).setParameter("pw", password).getResultList();
		if (userQuery.size() == 1) {
			loggedInUser = userQuery.get(0);
		}
		return loggedInUser;
	}
	
	@Override
	public User addUser(User input) {
		em.persist(input);
		User output = findByUsernameAndPassword(input.getUsername(), input.getPassword());
		em.flush();
		return output;
	}

	@Override
	public Itinerary createItinerary(User user, Itinerary itinerary) {
		itinerary.setUserId(user);
		if(itinerary.getImage().equals("") || itinerary.getImage().equals(null)) {
			itinerary.setImage("https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0");
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
