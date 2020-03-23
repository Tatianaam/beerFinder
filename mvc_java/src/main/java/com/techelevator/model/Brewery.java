package com.techelevator.model;

public class Brewery {

	private long brewery_id;
	private String name;
	private String StreetAddress;
	private String contactNumber;
	private String daysOpen;
	private String hoursOpen;
	private String isActive;
	private String city;
	private String zipCode;
	private String state;
	private String rating;
	private String img;
	private String description;
	
	public Brewery() {
		
	}
	
	public Brewery(String name, String address, String img, String rating) {
		this.name = name;
		this.StreetAddress = address;
		this.img = img;
		this.rating = rating;
	}

	public String getDaysOpen() {
		return daysOpen;
	}

	public void setDaysOpen(String daysOpen) {
		this.daysOpen = daysOpen;
	}

	public String getHoursOpen() {
		return hoursOpen;
	}

	public void setHoursOpen(String hoursOpen) {
		this.hoursOpen = hoursOpen;
	}

	public String isActive() {
		return isActive;
	}

	public void setActive(String isActive) {
		this.isActive = isActive;
	}

	public long getBrewery_id() {
		return brewery_id;
	}

	public void setBrewery_id(long brewery_id) {
		this.brewery_id = brewery_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreetAddress() {
		return StreetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		StreetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Brewery [StreetAddress=" + StreetAddress + ", city=" + city + ", zipCode=" + zipCode + ", state="
				+ state + "]";
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
