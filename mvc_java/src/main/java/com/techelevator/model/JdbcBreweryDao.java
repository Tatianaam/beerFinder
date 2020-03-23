package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcBreweryDao implements BreweryDAO {

	private JdbcTemplate jdbcTemplate;

	private static final String BREWERY_LIST = "SELECT breweries.brw_id,breweries.name,breweries.contact_no,breweries.days_open,breweries.hours_open,breweries.active,breweries.street_address,breweries.city,breweries.state,breweries.zip, breweries.imgstring,breweries.description,brewery_reviews.rating"
			+ " FROM breweries" + " LEFT JOIN brewery_reviews ON breweries.brw_id = brewery_reviews.brw_id; ";

	private static final String SAVE_BREWERY = "INSERT INTO breweries (name,contact_no,days_open,hours_open,active,street_address, city, state, zip,imgstring,description)"
			+ "VALUES(?,?,?,?,?,?,?,?,?,?,?) RETURNING brw_id ";
	private static final String SQL_UPDATE = "UPDATE breweries SET name = ?, days_open = ?, hours_open = ? , contact_no = ? ,streetaddress = ? , city = ? , state = ? , zip = ? , active = ?, imgstring = ?, description = ? ";

	private static final String SQL_DELETE = "DELETE FROM breweries WHERE isActive = ? ";

	@Autowired
	public JdbcBreweryDao(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public List<Brewery> getAllBreweries() {
		List<Brewery> breweryList = new ArrayList<>();
		SqlRowSet result = jdbcTemplate.queryForRowSet(BREWERY_LIST);
		while (result.next()) {
			Brewery brewery = mapRowToBrewery(result);
			breweryList.add(brewery);
		}
		return breweryList;
	}

	public Brewery mapRowToBrewery(SqlRowSet result) {
		Brewery brewery = new Brewery();

		brewery.setBrewery_id(result.getLong("brw_id"));
		// brewery.setBrewery_id(result.getLong("brw_id"));
		brewery.setName(result.getString("name"));
		brewery.setStreetAddress(result.getString("street_address"));
		brewery.setCity(result.getString("city"));
		brewery.setState(result.getString("state"));
		brewery.setZipCode(result.getString("zip"));
		// brewery.setRating(result.getString("rating"));
		brewery.setImg(result.getString("imgString"));
		brewery.setDescription(result.getString("description"));

		return brewery;

	}

	@Override
	public void updateBeer(String name, String daysOfOperation, String hoursOfOperation, String contactNumber,
			String streetAddress, String city, String state, String zip, String image, boolean isActive,
			String description) {

		String sql = SQL_UPDATE;
		jdbcTemplate.update(sql, name, daysOfOperation, hoursOfOperation, contactNumber, streetAddress, city, state,
				zip, isActive, image);

	}

	@Override
	public void deleteBrewery(boolean active) {
		String sql = SQL_DELETE;

		jdbcTemplate.update(sql, active);

	}

	@Override
	public List<Brewery> searchBrewery(String search) {
		List<Brewery> breweries = new ArrayList<>();
		String sqlSearch = "%" + search + "%";

		String sql = "SELECT * " + "FROM breweries " + "WHERE name ILIKE ? OR description ILIKE ?";

		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, sqlSearch, sqlSearch);

		while (rSet.next()) {
			breweries.add(mapRowToBrewery(rSet));
		}

		return breweries;
	}

	@Override
	public long AddBrewery(Brewery brewery) {

		String sqlInsert = SAVE_BREWERY;
		
		long id = jdbcTemplate.queryForObject(sqlInsert, Long.TYPE, brewery.getName(), brewery.getContactNumber(), brewery.getDaysOpen(),
				brewery.getHoursOpen(), brewery.isActive(), brewery.getStreetAddress(), brewery.getCity(),
				brewery.getState(), brewery.getZipCode(), brewery.getImg(), brewery.getDescription());
		

		return id;
	}

	@Override
	public ArrayList<Brewery> getBreweriesOfUser(Long userId) {
		
		ArrayList<Brewery> breweries = new ArrayList<>();
		
		String sqlString = "SELECT * FROM breweries " + 
				"JOIN app_user_breweries ON app_user_breweries.brw_id = breweries.brw_id " + 
				"JOIN app_user ON app_user_breweries.user_id = app_user.id " + 
				"WHERE app_user.id = ? ";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sqlString, userId);
		
		while (rowSet.next()) {
			breweries.add(mapRowToBrewery(rowSet));
		}
		
		return breweries;
	}
	
	public Brewery getBreweryById(Long breweryId) {

		Brewery brewery = new Brewery();
		String sql = "SELECT * FROM breweries WHERE brw_id = ?";
		SqlRowSet rSet = jdbcTemplate.queryForRowSet(sql, breweryId);
		rSet.next();
		brewery = mapRowToBrewery(rSet);

		return brewery;
	}
	
	public void addBreweryToBrewere(long brw_id, long user_id) {
		
		String sqlString ="INSERT INTO app_user_breweries(user_id, brw_id) " + 
				"VALUES(?, ?) ";
		
		jdbcTemplate.update(sqlString, user_id, brw_id);
	}

}
