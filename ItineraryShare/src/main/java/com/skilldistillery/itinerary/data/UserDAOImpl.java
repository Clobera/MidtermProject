package com.skilldistillery.itinerary.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		String query = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
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
	public User updateUser (User user, int id) {
		User output = em.find(User.class, id);
		if (output != null) {
			output.setFirstName(user.getFirstName());
			output.setLastName(user.getLastName());
			output.setPassword(user.getPassword());
			output.setBiography(user.getBiography());
			output.setProfilePicture(user.getProfilePicture());
		}
		
		return output;
	}
	
	@Override
	public User deleteAccount(int id) {
		User toDelete = em.find(User.class, id);
		if (toDelete != null) {
			toDelete.setEnabled(false);
		}
		return toDelete;
	}
	
}
