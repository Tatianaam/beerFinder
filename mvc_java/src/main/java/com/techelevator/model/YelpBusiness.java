package com.techelevator.model;

import java.net.URL;
import java.util.List;

import com.montealegreluis.yelpv3.businesses.Business;
import com.montealegreluis.yelpv3.businesses.Categories;
import com.montealegreluis.yelpv3.businesses.Coordinates;
import com.montealegreluis.yelpv3.businesses.Location;
import com.montealegreluis.yelpv3.businesses.PricingLevel;
import com.montealegreluis.yelpv3.businesses.Transaction;
import com.montealegreluis.yelpv3.businesses.distance.Distance;

public class YelpBusiness extends Business {

	public YelpBusiness(double rating, PricingLevel pricingLevel, String phone, String id, boolean isClosedPermanently,
			Categories categories, int reviewCount, String name, URL url, Coordinates coordinates, URL image,
			Location location, Distance distance, List<Transaction> transactions) {

		super(rating, pricingLevel, phone, id, isClosedPermanently, categories, reviewCount, name, url, coordinates,
				image, location, distance, transactions);

	}

	public double getRating() {
		return rating;
	}

	public PricingLevel getPricingLevel() {
		return pricingLevel;
	}

	public String getPhone() {
		return phone;
	}

	public String getId() {
		return id;
	}

	public boolean isClosedPermanently() {
		return isClosedPermanently;
	}

	public Categories getCategories() {
		return categories;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public String getName() {
		return name;
	}

	public URL getUrl() {
		return url;
	}

	public Coordinates getCoordinates() {
		return coordinates;
	}

	public URL getImage() {
		return image;
	}

	public String getLocation() {
		return location.address1.concat(" ").concat(location.city).concat(" ").concat(location.country).concat(" ")
				.concat(location.zipCode);
	}

	public Distance getDistance() {
		return distance;
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

}
