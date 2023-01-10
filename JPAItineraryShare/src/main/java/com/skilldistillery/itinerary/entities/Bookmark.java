package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="user_has_bookmarked_itinerary")
public class Bookmark {
	@EmbeddedId
	private BookmarkKey id;
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="user")
	private User user;
	@ManyToOne
	@JoinColumn(name="itinerary_id")
	@MapsId(value="itinerary")
	private Itinerary itinerary;
	
	public Bookmark () {}

	public Bookmark(User user, Itinerary itinerary) {
		super();
		this.user = user;
		this.itinerary = itinerary;
	}

	public BookmarkKey getId() {
		return id;
	}

	public void setId(BookmarkKey id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Itinerary getItinerary() {
		return itinerary;
	}

	public void setItinerary(Itinerary itinerary) {
		this.itinerary = itinerary;
	}

	@Override
	public int hashCode() {
		return Objects.hash(itinerary, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bookmark other = (Bookmark) obj;
		return Objects.equals(itinerary, other.itinerary) && Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return "Bookmark [id=" + id + ", user=" + user + ", itinerary=" + itinerary + "]";
	}
	
	
}
