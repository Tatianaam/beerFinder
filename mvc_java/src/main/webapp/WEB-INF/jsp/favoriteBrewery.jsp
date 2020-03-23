<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<style>

.has-bg-img {
	background: url("img/background/b1.jpg") center center;
	 background-attachment: fixed;
	background-size: cover;
	
}
</style>

<c:forEach items="${favBrewerys}" var="brewery">

<c:url var="breweryImgUrl" value="${brewery.img}" />
<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
		<div class="tile is-parent is-3 is-centered has-text-centered">
			<article class="tile is-child box content is-centered has-text-centered" >
				<figure style="width: 150px; " class="is-inline-block">    
					<a href="breweryReviewInput?brewery_id=${brewery.brewery_id}"> <img 
						src="${breweryImgUrl}" alt="${brewery.name}" />
					</a>
				</figure>
				<figure class="rating is-inline-block" style="margin: 0; ">
					<c:forEach begin="0" end="4" var="step">
						<c:choose>
							<c:when test="${(step+.5) <= ratings.get(brewery.brewery_id) }">
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
				<div class=level-left> <c:out value="${brewery.name}"/>  </div>
				</h1>
				
				<p class="has-text-black">
					<c:out value="${brewery.description }" />
				</p>
				
				<p class="has-text-black">
						<c:out value="Address: ${brewery.streetAddress}" />
					</p>	
			</article>
		</div>
		<div class="tile is-parent is-1"></div>
	</div>
	

</c:forEach>
<c:import url="/WEB-INF/jsp/footer.jsp" />
				