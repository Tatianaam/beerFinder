package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.JDBCBeerDAO;
import com.techelevator.model.JDBCBeerReviewDAO;
import com.techelevator.model.JDBCUserFavsDAO;
import com.techelevator.model.JdbcBreweryReviewDao;
import com.techelevator.model.User;
import com.techelevator.model.YelpBusiness;
import com.techelevator.yelpApi.YelpApi;

@Controller
public class YelpController {

	private YelpApi api;
	private BreweryDAO brewerydao;
	private JDBCUserFavsDAO userFavDAO;

	@Autowired
	public YelpController(YelpApi api, BreweryDAO brewerydao, JDBCUserFavsDAO userFavDAO ) {
		this.api = api;
		this.userFavDAO = userFavDAO;
		this.brewerydao = brewerydao;

	}

	@RequestMapping(path = "/yelpList", method = RequestMethod.GET)
	public String showYelpList(ModelMap m, @RequestParam(defaultValue = "beer") String searchObject, @RequestParam(defaultValue = "Pittsburgh") String searchLocation) {
						
		List<YelpBusiness> yelps = api.getAllYelp(searchObject, searchLocation);

		m.addAttribute("yelps", yelps);

		return "yelpList";

	}
	
	@RequestMapping(path = "/yelpList", method = RequestMethod.POST)
	public String saveToFavFromYelp(HttpSession session, @RequestParam String[] brewery
//			 @RequestParam String address,  @RequestParam String img,  @RequestParam double rating
			) {
						
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("currentUser");
		Long userId = user.getUserID();
		List<Brewery> favBrewerys = userFavDAO.getFavBreweryList(userId);
		long brewery_id = brewerydao.AddBrewery(new Brewery(brewery[0], brewery[1], brewery[2], brewery[3]));
		
		boolean flag = true;
		for (Brewery b : favBrewerys) {
			if (b.getBrewery_id() == brewery_id) {
				flag = false;
			}
		}

		if (flag) {
			userFavDAO.addFavBrewery(userId, brewery_id);
		}
		return "redirect:/favoriteBrewery";


	}

}
