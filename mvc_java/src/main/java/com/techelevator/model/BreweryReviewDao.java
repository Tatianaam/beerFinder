package com.techelevator.model;

import java.util.List;

public interface BreweryReviewDao {

	List<BreweryReview> getReviewForSelectedBRewery(long id);

	public void addBreweryReview(long id, String reviewer_name, int rating, String review_body);

	public double getRatingForSelectedBrewery(long id);

}
