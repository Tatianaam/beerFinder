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

import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryReview;
import com.techelevator.model.JdbcBreweryDao;
import com.techelevator.model.JdbcBreweryReviewDao;
import com.techelevator.model.User;

@Controller
public class BreweryReviewController {

	private JdbcBreweryDao breweryDao;
	private JdbcBreweryReviewDao BreweryReviewDao;

	@Autowired
	public BreweryReviewController(JdbcBreweryDao breweryDao, JdbcBreweryReviewDao BreweryReviewDao) {
		this.breweryDao = breweryDao;
		this.BreweryReviewDao = BreweryReviewDao;
	}

	@RequestMapping(path = "/breweryReviewInput", method = RequestMethod.GET)
	public String displayBeerReviewForm(ModelMap m, HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		Long breweryId = Long.valueOf(request.getParameter("brewery_id"));

		Brewery brewery = breweryDao.getBreweryById(breweryId);

		User user = (User) session.getAttribute("currentUser");

		String userName = user.getUserName();

		m.addAttribute("userName", userName);

		m.addAttribute("brewery", brewery);

		return "breweryReviewInput";
	}

	@RequestMapping(path = "/breweryReviewInput", method = RequestMethod.POST)
	public String processBreweryReview(@Valid @ModelAttribute("breweryReview") BreweryReview breweryFormValues,
			HttpServletRequest request, HttpSession session, BindingResult result, RedirectAttributes flash) {

		if (result.hasErrors()) {
			flash.addFlashAttribute("breweryReview", breweryFormValues);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "breweryReview", result);
			return "redirect:/breweryReviewInput";
		}

		Long breweryId = Long.valueOf(request.getParameter("brewery_id"));

		User user = (User) session.getAttribute("currentUser");
		String userName = user.getUserName();

		BreweryReviewDao.addBreweryReview(breweryId, userName, breweryFormValues.getRating(),
				breweryFormValues.getReviews());

		return "redirect:/breweryReviews?brewery_id=" + breweryId;

	}

	@RequestMapping(path = "/breweryReviews", method = RequestMethod.GET)
	public String displayBreweryReviews(HttpServletRequest request, ModelMap m) {

		Long breweryId = Long.valueOf(request.getParameter("brewery_id"));

		List<BreweryReview> reviews = BreweryReviewDao.getReviewForSelectedBRewery(breweryId);

		m.addAttribute("brewery", breweryDao.getBreweryById(breweryId));

		m.addAttribute("reviews", reviews);

		return "breweryReviews";
	}

}
