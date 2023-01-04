package com.skilldistillery.itinerary.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class BookmarkKey implements Serializable{
	private static final long serialVersionUID = 1L;
	@Column(name="itinerary_id")
	private int destination;
	@Column(name="user_id")
	private int user;
	
	public BookmarkKey () {}
	
	public BookmarkKey(int destination, int user) {
		super();
		this.destination = destination;
		this.user = user;
	}
	public int getDestination() {
		return destination;
	}
	public void setDestination(int destination) {
		this.destination = destination;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	@Override
	public int hashCode() {
		return Objects.hash(destination, user);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookmarkKey other = (BookmarkKey) obj;
		return destination == other.destination && user == other.user;
	}
}
