package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBeerDAO implements BeerDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBeerDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Beer getBeerById(Long beerId) {
		Beer beer = new Beer();

		String sql = "SELECT br_id, name, style, abv, description, imgString " + "FROM beers " + "WHERE br_id = ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, beerId);

		rSet.next();

		beer = mapRowSetToBeer(rSet);

		return beer;
	}

	@Override
	public Beer getBeerByName(String name) {
		Beer beer = new Beer();

		String sql = "SELECT br_id, name, style, abv, description " + "FROM beers " + "WHERE name = ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, name);

		rSet.next();

		beer = mapRowSetToBeer(rSet);

		return beer;
	}

	@Override
	public List<Beer> searchBeer(String search) {
		List<Beer> beers = new ArrayList<>();

		String sqlSearch = "%" + search + "%";

		String sql = "SELECT br_id, name, imgString, style, abv, description " + "FROM beers "
				+ "WHERE name ILIKE ? OR style ILIKE ? OR description ILIKE ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, sqlSearch, sqlSearch, sqlSearch);

		while (rSet.next()) {
			beers.add(mapRowSetToBeer(rSet));
		}

		return beers;
	}

	@Override // String name, String style, String abv, String description, String imgString
	public long addNewBeer(String name, String style, String abv, String description, String imgString) {

		String sql = "INSERT INTO beers (name, style, abv, description, imgString) " + "VALUES (?, ?, ?, ?, ?) "
				+ "RETURNING br_id ";

		Long beerId = jdbcTemplate.queryForObject(sql, Long.TYPE, name, style, abv, description, imgString);

		return beerId;
	}

	@Override
	public void updateBeer(String name, String style, String abv, String description, String imgString) {

		String sql = "UPDATE beers " + "SET name = ?, style = ?, abv = ?, description = ?, imgString = ? "
				+ "WHERE name = ? ";

		jdbcTemplate.update(sql, name, style, abv, description, imgString);

	}

	@Override
	public void deleteBeer(String name) {

		String sql = "DELETE FROM beers " + "WHERE name = ? ";

		jdbcTemplate.update(sql, name);

	}

	public Beer mapRowSetToBeer(SqlRowSet rs) {
		Beer beer = new Beer();

		beer.setAbv(rs.getString("abv"));
		beer.setBrId(rs.getLong("br_id"));
		beer.setDescription(rs.getString("description"));
		beer.setName(rs.getString("name"));
		beer.setStyle(rs.getString("style"));
		beer.setImgString(rs.getString("imgString"));

		return beer;
	}

	@Override
	public ArrayList<Beer> getAllExistingBeers() {

		ArrayList<Beer> beers = new ArrayList<>();

		String sql = "SELECT br_id, name, imgString,  style, abv, description " + "FROM beers ";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql);

		while (rSet.next()) {
			beers.add(mapRowSetToBeer(rSet));
		}

		return beers;
	}

	@Override
	public ArrayList<Beer> getBeersOfSelectedBreweryById(Long id) {

		ArrayList<Beer> beers = new ArrayList<>();

		String sql = "SELECT beers.br_id, beers.name, beers.imgString,  beers.style, beers.abv, beers.description FROM beers "
				+ "JOIN breweries_beers ON breweries_beers.br_id = beers.br_id "
				+ "JOIN breweries ON breweries_beers.brw_id = breweries.brw_id " + "WHERE breweries.brw_id = ? ";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, id);

		while (rSet.next()) {
			beers.add(mapRowSetToBeer(rSet));
		}

		return beers;
	}

	@Override
	public ArrayList<Beer> getBeersOfSeletedBreweryByName(String name) {

		ArrayList<Beer> beers = new ArrayList<>();

		String sql = "SELECT beers.br_id, beers.name, beers.imgString,  beers.style, beers.abv, beers.description FROM beers "
				+ "JOIN breweries_beers ON breweries_beers.br_id = beers.br_id "
				+ "JOIN breweries ON breweries_beers.brw_id = breweries.brw_id " + "WHERE breweries.name = ? ";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, name);

		while (rSet.next()) {
			beers.add(mapRowSetToBeer(rSet));
		}

		return beers;
	}

	@Override
	public ArrayList<String> getAllBeerStyles() {
		ArrayList<String> styles = new ArrayList<>();

		String sql = "SELECT DISTINCT style FROM beers ";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql);

		while (rSet.next()) {
			styles.add(rSet.getString("style"));
		}

		return styles;
	}

	@Override
	public void addBeerToBrewery(long brwId, long brId) {
		
		String sql = "INSERT INTO breweries_beers(brw_id, br_id) " + 
				"VALUES(?, ?) ";
		
		jdbcTemplate.update(sql, brwId, brId);
		
	}
	

	
	

}
