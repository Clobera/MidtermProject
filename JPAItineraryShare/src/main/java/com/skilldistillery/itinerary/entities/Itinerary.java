package com.skilldistillery.itinerary.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Itinerary {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private boolean active;
	
	private double budget;

	@Column(name="start_date")
	private LocalDateTime startDate;

	@Column(name="end_date")
	private LocalDateTime endDate;
	
	private String image;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User userId;
	
	private String name;
	
	private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public double getBudget() {
		return budget;
	}

	public void setBudget(double budget) {
		this.budget = budget;
	}

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		Itinerary other = (Itinerary) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Itinerary [id=" + id + ", active=" + active + ", budget=" + budget + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", image=" + image + ", userId=" + userId + ", name=" + name
				+ ", description=" + description + "]";
	}
	
	
}
