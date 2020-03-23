<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<body>
<head>
<title>Beer Finder</title>
<c:url var="bootstrapCss" value="/css/bootstrap.min.css" />
<c:url var="bulmaCss" value="/css/bulmaswatch.united.min.css" />
<c:url var="siteCss" value="/css/site.css" />

<c:url var="jQueryJs" value="/js/jquery.min.js" />
<c:url var="jqValidateJs" value="/js/jquery.validate.min.js" />
<c:url var="jqvAddMethJs" value="/js/additional-methods.min.js" />
<c:url var="jqTimeagoJs" value="/js/jquery.timeago.js" />
<c:url var="popperJs" value="/js/popper.min.js" />
<c:url var="bootstrapJs" value="/js/bootstrap.min.js" />

<link rel="stylesheet" type="text/css" href="${bootstrapCss}">
<link rel="stylesheet" type="text/css" href="${siteCss}">

<script src="${jQueryJs}"></script>
<script src="${jqValidateJs}"></script>
<script src="${jqvAddMethJs}"></script>
<script src="${jqTimeagoJs}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});

		var pathname = window.location.pathname;
		$("nav a[href='" + pathname + "']").parent().addClass("active");

	});
</script>
<style>
.box {
	background-color: rgba(255, 255, 255, .85);
}

.navbar {
	margin: 0px;
}

.has-bg-img {
	background: url("img/background.jpg") center center;
	background-size: cover;
}
</style>
<c:url var="homePageHref" value="/" />
</head>
<body class="has-text-black-bis hero has-bg-img is-fullheight ">

	<header style="background-color: rgba(129, 230, 132, .75);">
		<div class="hero-head "
			style="padding: 0.25rem; background-color: rgba(129, 230, 132, .65);">
			<div class="is-size-5">

				<c:url var="homePageHref" value="/" />
				<c:url var="signUpHref" value="/users/new" />
				<c:url var="logInHref" value="/login" />
				<c:url var="logoutAction" value="/logout" />
				<c:url var="profileHref"
					value="/userpage?user=${currentUser.userName}" />
				<c:url var="brewerHref" value="/brewerHomepage" />
				<c:url var="breweryListHref" value="/breweryList" />
				<c:url var="beerListHref" value="/beerList" />
				<c:url var="addBeerHref" value="/newBeerInput" />
				<c:url var="addBreweryHref" value="/breweryInput" />
				<c:url var="favBeersHref" value="/favoriteBeers" />
				<c:url var="favBreweriesHref" value="/favoriteBrewery" />
				<c:url var="userPrefHref" value="/user/preferences" />
				<c:url var="addBeersHref" value="/addBeersToBrewery" />

				<nav class="navbar is-success">

					<div class="navbar-menu is-size-5">
					
						<div class="navbar-start">
						
						<div class="navbar-item">
							<a class="navbar-item is-size-4 has-text-white has-text-weight-bold"  href="${homePageHref}" >Brewery
								Finder</a> <a class="navbar-burger" role="button" aria-label="menu"
								aria-expanded="false"><span aria-hidden="true"></span><span
								aria-hidden="true"></span><span aria-hidden="true"></span></a>
						</div>
						
							<c:if test="${currentUser.role == 'beer_lover'}">
								<div class="navbar-item has-dropdown is-hoverable">
									<a class="navbar-link"> User Menu </a>
									<div class="navbar-dropdown">
										<a class="navbar-item" href="${profileHref}">Profile</a> <a
											class="navbar-item" href="${favBeersHref}">Favorite Beers</a>
										<a class="navbar-item" href="${favBreweriesHref}">Favorite
											Breweries</a>
									</div>
								</div>
							</c:if>
							<c:if test="${currentUser.role == 'brewer'}">
								<div class="navbar-item has-dropdown is-hoverable">
									<a class="navbar-link"> User Menu </a>
									<div class="navbar-dropdown">
										<a class="navbar-item" href="${brewerHref}">Brewer Home</a> <a
											class="navbar-item" href="${addBeerHref}">Add a Beer</a> <a
											class="navbar-item" href="${addBreweryHref}">Add a
											Brewery</a>
											<a
											class="navbar-item" href="${addBeersHref}">Change Beer Lists</a>
									</div>
								</div>
							</c:if>
							<a class="navbar-item" href="${breweryListHref}">All
								Breweries</a> <a class="navbar-item" href="${beerListHref}">All
								Beers</a>
						</div>
						<div class="navbar-end">
							<c:choose>
								<c:when test="${empty currentUser}">


									<div class="navbar-item is-size-5">
										<a class="button is-size-5 is-success is-light"
											href="${signUpHref}">Sign up</a>
									</div>
									<div class="navbar-item is-size-5">
										<a class="button is-size-5 is-success is-light " href="${logInHref}">Log in</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="navbar-item is-size-5">
										<span
											class="navbar-item has-text-white is-size-5 has-text-centered">Welcome,
											${currentUser.userName}!</span>
									</div>
									<div class="navbar-item is-size-5">
										<form id="logoutForm" action="${logoutAction}" method="POST">
											<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
										</form>
										<a class="button is-success is-light" id="logoutLink"> Log
											out </a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</header>

	<section class="section">
		<div class="container ">