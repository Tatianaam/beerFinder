package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class AuthenticationController {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, 
						@RequestParam String password, 
						@RequestParam(required=false) String destination,
						HttpSession session) {
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			User currentUser = (User)userDAO.getUserByUserName(userName);
			session.setAttribute("currentUser", currentUser);
			
			if(destination != null && ! destination.isEmpty()) {
				return "redirect:" + destination;
			} else if (currentUser.getRole().equals("beer_lover")){
				return "redirect:/userpage?user=" + userName ;
			} else {
				return "redirect:/";
			}
		} else {
			return "redirect:/login";
		}
	}


	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}
}
