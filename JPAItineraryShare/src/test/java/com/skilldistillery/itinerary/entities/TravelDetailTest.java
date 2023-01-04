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

class TravelDetailTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private TravelDetail travelDetail;

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
		travelDetail = em.find(TravelDetail.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		travelDetail = null;
	}

	@Test
	void test_travelDetail_entity() {
		assertNotNull(travelDetail);
		assertEquals("flying to utah", travelDetail.getDescription());
		
	}

	@Test
	void test_travelDetail_itineraryItem_ManyToOne() {
		assertNotNull(travelDetail);
		assertNotNull(travelDetail.getItineraryItem());
		assertEquals("salt lakes utah", travelDetail.getItineraryItem().getDescription());
	}
	
	@Test
	void test_travelDetail_TravelDetailType_ManyToOne() {
		assertNotNull(travelDetail);
		assertNotNull(travelDetail.getTravelDetailType());
		assertEquals("flight", travelDetail.getTravelDetailType().getName());
	}

}