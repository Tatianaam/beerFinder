package com.techelevator.model;

import java.util.List;

public interface BeerDAO {

	public Object getBeerById(Long beerId);

	public Object getBeerByName(String name);

	/***
	 * 
	 * @param name
	 * @param style
	 * @param abv
	 * @param description
	 * @return id of the beer
	 */
	// String name, String style, String abv, String description, String imgString
	public long addNewBeer(String name, String style, String abv, String description, String imgString);

	/***
	 * 
	 * @param name
	 * @param style
	 * @param abv
	 * @param description
	 * @return
	 */
	public void updateBeer(String name, String style, String abv, String description, String imgString);

	/***
	 * 
	 * @param name of the beer that needs to be deleted
	 */
	public void deleteBeer(String name);

	public List<Beer> getAllExistingBeers();

	public List<Beer> getBeersOfSelectedBreweryById(Long id);

	public List<Beer> getBeersOfSeletedBreweryByName(String name);
	
	public List<String> getAllBeerStyles();

	public List<Beer> searchBeer(String search);
	
	public void addBeerToBrewery(long brwId, long brId);
	
	

}
