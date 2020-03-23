package com.techelevator.model;

public class BeerReview {
	
	private long beerReviewId;
	private long beerId;
	private String reviewerName;
	private int rating;
	private String reviewBody;
	
	public long getBeerReviewId() {
		return beerReviewId;
	}
	public void setBeerReviewId(long beerReviewId) {
		this.beerReviewId = beerReviewId;
	}
	public long getBeerId() {
		return beerId;
	}
	public void setBeerId(long beerId) {
		this.beerId = beerId;
	}
	public String getReviewerName() {
		return reviewerName;
	}
	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewBody() {
		return reviewBody;
	}
	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}

}
