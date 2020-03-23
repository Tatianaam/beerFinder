<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-10 is-centered">
		<div
			class="tile is-child box content is-centered is-medium has-text-black">
			<c:url var="action" value="/newBeerInput" />
			<form:form method="POST" action="${action}"
				modelAttribute="beerObject">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label for="name">Name of the beer: </label>
							<p class="control has-icons-left is-expanded">
								<input type="text" name="name" placeholder="Beer Name"
									class="input" /> <span class="icon is-small is-left"> <i
									class="fas fa-beer"></i>
								</span>
						</div>

						<div class="field">
							<label>ABV: </label>
							<div class="control">
								<input type="text" name="abv" placeholder="ABV  (ex: 5.3%)"
									class="input" />
							</div>
						</div>
					</div>
				</div>

				<div class="field is-horizontal">
					<div class="field-body">

						<div class="field">
							<label for="role">Style: </label>
							<div class="control is-expanded">
								<div class="select is-fullwidth">
									<select name="style">
										<c:forEach items="${styles}" var="style">
											<option value="${style}">${style}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>

						<div class="field">
							<label for="imgString">Image Link: </label>
							<div class="control has-icons-left is-expanded">
								<input type="text" class="input is-fullwidth" name="imgString"
									placeholder="Image link" />
									<span class="icon is-small is-left"> <i
									class="fa fa-camera"></i>
								</span>
							</div>
						</div>

					</div>
				</div>

				<div class="field">
					<label for="description">Description: </label>
					<div class="control">
						<textarea class="textarea" name="description"
							placeholder="Description"></textarea>
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
