<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />
<style>

.has-bg-img {
	background: url("img/background/b1.jpg") center center;
	 background-attachment: fixed;
	background-size: cover;
	
}
</style>
<div class="hero-body ">

<c:url var="action" value="/beerList" />
 <form action="${action}" method="POST">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

	<c:forEach items="${beers}" var="beer">

		<c:url var="beerImgUrl" value="${beer.imgString}" />

		<div class="tile is-ancestor ">
			<div class="tile is-parent is-1"></div>
			<div class="tile is-parent is-3 is-centered has-text-centered">
				<article
					class="tile is-child box content is-centered has-text-centered">
					<figure style="width: 150px;" class="is-inline-block">
						<a href="beerReviewInput?beerId=${beer.brId}"> <img
							src="${beerImgUrl}" alt="${beer.name}" />
						</a>
					</figure>
					<figure class="rating is-inline-block" style="margin: 0;">
						<c:forEach begin="0" end="4" var="step">
							<c:choose>
								<c:when test="${(step+.5) <= ratings.get(beer.brId) }">
									<span class="filled">&#9734;</span>
								</c:when>
								<c:otherwise>
									<span>&#9734;</span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</figure>
				</article>
			</div>
			<div class="tile is-parent is-7">
				<article class="tile is-child box content is-medium">
					<h1 class="title is-4 has-text-black level ">
						<span class="level-left">
							<c:out value="${beer.name}, ${beer.style}" />
						</span>
						<span class="level-right">
							<c:out value="abv: ${beer.abv}" />
						</span>
					</h1>
					<br>
					<p class="has-text-black">
						<c:out value="${beer.description }" />
					</p>
					<div>
						<a href="beerReviewInput?beerId=${beer.brId}">
							<button type="button" class="button-link button">Add Review</button>
						</a> <a href="beerReviews?beerId=${beer.brId}">
							<button type="button" class="button-link button ">View Reviews</button>
						</a>
						<button class="button " type="submit" name="brId"
						 value="${beer.brId}">Add to Favorites</button>
					</div>
				</article>
			</div>
			<div class="tile is-parent is-1"></div>
		</div>

	</c:forEach>
</form>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />