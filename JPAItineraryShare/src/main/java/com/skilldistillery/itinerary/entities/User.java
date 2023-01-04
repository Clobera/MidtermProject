package com.skilldistillery.itinerary.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Boolean enabled;

	private String role;
	@Column(name = "profile_picture")
	private String profilePicture;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private String biography;
//	@OneToMany(mappedBy="user_has_bookmarked_itinerary")
//	private List<Itinerary> bookmarks;
	
	@OneToMany(mappedBy = "userId")
	private List<Itinerary> itineraries;

	public User() {
		super();
	}

	public void addItinerary(Itinerary itinerary) {
		if (itineraries == null ) {
			itineraries = new ArrayList<>();
		}
		if (! itineraries.contains(itinerary)) {
			itineraries.add(itinerary);
			itinerary.getUserId().removeItinerary(itinerary);
		}
		itinerary.setUserId(this);
	}
	
	public void removeItinerary(Itinerary itinerary) {
		if (itineraries != null && itineraries.contains(itinerary)) {
			itineraries.remove(itinerary);
			itinerary.setUserId(null);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public List<Itinerary> getItineraries() {
		return itineraries;
	}

	public void setItineraries(List<Itinerary> itineraries) {
		this.itineraries = itineraries;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", profilePicture=" + profilePicture + ", firstName=" + firstName + ", lastName="
				+ lastName + ", biography=" + biography + "]";
	}

}
