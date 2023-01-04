package com.skilldistillery.itinerary.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ItineraryCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ItineraryComment itineraryComment;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAItineraryShare");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em= emf.createEntityManager();
		itineraryComment = em.find(ItineraryComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		itineraryComment = null;
	}

	@Test
	void test_itineraryComment_entity() {
		assertNotNull(itineraryComment);
		assertEquals("This trip was great", itineraryComment.getPost());
	}

}
