<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<!-- Main container -->

<div class="container is-fluid">
<nav class="level">

		<div class="level-right">
			<div class="level-item">
				<p class="title">Search Results</p>
			</div>
		</div>

		<div class="level-right">
			<div class="level-item">
			<c:url var="formAction" value="/results" />
			<form method="GET" action="${formAction}">
				<div class="field has-addons">

					<p class="control">
						<input class="input is-medium" type="text"
							placeholder="Find a brewery or beer" name="search" id="search">
					</p>
					<p class="control">
						<span class="select is-medium"> <select name="category" id="category">
					<option value="beer">Beer</option>
					<option value="brewery">Brewery</option>
			</select>
						</span>
					</p>
					<p class="control">
						<button class="button is-info is-medium" type="submit"> Search </button>
					</p>
				</div>
				</form>
			</div>
		</div>
	</nav>
<table class="table">
<thead>
	<tr>
	<th>#</th>
	<th></th>
	<th>Name</th>
	<th>Description</th>
	</tr>

</thead>
<tbody>
	
	<c:forEach items="${results}" var="result">
	<c:choose><c:when test="${param.category == 'brewery'}">
		<c:url var="imgUrl" value="img/BreweryImgs/${result.img}" />
		<c:url var="infoUrl" value="/breweryReviewInput?brewery_id=${result.brewery_id}" />
	</c:when>
	<c:otherwise>
		<c:url var="imgUrl" value="img/BeerImgs/${result.imgString}" />
		<c:url var="infoUrl" value="/beerReviewInput?beerId=${result.brId}" />
	</c:otherwise></c:choose>
		<tr>
  	  	<th>#</th>
      	<td><img src="${imgUrl}" class="image is-48x48" alt="${result.name}" /></td>
      <td><a href="${infoUrl}">${result.name}</a></td>
      <td>${result.description}</td>
   </tr>
	
	
	</c:forEach>
  <!--<tr>
  	  <th>1</th>
      <td><img src="img/BreweryImgs/gristhouse.jpg" class="image is-48x48" alt="Grist House Craft Brewery" /></td>
      <td>Grist House Craft Brewery</td>
      <td>Bring your family, bring your dog, everyone is welcome here.</td>
   </tr>
   <tr>
   	  <th>2</th>
      <td><img src="img/BreweryImgs/eastend.jpg" class="image is-48x48" alt="Grist House Craft Brewery" /></td>
      <td>East End Brewing Company</td>
      <td>Local brewery offering tours, a tasting room & house beers for sale by the growler or keg.</td>
   </tr>
   <tr>
   	  <th>3</th>
      <td><img src="img/BreweryImgs/rivertown.jpg" class="image is-48x48" alt="Grist House Craft Brewery" /></td>
      <td>Rivertowne Pour House</td>
      <td>Microbrewery offering a variety of house beers, comfort food & a full bar amid Amish furnishings.</td>
   </tr>
   </tbody> -->
  </table>
	<!--   <nav class="level">

		<div class="level-right">
			<div class="level-item">
				<p class="title">Search Results</p>
			</div>
		</div>

		<div class="level-right">
			<div class="level-item">
				<div class="field has-addons">

					<p class="control">
						<input class="input is-large" type="text"
							placeholder="Find a brewery or beer">
					</p>
					<p class="control">
						<span class="select is-large"> <select>
								<option>Beer</option>
								<option>Brewery</option>
						</select>
						</span>
					</p>
					<p class="control">
						<a class="button is-info is-large"> Search </a>
					</p>
				</div>
			</div>
		</div>
	</nav>
	
	<section class = "section is-medium">
<div class="columns is-gapless is-mobile">
  <div class="column is-3 is-offset-1"><p class="bd-notification is-info">image</p></div>
  <div class="column"><p class="bd-notification is-warning">info</p></div>
  
</div>
<div class="columns is-mobile">
  <div class="column is-3 is-offset-1"><p class="bd-notification is-info">image</p></div>
  <div class="column"><p class="bd-notification is-warning">info</p></div>
  
</div>
<div class="columns is-mobile">
  <div class="column is-3 is-offset-1"><p class="bd-notification is-info">image</p></div>
  <div class="column"><p class="bd-notification is-warning">info</p></div>
  
</div>
</section> -->

</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />
