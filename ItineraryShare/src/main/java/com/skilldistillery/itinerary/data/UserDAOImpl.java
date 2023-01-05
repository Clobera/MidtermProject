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
		em.persist(itinerary);
		em.flush();
		return itinerary;
	}
	
}
