package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcBreweryReviewDao implements BreweryReviewDao {

	private JdbcTemplate jdbcTemplate;

	private static final String BREWERY_REVIEW = "SELECT brw_r_id,brw_id,reviewer_name,rating,review_body FROM brewery_reviews";

	private static final String RATED_BREWERY = "SELECT AVG(rating) brw_r_id,reviewer_name,review_body FROM brewery_reviews  GROUP BY reviewer_name,review_body LIMIT 5";

	@Autowired
	public JdbcBreweryReviewDao(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

//	@Override
//	public List<BreweryReview> getAllBreweryReview() {
//		List<BreweryReview> theReview = new ArrayList<>();
//		SqlRowSet result = jdbcTemplate.queryForRowSet(BREWERY_REVIEW);
//		while (result.next()) {
//			BreweryReview review = mapRowToBreweryReview(result);
//			theReview.add(review);
//		}
//		return theReview;
//	}
//
//	@Override
//	public BreweryReview getMostFamousBrewery(String name) {
//		BreweryReview review = new BreweryReview();
//		// String sqlSelectReviewByName = (RATED_BREWERY)
//		return null;
//	}

	@Override
	public double getRatingForSelectedBrewery(long id) {

		String sql = "SELECT ROUND(AVG(rating)::numeric, 1) FROM brewery_reviews WHERE brw_id = ? ";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, id);

		rSet.next();

		double result = rSet.getDouble("round");

		return result;
	}

	public BreweryReview mapRowToBreweryReview(SqlRowSet rSet) {
		BreweryReview review = new BreweryReview();
		review.setBreweryId(rSet.getLong("brw_id"));
		review.setName(rSet.getString("reviewer_name"));
		review.setRating(rSet.getInt("rating"));
		review.setReviews(rSet.getString("review_body"));

		return review;

	}

	@Override
	public List<BreweryReview> getReviewForSelectedBRewery(long id) {
		List<BreweryReview> breweryReviews = new ArrayList<>();
		String sql = "SELECT brw_id, reviewer_name,rating,review_body FROM brewery_reviews WHERE brw_id = ?";
		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, id);

		while (rSet.next()) {
			breweryReviews.add(mapRowToBreweryReview(rSet));
		}
		return breweryReviews;
	}

	@Override
	public void addBreweryReview(long id, String reviewer_name, int rating, String review_body) {
		String sql = "INSERT INTO brewery_reviews(brw_id, reviewer_name, rating, review_body)" + "VALUES(?, ?, ?, ?)";

		jdbcTemplate.update(sql, id, reviewer_name, rating, review_body);

	}

}
