package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerDAO;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.UserDAO;

@Controller
public class MainHomePageController {

	@Autowired
	UserDAO userDAO;
	@Autowired
	BeerDAO beerDAO;
	@Autowired
	BreweryDAO breweryDAO;

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String displayMainHomePage() {

		return "homePageYELP";

	}

	@RequestMapping(path = "/results", method = RequestMethod.GET)
	public String displaySearchResults(@RequestParam("search") String search, @RequestParam("category") String category,
			ModelMap modelHolder) {

		switch (category) {
		case "beer":
			List<Beer> beerResults = beerDAO.searchBeer(search);
			modelHolder.put("results", beerResults);
			break;
		case "brewery":
			modelHolder.put("results", breweryDAO.searchBrewery(search));
			break;
		}
		return "results";

	}

	@RequestMapping(path = "/map", method = RequestMethod.GET)
	public String displaySiteMap() {

		return "siteMap";

	}

}