<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.has-bg-img {
	background: url("img/background/brw2.jpg") center center;
	background-attachment: fixed;
	background-size: cover;
}
</style>

<div class="tile is-ancestor ">
	<div class="tile is-parent is-1"></div>
	<div class="tile is-parent is-10  is-centered">
		<div class="tile is-child box is-medium has-text-black">
			<c:url var="action" value="/breweryInput" />
			<form method="POST" action="${action}" modelAttribute="beerObject">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

				<h3>Add your Brewery Here:</h3>
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">

							<label for="Name">Name of the brewery: </label>
							<p class="control is-expanded">
								<input type="text" class="input" class="input" name="name"
									id="name" />
						</div>
						<div class="field">

							<label for="isActive">Is it currently active? </label>
							<div class="control">
								<input type="radio" value="true" name="isActive" checked> Yes <input
									type="radio" value="false" name="isActive"> No
							</div>
						</div>
					</div>

				</div>
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label for="days">Days of operation? (Example: Mon -
								Fri): </label>
							<p class="control has-icons-left">
								<input type="text" class="input" class="input" name="daysOpen"
									id="daysOpen" /> 
						</div>

						<div class="field">
							<label for="hours">Hours of operation? (Example:
								9am-1am): </label>
							<p class="control has-icons-left">
								<input type="text" class="input" name="hoursOpen" id="hoursOpen" />
								
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-body">

						<div class="field">
							<label for="contact">Please Enter the Contact Number: </label>
							<p class="control has-icons-left">
								<input type="text" class="input" name="contactNumber"
									id="contactNumber" /> 
						</div>

						<div class="field">
							<label for="SAddress">Please Enter the Street Address: </label>

							<p class="control has-icons-left">
								<input type="text" class="input" name="StreetAddress"
									id="StreetAddress" /> 
						</div>

					</div>
				</div>

				<div class="field is-horizontal">
					<div class="field-body">

						<div class="field">
							<label for="city">Please Enter the City: </label>
							<p class="control has-icons-left">
								<input type="text" class="input" name="city" id="city" /> 
						</div>

						<div class="field">
							<label for="state">Please Enter the State: </label>
							<p class="control has-icons-left">
								<input type="text" class="input" name="state" id="state" /> 
						</div>

						<div class="field">
							<label for="zip">Please Enter the Zipcode: </label>
							<p class="control has-icons-left">
								<input type="text" class="input" name="zipCode" id="zipCode" />
								
						</div>

					</div>
				</div>

				<div class="field">
					<label class="image">Please Enter the image url: </label>
					<p class="control has-icons-left">
						<input type="text" class="input" name="img" id="img" /> 
				</div>

				<div class="field">
					<label for="description">Please Enter the description
						below: </label>
					<div class="control">
						<textarea class="textarea" name="description"
							placeholder="description"></textarea>
					</div>
				</div>

				<input class="button is-light is-centered" type="submit"
					value="Submit!" />


			</form>
		</div>
	</div>
</div>
<div class="tile is-parent is-1"></div>

<c:import url="/WEB-INF/jsp/footer.jsp" />
