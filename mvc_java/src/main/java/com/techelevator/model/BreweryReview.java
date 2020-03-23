package com.techelevator.model;

public class BreweryReview {

	private long breweryReviewId;
	private long brewery_id;
	private String name;
	private int rating;
	private String reviews;

	public long getBreweryId() {
		return breweryReviewId;
	}

	public void setBreweryId(Long breweryId) {
		this.breweryReviewId = breweryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReviews() {
		return reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	public long getBrewery_id() {
		return brewery_id;
	}

	public void setBrewery_id(long brewery_id) {
		this.brewery_id = brewery_id;
	}

}
