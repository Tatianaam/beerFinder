package com.techelevator.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.JDBCBeerDAO;
import com.techelevator.model.JDBCBeerReviewDAO;
import com.techelevator.model.JdbcBreweryDao;
import com.techelevator.model.User;

@Controller
public class AddBeerToBreweryController {

	private JDBCBeerDAO beerDAO;
	private JdbcBreweryDao breweryDao;
	private JDBCBeerReviewDAO beerReviewDAO;

	@Autowired
	private AddBeerToBreweryController(JDBCBeerDAO beerDAO, JdbcBreweryDao breweryDao,
			JDBCBeerReviewDAO beerReviewDAO) {
		this.beerDAO = beerDAO;
		this.breweryDao = breweryDao;
		this.beerReviewDAO = beerReviewDAO;
	}

	@RequestMapping(path = "/addBeersToBrewery", method = RequestMethod.GET)
	public String displayBeerList(ModelMap m, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();

		ArrayList<Beer> beers = beerDAO.getAllExistingBeers();
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();
		ArrayList<Brewery> breweries = breweryDao.getBreweriesOfUser(userId);

		for (int i = 0; i < beers.size(); i++) {
			ratings.put(beers.get(i).getBrId(), beerReviewDAO.getRatingForSelectedBeer(beers.get(i).getBrId()));
		}

		m.addAttribute("beers", beers);
		m.addAttribute("ratings", ratings);
		m.addAttribute("breweries", breweries);

		return "addBeersToBrewery";
	}

	@RequestMapping(path = "/addBeersToBrewery", method = RequestMethod.POST)
	public String addFavourites(HttpSession session, @RequestParam long brId, @RequestParam long brwId) {

		List<Beer> beersOfBrw = beerDAO.getBeersOfSelectedBreweryById(brwId);

		boolean flag = true;
		for (Beer beer : beersOfBrw) {
			if (beer.getBrId() == brId) {
				flag = false;
			}
		}

		if (flag) {
			beerDAO.addBeerToBrewery(brwId, brId);
		}

		//return "redirect:/breweryBeerList?brewery_id=" + brwId;
		return "redirect:/addBeersToBrewery";
	}
}
