<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.box {
	background-color: rgba(255, 255, 255, .85);
}

.navbar {
	margin: 0px;
}

.has-bg-img {
	background:
		url('https://cdn.theatlantic.com/assets/media/img/photo/2019/09/oktoberfest-2019-photos-opening-wee-1/o01_1176125103-1/original.jpg')
		center center;
	background-size: cover;
}
</style>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$.validator.addMethod('capitals', function(thing) {
							return thing.match(/[A-Z]/);
						});
						$.validator.addMethod('numeric', function(thing) {
							return thing.match(/^\d+$/);
						});
						$.validator
								.addMethod(
										'email',
										function(thing) {
											return thing
													.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
										});
						$.validator.addMethod('userName', function(thing) {
							return thing.match(/^[A-Za-z0-9]+$/);
						});

						$("form")
								.validate(
										{

											rules : {
												userName : {
													required : true,
													userName : true
												},
												email : {
													required : true,
													email : true
												},
												password : {
													required : true,
													minlength : 10,
													capitals : true,
												},
												confirmPassword : {
													required : true,
													equalTo : "#password"
												},
												firstName : {
													required : true,
												},
												birthday : {
													required : true,
													birthday : true
												},
												phone : {
													required : true,
													numeric : true,
													minlength : 10
												},
												city : {
													required : true,
												},
												state : {
													required : true,
												},
												zip : {
													required : true,
													numeric : true,
													minlength : 5
												},
												favBeer : {
													required : true
												}
											},
											messages : {
												email : {
													email : "Email should be in the correct format!"
												},
												password : {
													minlength : "Password too short, make it at least 10 characters",
													capitals : "Field must contain a capital letter",
												},
												confirmPassword : {
													equalTo : "Passwords do not match"
												},
												birthday : {
													birthday : "Correct format is (MM/DD/YYYY)"
												},

												phone : {
													minlength : "Phone should have 10 numbers",
													numeric : "Should include numbers only!"

												},
												zip : {
													minlength : "ZipCode should have 5 numbers minimum",
													numeric : "Should include numbers only!"

												},
												userName : {
													userName : "Can contain letters only"
												}
											},
											errorClass : "error"
										});
					});
</script>
<div class="box">
	<div class="columns is-centered is-size-5">
		<div class="column is-7">
			<c:choose>
				<c:when test="${not empty currentUser}">

					<p class="title">
						You are currently logged in as <span class="is-success">${currentUser.userName}!</span>
					</p>
					<div class="buttons">
						<a class="button is-info is-medium is-light"
							href="${homePageHref}">Home</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:url var="formAction" value="/users" />
					<form method="POST" action="${formAction}">
						<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field">
									<label for="userName">User Name: </label>
									<p class="control has-icons-left">
										<input type="text" id="userName" name="userName"
											placeHolder="User Name" class="input" /> <span
											class="icon is-small is-left"> <i class="fas fa-user"></i>
										</span>
								</div>
								<div class="field">
									<label for="role">Account type: </label>
									<div class="control is-expanded">
										<div class="select is-fullwidth">

											<select name="role" id="role">
												<option value="beer_lover">Beer Lover</option>
												<option value="brewer">Brewer</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="field">
							<label for="email">Email: </label>
							<p class="control has-icons-left">
								<input type="text" id="email" name="email" placeHolder="Email"
									class="input" /> <span class="icon is-small is-left"> <i
									class="fas fa-envelope"></i>
								</span>
						</div>

						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field">
									<label for="password">Password: </label>
									<p class="control has-icons-left">
										<input type="password" id="password" name="password"
											placeHolder="Password" class="input" /> <span
											class="icon is-small is-left"> <i class="fas fa-lock"></i>
										</span>
								</div>
								<div class="field">
									<label for="confirmPassword">Confirm Password: </label>
									<p class="control has-icons-left">
										<input type="password" id="confirmPassword"
											name="confirmPassword" placeHolder="Re-Type Password"
											class="input" /> <span class="icon is-small is-left">
											<i class="fas fa-lock"></i>
										</span>
								</div>
							</div>
						</div>
						<div class="field is-horizontal">
							<div class="field-body">

								<div class="field">
									<label for="firstName">Personal Name: </label>
									<p class="control has-icons-left">
										<input type="text" id="personalName" name="personalName"
											placeHolder="Name" class="input" /> <span
											class="icon is-small is-left"> <i class="fas fa-user"></i>
										</span>
								</div>

								<div class="field">
									<label for="birthday">Birthday (MM/DD/YYYY): </label>
									<p class="control has-icons-left">
										<input type="date" name="" class="input" />
								</div>
							</div>
						</div>
						<div class="field">
							<label for="phone">Phone Number: </label>
							<p class="control has-icons-left">
								<input class="input" id="phone" name="phone"
									placeHolder="Phone Number" /> <span
									class="icon is-small is-left"> <i class="fas fa-phone"></i>
								</span>
							</p>
						</div>
						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field">
									<label for="city">City: </label>
									<p class="control has-icons-left">
										<input type="text" id="city" name="city" placeHolder="City"
											class="input" /> <span class="icon is-small is-left">
											<i class="fas fa-map-marker"></i>
										</span>
								</div>

								<div class="field">
									<label for="state">State: </label>
									<div class="control is-expanded">
										<div class="select is-fullwidth">

											<select name="state" id="state">
												<option value="AK">AK</option>
												<option value="AL">AL</option>
												<option value="AR">AR</option>
												<option value="AZ">AZ</option>
												<option value="CA">CA</option>
												<option value="CO">CO</option>
												<option value="CT">CT</option>
												<option value="DC">DC</option>
												<option value="DE">DE</option>
												<option value="FL">FL</option>
												<option value="GA">GA</option>
												<option value="HI">HI</option>
												<option value="IA">IA</option>
												<option value="ID">ID</option>
												<option value="IL">IL</option>
												<option value="IN">IN</option>
												<option value="KS">KS</option>
												<option value="KY">KY</option>
												<option value="LA">LA</option>
												<option value="MA">MA</option>
												<option value="MD">MD</option>
												<option value="ME">ME</option>
												<option value="MI">MI</option>
												<option value="MN">MN</option>
												<option value="MO">MO</option>
												<option value="MS">MS</option>
												<option value="MT">MT</option>
												<option value="NC">NC</option>
												<option value="ND">ND</option>
												<option value="NE">NE</option>
												<option value="NH">NH</option>
												<option value="NJ">NJ</option>
												<option value="NM">NM</option>
												<option value="NV">NV</option>
												<option value="NY">NY</option>
												<option value="OH">OH</option>
												<option value="OK">OK</option>
												<option value="OR">OR</option>
												<option value="PA">PA</option>
												<option value="RI">RI</option>
												<option value="SC">SC</option>
												<option value="SD">SD</option>
												<option value="TN">TN</option>
												<option value="TX">TX</option>
												<option value="UT">UT</option>
												<option value="VA">VA</option>
												<option value="VT">VT</option>
												<option value="WA">WA</option>
												<option value="WI">WI</option>
												<option value="WV">WV</option>
												<option value="WY">WY</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="field">
							<label for="zip">Zip: </label>
							<p class="control has-icons-left">
								<input type="text" id="zip" name="zip" placeHolder="Zip-Code"
									class="input" /> <span class="icon is-small is-left"> <i
									class="fas fa-address-book"></i>
								</span>
						</div>
						<div class="field">
							<label for="favBeer">What is your favorite beer?: </label>
							<p class="control has-icons-left">
								<input type="text" id="favBeer" name="favBeer"
									placeHolder="Favourite beer" class="input" /> <span
									class="icon is-small is-left"> <i class="fas fa-beer"></i>
								</span>
						</div>
						<div style="text-align: center;">
							<button type="submit" class="button is-success is-light">Create
								User</button>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div></div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />