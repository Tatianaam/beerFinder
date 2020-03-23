package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBeerReviewDAO implements BeerReviewDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCBeerReviewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<BeerReview> getReviewsForSelectedBeer(Long id) {
		
		List<BeerReview> beerReviews = new ArrayList<BeerReview>();
		
		String sql = "SELECT br_id, reviewer_name, rating, review_body " + 
				"FROM beer_reviews " + 
				"WHERE br_id = ? ";
		
		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, id);
		
		while (rSet.next()) {
			beerReviews.add(mapRowToBeerReview(rSet));
		}
		
		return beerReviews;
	}

	@Override
	public void addBeerReview(Long id, String reviewer_name, int rating, String review_body) {
		
		String sql = "INSERT INTO beer_reviews(br_id, reviewer_name, rating, review_body) " + 
				"VALUES(?, ?, ?, ?) ";
		
		jdbcTemplate.update(sql, id, reviewer_name, rating, review_body);
		
	}

	@Override
	public double getRatingForSelectedBeer(Long id) {
		
		String sql = "SELECT ROUND(AVG(rating)::numeric, 1) FROM beer_reviews WHERE br_id = ? "; 
		
		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, id);
		
		rSet.next();
		
		double result = rSet.getDouble("round");
		
		return result;
	}
	
	public BeerReview mapRowToBeerReview(SqlRowSet rSet) {
		BeerReview bReview = new BeerReview();
		
		bReview.setBeerId(rSet.getLong("br_id"));
		bReview.setRating(rSet.getInt("rating"));
		bReview.setReviewBody(rSet.getString("review_body"));
		bReview.setReviewerName(rSet.getString("reviewer_name"));
		
		return bReview;
	};

}
