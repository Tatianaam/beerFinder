<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.box {
	background-color: rgba(255, 255, 255, .80);
}

.has-bg-img {
	background: url("img/background/brw2.jpg") center center;
	background-attachment: fixed;
	background-size: cover;
}
</style>

<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-10">
		<div class="tile is-child box">
			<h1 class="title is-4 has-text-centered ">Review the brewery</h1>
		</div>
	</div>
	<div class="tile is-parent is-1"></div>
</div>
<c:url var="breweryImgUrl" value="${brewery.img}" />
<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-3">
		<article class="tile is-child box">
			<figure style="width: 150px;">
				<a href="breweryReviewInput?brewery_id=${brewery.brewery_id}"> <img
					src="${breweryImgUrl}" alt="${brewery.name}" />
				</a>
			</figure>
		</article>
	</div>
	
	<div class="tile is-parent is-7">
		<article class="tile is-child box content is-medium">
			<h1 class="title is-4 has-text-black">
				<c:out value="${brewery.name}" />
			</h1>
			<br>
			<p class="has-text-black">
				<c:out value="${brewery.description }" />
			</p>
		</article>
	</div>
	<div class="tile is-parent is-1"></div>
</div>

<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-10 has-text-centered is-centered">
		<div
			class="tile is-child box content is-centered is-medium has-text-black">
			<c:url var="breweryReview" value="/breweryReviewInput" />
			<form:form method="POST" action="${breweryReview}"
				modelAttribute="breweryReview">
				
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

				<input class="is-centered" type="hidden" name="brewery_id"
					value="${brewery.brewery_id}" />

				<!-- Naming will possibly be changed -->
				<input type="hidden" name="reviewerName" value="${user.name}" />

				<div>Name: ${userName}</div>

				<div class="field content">
					<div class="control">
						<div class="select is-medium">
							<select name="rating">
								<option value="1">&#11088;&#11090;&#11090;&#11090;&#11090;</option>
								<option value="2">&#11088;&#11088;&#11090;&#11090;&#11090;</option>
								<option value="3">&#11088;&#11088;&#11088;&#11090;&#11090;</option>
								<option value="4">&#11088;&#11088;&#11088;&#11088;&#11090;</option>
								<option value="5">&#11088;&#11088;&#11088;&#11088;&#11088;</option>
							</select>
						</div>
					</div>
				</div>

				<div class="field">
					<label class="label">Review: </label>
					<div class="control">
						<textarea class="textarea" name="reviews"
							placeholder="Textarea"></textarea>
					</div>
				</div>
				
				

				<input class="button is-light is-centered" type="submit"
					value="Submit!" />

			</form:form>
		</div>
	</div>
</div>
<div class="tile is-parent is-1"></div>
</div>





<c:import url="/WEB-INF/jsp/footer.jsp" />
