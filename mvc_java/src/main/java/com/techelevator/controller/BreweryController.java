package com.techelevator.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bouncycastle.crypto.engines.ISAACEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.JDBCBeerDAO;
import com.techelevator.model.JDBCBeerReviewDAO;
import com.techelevator.model.JDBCUserFavsDAO;
import com.techelevator.model.JdbcBreweryReviewDao;
import com.techelevator.model.User;

@Controller
public class BreweryController {

	private BreweryDAO brewerydao;
	private JDBCUserFavsDAO userFavDAO;
	private JdbcBreweryReviewDao breweryReviewDAO;
	private JDBCBeerDAO beerDao;
	private JDBCBeerReviewDAO beerReviewDAO;

	@Autowired
	public BreweryController(JDBCBeerReviewDAO beerReviewDAO, BreweryDAO brewerydao, JDBCUserFavsDAO userFavDAO,
			JdbcBreweryReviewDao breweryReviewDAO, JDBCBeerDAO beerDao) {

		this.brewerydao = brewerydao;
		this.breweryReviewDAO = breweryReviewDAO;
		this.userFavDAO = userFavDAO;
		this.beerReviewDAO = beerReviewDAO;
		this.beerDao = beerDao;

	}

	@RequestMapping(path = "/breweryInput", method = RequestMethod.GET)
	public String showBreweryInput(HttpSession session) {

		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}
		return "breweryInput";

	}

	@RequestMapping(path = "/breweryInput", method = RequestMethod.POST)
	public String addNewBeerForm(@ModelAttribute Brewery brewery, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		long id = brewerydao.AddBrewery(brewery);
		
		User user = (User) session.getAttribute("currentUser");
		long user_id = user.getUserID();
		
		brewerydao.addBreweryToBrewere(id, user_id);

		return "redirect:/addBeersToBrewery";

	}

	@RequestMapping(path = "/breweryList", method = RequestMethod.GET)
	public String showBreweryList(ModelMap m) {

		List<Brewery> brewerys = brewerydao.getAllBreweries();
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

		for (int i = 0; i < brewerys.size(); i++) {
			ratings.put(brewerys.get(i).getBrewery_id(),
					breweryReviewDAO.getRatingForSelectedBrewery(brewerys.get(i).getBrewery_id()));
		}

		m.addAttribute("brewerys", brewerys);
		m.addAttribute("ratings", ratings);

		return "breweryList";

	}

	@RequestMapping(path = "/breweryList", method = RequestMethod.POST)
	public String addFavorites(HttpSession session, @RequestParam long brewery_id) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();
		List<Brewery> favBrewerys = userFavDAO.getFavBreweryList(userId);

		boolean flag = true;
		for (Brewery brewery : favBrewerys) {
			if (brewery.getBrewery_id() == brewery_id) {
				flag = false;
			}
		}

		if (flag) {
			userFavDAO.addFavBrewery(userId, brewery_id);
		}
		return "redirect:/favoriteBrewery";

	}

	@RequestMapping(path = "/favoriteBrewery", method = RequestMethod.GET)
	public String displayFavBrewery(ModelMap m, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();

		List<Brewery> favBrewery = userFavDAO.getFavBreweryList(userId);
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

		for (int i = 0; i < favBrewery.size(); i++) {
			ratings.put(favBrewery.get(i).getBrewery_id(),
					breweryReviewDAO.getRatingForSelectedBrewery(favBrewery.get(i).getBrewery_id()));
		}

		m.addAttribute("ratings", ratings);
		m.addAttribute("favBrewerys", favBrewery);

		return "favoriteBrewery";
	}

	@RequestMapping(path = "/breweryBeerList", method = RequestMethod.GET)
	public String showBeerList(ModelMap m, HttpServletRequest request) {

		Long id = Long.valueOf(request.getParameter("brewery_id"));

		ArrayList<Beer> beers = beerDao.getBeersOfSelectedBreweryById(id);
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

		for (int i = 0; i < beers.size(); i++) {
			ratings.put(beers.get(i).getBrId(), beerReviewDAO.getRatingForSelectedBeer(beers.get(i).getBrId()));
		}

		m.addAttribute("beers", beers);
		m.addAttribute("ratings", ratings);

		return "breweryBeerList";

	}
	
	@RequestMapping(path = "/myBreweries", method = RequestMethod.GET)
	public String showMyBreweryList(ModelMap m, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();

		List<Brewery> brewerys = brewerydao.getBreweriesOfUser(userId);
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

		for (int i = 0; i < brewerys.size(); i++) {
			ratings.put(brewerys.get(i).getBrewery_id(),
					breweryReviewDAO.getRatingForSelectedBrewery(brewerys.get(i).getBrewery_id()));
		}

		m.addAttribute("brewerys", brewerys);
		m.addAttribute("ratings", ratings);

		return "myBreweries";

	}
	
	@RequestMapping(path = "/myBreweries", method = RequestMethod.POST)
	public String processMybrewery(HttpSession session, @RequestParam long brewery_id) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();
		List<Brewery> favBrewerys = userFavDAO.getFavBreweryList(userId);

		boolean flag = true;
		for (Brewery brewery : favBrewerys) {
			if (brewery.getBrewery_id() == brewery_id) {
				flag = false;
			}
		}

		if (flag) {
			userFavDAO.addFavBrewery(userId, brewery_id);
		}
		return "redirect:/addBeersToBrewery";

	}

}
