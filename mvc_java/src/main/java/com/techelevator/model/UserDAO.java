package com.techelevator.model;

import java.time.LocalDate;

public interface UserDAO {

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public User getUserByUserName(String userName);

	void saveUser(User user);

}
