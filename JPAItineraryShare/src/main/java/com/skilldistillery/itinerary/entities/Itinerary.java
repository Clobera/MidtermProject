package com.skilldistillery.itinerary.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="itinerary")
public class Itinerary {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private boolean active;
	
	private double budget;
	
	@Column(name="start_date")
	private LocalDate startDate;
	
	@Column(name="end_date")
	private LocalDate endDate;
	
	@Column(columnDefinition="varchar(2048) default 'https://media.gettyimages.com/id/1179434234/photo/denver-and-the-flatirons.jpg?s=612x612&w=gi&k=20&c=TCqpLA1sWXtz5y5r91pQciTwH84700biOnL9lmlaP2w='")
	private String image;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User userId;
	
	private String name;
	
	private String description;
	
	@OneToMany(mappedBy="itinerary")
	private List<ItineraryItem> itineraryItems;
	
	@OneToMany(mappedBy="itinerary")
	private List<ItineraryComment> comments;
	
	@OneToMany(mappedBy="itinerary")
	private List<Bookmark> bookmarks;


	public void addItineraryItem(ItineraryItem itineraryItem) {
		if (itineraryItems == null) {
			itineraryItems = new ArrayList<>();
		}
		if (!itineraryItems.contains(itineraryItem)) {
			itineraryItems.add(itineraryItem);
			itineraryItem.getItinerary().removeItineraryItem(itineraryItem);
		}
	}

	public void removeItineraryItem(ItineraryItem itineraryItem) {
		if (itineraryItems != null && itineraryItems.contains(itineraryItem)) {
			itineraryItems.remove(itineraryItem);
		}
	}
	

	public void addComment(ItineraryComment itineraryComment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(itineraryComment)) {
			comments.add(itineraryComment);
			itineraryComment.getItinerary().removeComment(itineraryComment);
		}
	}

	public void removeComment(ItineraryComment itineraryComment) {
		if (comments != null && comments.contains(itineraryComment)) {
			comments.remove(itineraryComment);
		}
	}
	

	public void addBookmark(Bookmark bookmark) {
		if (bookmarks == null) {
			bookmarks = new ArrayList<>();
		}
		if (!bookmarks.contains(bookmark)) {
			bookmarks.add(bookmark);
			bookmark.getItinerary().removeBookmark(bookmark);
		}
	}

	public void removeBookmark(Bookmark bookmark) {
		if (bookmarks != null && bookmarks.contains(bookmark)) {
			bookmarks.remove(bookmark);
		}
	}
	
	public Itinerary () {}
	
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

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
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

	public List<ItineraryItem> getItineraryItems() {
		return itineraryItems;
	}

	public void setItineraryItems(List<ItineraryItem> itineraryItems) {
		this.itineraryItems = itineraryItems;
	}

	public List<ItineraryComment> getComments() {
		return comments;
	}

	public void setComments(List<ItineraryComment> comments) {
		this.comments = comments;
	}

	public List<Bookmark> getBookmarks() {
		return bookmarks;
	}

	public void setBookmarks(List<Bookmark> bookmarks) {
		this.bookmarks = bookmarks;
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
