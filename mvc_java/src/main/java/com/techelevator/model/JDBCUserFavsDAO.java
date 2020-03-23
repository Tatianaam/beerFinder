package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCUserFavsDAO {

	private JdbcTemplate jdbcTemplate;
	private JdbcBreweryDao brewDAO;
	private JDBCBeerDAO beerDAO;

	@Autowired
	public JDBCUserFavsDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.brewDAO = new JdbcBreweryDao(dataSource);
		this.beerDAO = new JDBCBeerDAO(dataSource);
	}

	public List<Beer> getFavBeerList(long userID) {

		List<Beer> favBeers = new ArrayList<Beer>();

		String sql = "SELECT * FROM beers AS b " + "JOIN fav_beers AS fb ON fb.br_id = b.br_id "
				+ "WHERE fb.user_id = ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, userID);

		while (rSet.next()) {
			favBeers.add(beerDAO.mapRowSetToBeer(rSet));
		}

		return favBeers;
	}

	public void addFavBeer(long userID, long beerID) {

		String sql = "INSERT INTO fav_beers(user_id, br_id) " + "VALUES(?, ?) ";

		jdbcTemplate.update(sql, userID, beerID);

	}

	public List<Brewery> getFavBreweryList(long userID) {
		List<Brewery> favBreweries = new ArrayList<Brewery>();

		String sql = "SELECT * FROM breweries AS brw JOIN fav_breweries AS fbrw ON fbrw.brw_id = brw.brw_id WHERE fbrw.user_id = ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, userID);

		while (rSet.next()) {
			favBreweries.add(brewDAO.mapRowToBrewery(rSet));
		}

		return favBreweries;
	}

	public void addFavBrewery(long userID, long breweryID) {

		String sql = "INSERT INTO fav_breweries(user_id, brw_id) " + "VALUES(?, ?) ";

		jdbcTemplate.update(sql, userID, breweryID);
	}

}
