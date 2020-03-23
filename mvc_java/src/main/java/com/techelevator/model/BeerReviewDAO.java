package com.techelevator.model;

import java.util.List;

public interface BeerReviewDAO {
	
	public List<BeerReview> getReviewsForSelectedBeer(Long id);
	
	public void addBeerReview(Long id, String reviewer_name, int rating, String review_body);
	
	public double getRatingForSelectedBeer(Long id);

}
