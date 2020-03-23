package com.techelevator.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Beer;
import com.techelevator.model.JDBCBeerDAO;
import com.techelevator.model.JDBCBeerReviewDAO;
import com.techelevator.model.JDBCUserFavsDAO;
import com.techelevator.model.User;

@Controller
public class BeerController {

	private JDBCBeerDAO beerDAO;
	private JDBCBeerReviewDAO beerReviewDAO;
	private JDBCUserFavsDAO userFavDAO;

	@Autowired
	public BeerController(JDBCBeerDAO beerDAO, JDBCBeerReviewDAO beerReviewDAO, JDBCUserFavsDAO userFavDAO) {
		this.beerDAO = beerDAO;
		this.beerReviewDAO = beerReviewDAO;
		this.userFavDAO = userFavDAO;

	}

	@RequestMapping(path = "/beerList", method = RequestMethod.GET)
	public String displayBeerList(ModelMap m) {

		ArrayList<Beer> beers = beerDAO.getAllExistingBeers();
		Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

		for (int i = 0; i < beers.size(); i++) {
			ratings.put(beers.get(i).getBrId(), beerReviewDAO.getRatingForSelectedBeer(beers.get(i).getBrId()));
		}

		m.addAttribute("beers", beers);
		m.addAttribute("ratings", ratings);

		return "beerList";
	}

	@RequestMapping(path = "/beerList", method = RequestMethod.POST)
	public String addFavourites(HttpSession session, @RequestParam long brId) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();

		List<Beer> favBeers = userFavDAO.getFavBeerList(userId);

		boolean flag = true;
		for (Beer beer : favBeers) {
			if (beer.getBrId() == brId) {
				flag = false;
			}
		}

		if (flag) {
			userFavDAO.addFavBeer(userId, brId);
		}

		return "redirect:/favoriteBeers";
	}

	@RequestMapping(path = "/favoriteBeers", method = RequestMethod.GET)
	public String displayFavBeers(ModelMap m, HttpSession session) {
		if (session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		} else {
			User user = (User) session.getAttribute("currentUser");
			Long userId = user.getUserID();

			List<Beer> favBeers = userFavDAO.getFavBeerList(userId);

			Map<Long, Double> ratings = new LinkedHashMap<Long, Double>();

			for (int i = 0; i < favBeers.size(); i++) {
				ratings.put(favBeers.get(i).getBrId(),
						beerReviewDAO.getRatingForSelectedBeer(favBeers.get(i).getBrId()));
			}

			m.addAttribute("ratings", ratings);
			m.addAttribute("favBeers", favBeers);

			return "favoriteBeers";
		}
	}

	@RequestMapping(path = "/newBeerInput", method = RequestMethod.GET)
	public String displayNewBeerInputForm(ModelMap m, HttpSession session) {

		if (session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		} else {
			User currentUser = (User) session.getAttribute("currentUser");
			switch (currentUser.getRole()) {
			case "brewer":
				List<String> styles = beerDAO.getAllBeerStyles();

				m.addAttribute("styles", styles);

				return "newBeerInput";
			default:
				return "redirect:/";
			}
		}
	}

	@RequestMapping(path = "/newBeerInput", method = RequestMethod.POST)
	public String processNewBeerForm(@ModelAttribute("beerObject") Beer beerFormValues, HttpServletRequest request,
			HttpSession session) {

		beerDAO.addNewBeer(beerFormValues.getName(), beerFormValues.getStyle(), beerFormValues.getAbv(),
				beerFormValues.getDescription(), beerFormValues.getImgString());

		return "redirect:/beerList";

	}

}
