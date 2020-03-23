package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Brewery;
import com.techelevator.model.JdbcBreweryDao;

public class JdbcBreweryDaoIntegrationTest extends DAOIntegrationTest {

	private JdbcBreweryDao breweryDao = new JdbcBreweryDao(getDataSource());

	@Before
	public void setup() {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		String sqlInsertIntoBrewery = "INSERT INTO breweries VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

		jdbcTemplate.update(sqlInsertIntoBrewery, 9, "Penn State Brewery", "412-4356758", "mon-sun", "10am-2am", true,
				"312 penn ave", "Pittsburgh", "PA", "45001", "penn.jpg", "you will love this place");

		String SqlUpdate = "UPDATE breweries SET name = ?, days_open = ?, hours_open = ?, contact_no = ? ,streetaddress = ? , city = ? , state = ? , zip = ? , active = ?, imgstring = ?, description = ? ";

		String sqlDeleteBrewery = "DELETE FROM breweries WHERE isActive = ? ";
		jdbcTemplate.update(sqlDeleteBrewery, false);

		breweryDao = new JdbcBreweryDao(getDataSource());
	}

	@Test
	public void Test_Get_Brewery_List() {
		List<Brewery> breweriesList = new ArrayList<>();
		breweriesList = breweryDao.getAllBreweries();

		Brewery theBrewery = new Brewery();

		for (Brewery brewery : breweriesList) {
			if (brewery.getName().equalsIgnoreCase("Penn State Brewery"))
				theBrewery = brewery;
		}

		assertNotNull(theBrewery);
		assertNotNull(breweriesList);
		assertEquals("The City should be Pittsburgh", "Pittsburgh", theBrewery.getCity());

	}

//	@Test
//	public void Test_ADD_BREWERY() {
//		List<Brewery> breweriesList = new ArrayList<>();
//		breweriesList = breweryDao.getAllBreweries();
//		Brewery theBrewery = new Brewery();
//
//		for (Brewery brewery : breweriesList) {
//			if (brewery.getName().equalsIgnoreCase("Penn State Brewery"))
//				theBrewery = brewery;
//			assertNotNull(breweryDao.AddBrewery(theBrewery));
//		}
//
//	}

//	@Test
//	public void Test_Update_Beer() {
//		Brewery theBrewery = new Brewery();
//		breweryDao.updateBeer("CMU State Brewery", "Mon -fri", "9am-10pm", "451-3246578", "431 cmu ave", "Pittsburgh",
//				"PA", "74431", "cmu.jpg", false, "This place is permanently closed");
//		assertEquals("CMU State Brewery", theBrewery.getName());
//
//	}

	@Test
	public void Test_Delete_Brewery() {

		breweryDao.deleteBrewery(false);

	}
}
