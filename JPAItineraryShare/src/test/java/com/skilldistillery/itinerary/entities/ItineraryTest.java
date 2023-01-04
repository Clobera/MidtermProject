package com.skilldistillery.itinerary.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ItineraryTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Itinerary itinerary;

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
		itinerary = em.find(Itinerary.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		itinerary = null;
	}

	@Test
	void test_itinerary_entity() {
		assertNotNull(itinerary);
		assertEquals(Month.DECEMBER, itinerary.getStartDate().getMonth());
		assertEquals("Summer Trip 2022", itinerary.getName());
	}

}
