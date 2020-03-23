package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerReview;
import com.techelevator.model.JDBCBeerDAO;
import com.techelevator.model.JDBCBeerReviewDAO;
import com.techelevator.model.User;

@Controller
public class BeerReviewController {

	private JDBCBeerDAO beerDAO;
	private JDBCBeerReviewDAO beerReviewDAO;

	@Autowired
	public BeerReviewController(JDBCBeerDAO beerDAO, JDBCBeerReviewDAO beerReviewDAO) {
		this.beerDAO = beerDAO;
		this.beerReviewDAO = beerReviewDAO;

	}

	@RequestMapping(path = "/beerReviewInput", method = RequestMethod.GET)
	public String displayBeerReviewForm(ModelMap m, HttpServletRequest request, HttpSession session) {

		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		Long beerId = Long.valueOf(request.getParameter("beerId"));

		Beer beer = beerDAO.getBeerById(beerId);

		User user = (User) session.getAttribute("currentUser");
		String userName = user.getUserName();

		m.addAttribute("userName", userName);

		m.addAttribute("beer", beer);

		return "beerReviewInput";
	}

	@RequestMapping(path = "/beerReviewInput", method = RequestMethod.POST)
	public String processBeerReview(@Valid @ModelAttribute("beerReview") BeerReview beerFormValues,
			HttpServletRequest request, HttpSession session, BindingResult result, RedirectAttributes flash) {

		if (result.hasErrors()) {
			flash.addFlashAttribute("beerReview", beerFormValues);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "beerReview", result);
			return "redirect:/beerReviewInput";
		}

		Long beerId = Long.valueOf(request.getParameter("beerId"));

		User user = (User) session.getAttribute("currentUser");
		String userName = user.getUserName();

		beerReviewDAO.addBeerReview(beerId, userName, beerFormValues.getRating(), beerFormValues.getReviewBody());

		return "redirect:/beerReviews?beerId=" + beerId;

	}

	@RequestMapping(path = "/beerReviews", method = RequestMethod.GET)
	public String displayBeerReviews(HttpServletRequest request, ModelMap m) {

		Long beerId = Long.valueOf(request.getParameter("beerId"));

		List<BeerReview> reviews = beerReviewDAO.getReviewsForSelectedBeer(beerId);

		m.addAttribute("beer", beerDAO.getBeerById(beerId));

		m.addAttribute("reviews", reviews);

		return "beerReviews";
	}

}
