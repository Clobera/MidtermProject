package com.skilldistillery.itinerary.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TripPictureTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private TripPicture tripPicture;

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
		tripPicture = em.find(TripPicture.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		tripPicture = null;
	}

	@Test
	void test_trip_picture_entity() {
		assertNotNull(tripPicture);
		assertEquals("https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9hZCUyMHRyaXB8ZW58MHx8MHx8&w=1000&q=80", tripPicture.getImageUrl());
	}

	@Test
	void test_TripPicture_ItineraryItem_ManyToOne_relationshipMapping() {
		assertNotNull(tripPicture);
		assertNotNull(tripPicture.getItineraryItem().getItinerary());
		assertEquals("Summer Trip 2022",tripPicture.getItineraryItem().getItinerary().getName());
		
	}
}
