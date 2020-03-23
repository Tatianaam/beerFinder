<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<style>

.has-bg-img {
	background: url("img/background/b4.jpg") center center;
	 background-attachment: fixed;
	background-size: cover;
	
}

.box {
	background-color: rgba(255, 255, 255, .92);
}
</style>

<c:url var="action" value="/yelpList" />
 <form action="${action}" method="POST">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

					
	<c:forEach items="${yelps}" var="yelp">
	<c:url var="yelpImgUrl" value="${yelp.image}" />
	
	<div class="tile is-ancestor ">
			<div class="tile is-parent is-1"></div>
			<div class="tile is-parent is-3 is-centered has-text-centered">
				<article
					class="tile is-child box content is-centered has-text-centered">
					<figure style="width: 150px;" class="is-inline-block">
						  <img src="${yelpImgUrl}" />
						
					</figure>
					<figure class="rating is-inline-block" style="margin: 0;">
						<c:forEach begin="0" end="4" var="step">
							<c:choose>
								<c:when test="${(step+.5) <= (yelp.rating) }">
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
					<h1 class="title is-4 has-text-black level">
					
						<div class="level-left">
							<c:out value="${yelp.name}" />
							</div>
							
				         <br>
							
							<div class="level-right">
							<c:out value="${yelp.phone}" />
						</div>
						</h1>
						
				      
				      <p class="has-text-black">
						<p> Address: <c:out value="${yelp.location}" />
						</p>
						
						<p>
						<a href="${yelp.url }"> Go to web site!
						</a>
						</p>
						
						<%-- <input type="hidden" name="address" value="${yelp.location }"/>
						<input type="hidden" name="img" value="${yelp.image }"/>
						<input type="hidden" name="rating" value="${yelp.rating }"/> --%>
						<button class="button " type="submit" name="brewery"
						 value="${yelp.name}, ${yelp.location}, ${yelp.image}, ${yelp.rating}">Add to Favorites</button>
						
					
						</article>
						</div>
						<div class="tile is-parent is-1"></div>
						</div>
	</c:forEach>
	</form>
	<c:import url="/WEB-INF/jsp/footer.jsp" />