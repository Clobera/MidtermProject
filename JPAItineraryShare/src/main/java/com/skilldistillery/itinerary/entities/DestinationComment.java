package com.skilldistillery.itinerary.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="destination_comment")
public class DestinationComment {

	@Id
	@GeneratedValue
	private int id;
	
	@Column(name="user_id")
	private int userId;
	
	private String post;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	private int reply;
	
	@Column(name="destination_id")
	private int destinationId;

	@Override
	public String toString() {
		return "DestinationComment [id=" + id + ", userId=" + userId + ", post=" + post + ", reply=" + reply
				+ ", destinationId=" + destinationId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(destinationId, id, post, reply, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DestinationComment other = (DestinationComment) obj;
		return destinationId == other.destinationId && id == other.id && Objects.equals(post, other.post)
				&& reply == other.reply && userId == other.userId;
	}
}
