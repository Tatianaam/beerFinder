package com.techelevator.yelpApi;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.montealegreluis.yelpv3.Yelp;
import com.montealegreluis.yelpv3.businesses.Business;
import com.montealegreluis.yelpv3.businesses.SearchResult;
import com.montealegreluis.yelpv3.client.AccessToken;
import com.montealegreluis.yelpv3.client.Credentials;
import com.montealegreluis.yelpv3.search.SearchCriteria;
import com.techelevator.model.YelpBusiness;

@Component

public class YelpApi {

	public List<YelpBusiness> getAllYelp(String searchObject, String searchLocation) {

		AccessToken token = AccessToken.fromValues(
				"BF3e60EoQjkUUXfpzpZXt9oYcnbCqbW-mrCshz3gALolTox57"
						+ "_VnNXx0ATDqlj8fQryiDYTOFo9BjEZetTb7dz5t71U9gerN9qZ9RHjBTffQgMJvVYlyCAJrqqruXXYx",
				"Bearer", Long.MAX_VALUE);
		Credentials clientId = new Credentials("Kx_RzkHdSW8nVIY7XNOFtg", null);
		clientId.updateToken(token);

		Yelp yelp = new Yelp(clientId);

		SearchCriteria criteria = SearchCriteria.byLocation(searchLocation);
		criteria.withTerm(searchObject);
		SearchResult result = yelp.search(criteria).searchResult();

		List<YelpBusiness> apiList = new ArrayList<>();

		for (Business business : result.businesses) {
			YelpBusiness yB = new YelpBusiness(business.rating, business.pricingLevel, business.phone, business.id,
					business.isClosedPermanently, business.categories, business.reviewCount, business.name,
					business.url, business.coordinates, business.image, business.location, business.distance,
					business.transactions);

			System.out.println(yB.getLocation());
			yB.equals(business);
			// System.out.println("Name: " + yB.getName());

			apiList.add(yB);
			// System.out.println("Name: " + business.name);
		}
		return apiList;
	}

}
