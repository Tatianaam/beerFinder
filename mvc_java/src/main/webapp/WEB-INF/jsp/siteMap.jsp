<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="homePageHref" value="/" />
<c:url var="signUpHref" value="/users/new" />
<c:url var="logInHref" value="/login" />
<c:url var="resultsHref" value="/results" />
<c:url var="profileHref" value="/userpage?user=test_user" />
<c:url var="breweryListHref" value="/breweryList" />
<c:url var="userPrefHref" value="/user/preferences" />
<c:url var="beerListHref" value="/beerList" />
<c:url var="guinnessReviewHref" value="/viewBeerReviews?beerId=4" />
<c:url var="newBeerReviewHref" value="/beerReviewInput" />

<div class="container is-fluid">

<div class="buttons">
<a class="button is-info is-medium is-light" 
	href="${homePageHref}">Home</a>
<a class="button is-info is-medium is-light" 
	href="${signUpHref}">Sign up</a>
<a class="button is-info is-medium is-light" 
	href="${logInHref}">Log in</a>
	<a class="button is-info is-medium is-light" 
	href="${logInHref}">Test results</a>
<a class="button is-info is-medium is-light" 
	href="${profileHref}">Test Profile</a>
<a class="button is-info is-medium is-light" 
	href="${breweryListHref}">All Breweries</a>
<a class="button is-info is-medium is-light" 
	href="${beerListHref}">Beer List</a>
<a class="button is-info is-medium is-light" 
	href="${guinnessReviewHref}">Guinness reviews</a>
<a class="button is-info is-medium is-light" 
	href="${newBeerReviewHref}">New Beer Review</a>



</div>

</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />
