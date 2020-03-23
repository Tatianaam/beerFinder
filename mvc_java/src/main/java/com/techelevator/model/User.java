package com.techelevator.model;

import java.time.LocalDate;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	private String userName;
	private long userID;
	private String personalName;
	
	@Size(min=10, message="Password too short, must be at least 10")
	@Pattern.List({
		@Pattern(regexp=".*[a-z].*", message="Must have a lower case"),
		@Pattern(regexp=".*[A-Z].*", message="Must have a capital")
	})
	private String password;
	
	
	private LocalDate birthday;
	private String role;
	private String email;
	private String phone;
	private String city;
	private String state;
	private String zip;
	private String favBeer;
	
	
	private String confirmPassword;
	public String getUserName() {
		return userName;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return this.role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public LocalDate getBirthday() {
		return this.birthday;
	}
	public void setBirthday(LocalDate birthday) {
		birthday = this.birthday;
	} 
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getFavBeer() {
		return favBeer;
	}
	public void setFavBeer(String favBeer) {
		this.favBeer = favBeer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getUserID() {
		return this.userID;
	}
	public void setUserID(long userID) {
		this.userID = userID;
	}
	public String getPersonalName() {
		return this.personalName;
	}
	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}
}
