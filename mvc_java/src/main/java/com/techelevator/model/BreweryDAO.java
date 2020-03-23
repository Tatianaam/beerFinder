package com.techelevator.model;

import java.util.List;

public interface BreweryDAO {

	List<Brewery> getAllBreweries();

	public long AddBrewery(Brewery brewery);

	public void updateBeer(String name, String daysOfOperation, String hoursOfOperation, String contactNumber,
			String streetAddress, String city, String state, String zip, String image, boolean isActive,
			String description);

	public void deleteBrewery(boolean active);

	public List<Brewery> searchBrewery(String search);
	
	public List<Brewery> getBreweriesOfUser(Long userId);

	public Brewery getBreweryById(Long breweryId);

	public void addBreweryToBrewere(long brw_id, long user_id);
}
