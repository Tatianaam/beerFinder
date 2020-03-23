package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.BeerDAO;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserHomePageController {
	

	@Autowired
	UserDAO userDAO;
	@Autowired
	BeerDAO beerDAO;
	@Autowired
	BreweryDAO breweryDAO;
	
	@RequestMapping(path="/userpage",method=RequestMethod.GET)
	public String displayUserHomePage(HttpServletRequest request) {
		String userName = request.getParameter("user");
		User user = (User)userDAO.getUserByUserName(userName);
		
		
	
	return "userHomePage";
	
	}
	
	@RequestMapping(path="/brewerHomepage",method=RequestMethod.GET)
	public String displayBrewerHomepage(ModelMap modelHolder, HttpSession session) {
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		} else {
			User currentUser = (User)session.getAttribute("currentUser");
			switch (currentUser.getRole()) {
			case "brewer":
				return "brewerHomepage";
			default:
				return "redirect:/";
			}
		}
	}	
}