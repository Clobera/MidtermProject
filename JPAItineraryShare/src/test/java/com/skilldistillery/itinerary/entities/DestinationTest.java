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

class DestinationTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Destination destination;

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
		destination = em.find(Destination.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		destination = null;
	}

	@Test
	void test() {
		assertNotNull(destination);
		assertEquals("Utah", destination.getCity());
	}

}