<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.has-bg-img {
	background:
		url('https://cdn.theatlantic.com/assets/media/img/photo/2019/09/oktoberfest-2019-photos-opening-wee-1/o01_1176125103-1/original.jpg')
		center center;
	background-size: cover;
}

</style>

<c:url var="homePageHref" value="/" />
<c:url var="logoutAction" value="/logout" />
<c:set var="pageName" value="Log in" />
<script type="text/javascript">
	$(document).ready(function() {

		$("form").validate({

			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			errorClass : "error"
		});

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});
	});
</script>
<div class="columns is-centered ">
	<div class="column is-4 box ">
		<div class="column is-12 is-centered is-size-5">
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
					<c:url var="formAction" value="/login" />
					<form method="POST" action="${formAction}">
						<div class="field">
							<label for="userName">Username: </label> <input type="hidden"
								name="destination" value="${param.destination}" /> <input
								type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
							<p class="control has-icons-left">
								<input class="input" type="text" id="userName" name="userName"
									placeHolder="Username" /> <span class="icon is-small is-left">
									<i class="fas fa-user"></i>
								</span>
							</p>
						</div>
						<div class="field">
							<label for="password">Password: </label>
							<p class="control has-icons-left">
								<input class="input" type="password" id="password"
									name="password" placeHolder="Password"> <span
									class="icon is-small is-left"> <i class="fas fa-lock"></i>
								</span>
							</p>
						</div>
						<div class="field">
							<p class="control">
								<button type="submit" class="button is-success">Login</button>
							</p>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<!-- div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="formAction" value="/login" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="destination" value="${param.destination}" />
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<div class="form-group">
				<label for="userName">User Name: </label> <input type="text"
					id="userName" name="userName" placeHolder="User Name"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label> <input type="password"
					id="password" name="password" placeHolder="Password"
					class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
	</div>
	<div class="col-sm-4"></div>
</div> -->
<c:import url="/WEB-INF/jsp/footer.jsp" />