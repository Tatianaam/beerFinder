<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:url value="/" var="mainHomePageURL" />
<c:url value="/login" var="loginURL" />
<c:url value="/newUser" var="newUserURL" />


<ul>
	<li class="homeButton is-primary"><a href="${mainHomePageURL}">Home</a></li>
	<li class="loginButton is-info"><a href="${loginURL}">Login</a></li>
	<li class="signupButton is-warning"><a href="${newUserURL}">Sign Up</a></li>

</ul>


