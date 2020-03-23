<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.has-bg-img {
	background: url("img/background/brw2.jpg") center center;
	background-attachment: fixed;
	background-size: cover;
}
</style>

<c:url var="breweryImgUrl" value="${brewery.img}" />

<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-3 is-centered has-text-centered">
		<article
			class="tile is-child box content is-centered has-text-centered">
			<figure style="width: 150px;" class="is-inline-block">
				<a href="breweryReviewInput?brewery_id=${brewery.brewery_id}"> <img
					src="${breweryImgUrl}" alt="${brewery.name}" />
				</a>
			</figure>
		</article>
	</div>
	<div class="tile is-parent is-7">
		<article class="tile is-child box content is-medium">
			<h1 class="title is-4 has-text-black level">
				<div class=level-left>
					<c:out value="${brewery.name}" />
				</div>
				</h1>
				
				
				<div class=level-right>
					<c:out value="${brewery.description}" />
				</div>
			
		</article>
	</div>
	<div class="tile is-parent is-1"></div>
</div>
	
<c:forEach items="${reviews}" var="review">

		<div class="tile is-ancestor ">
			<div class="tile is-parent is-1"></div>
			<div class="tile is-parent is-10 is-centered">
				<article
					class="tile is-child box content is-centered">

					<div class="title is-4 has-text-black level " style="margin: 1%;">
						<span class="level-left"> <c:out
								value="${review.name}" />
						</span> <span class="level-right">
							<div class="rating is-inline-block" style="margin: 0;">
								<c:forEach begin="0" end="4" var="step">
									<c:choose>
										<c:when test="${(step+.5) <= review.rating }">
											<span class="filled">&#9734;</span>
										</c:when>
										<c:otherwise>
											<span>&#9734;</span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</span>
					</div>


					<p class="is-size-4 has-text-black level ">
						<c:out value="${review.reviews}" />
					</p>
				</article>
			</div>
			<div class="tile is-parent is-1"></div>
		</div>
	</c:forEach>
	
	
	<c:import url="/WEB-INF/jsp/footer.jsp" />