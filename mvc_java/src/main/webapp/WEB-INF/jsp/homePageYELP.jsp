<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>


<style>

.has-bg-img {
	background: url("img/background/b4.jpg") center center;
	 background-attachment: fixed;
	background-size: cover;
	
}
</style>


<div class="box">
	<section class="section has-text-centered">



		<h2 class="title has-text-black">Search for a brewery or beer</h2>
		<c:url var="formAction" value="/yelpList" />
		<form method="GET" action="${formAction}">

			<div class="field has-addons has-addons-centered">
				<p class="control">
					<input class="input" type="text"
						placeholder="Find a brewery or beer" name="searchObject" id="searchObject">
				</p>
				<p class="control">
					<input class="input" type="text"
						placeholder="Enter a location" name="searchLocation" id="searchLocation">
				</p>
				<p class="control">
					<button class="button is-info" type="submit">Search</button>
				</p>
			</div>
		</form>
	</section>


	<section class="section has-text-centered">

		<h3 class="has-text-black">Have a beer with us.</h3>
		<c:url
			value="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/whatsapp/224/clinking-beer-mugs_1f37b.png"
			var="beerEmojiImg" />
		<nav class="level">
			<div class="level-item has-text-centered">
				<img src="${beerEmojiImg}" class="image is-32x32"> <img
					src="${beerEmojiImg}" class="image is-32x32"> <img
					src="${beerEmojiImg}" class="image is-32x32">
			</div>
		</nav>
		<p class="is-size-5 has-text-black">Brewery Finder was created so
			beer lovers around the country could continue to expand their tastes
			and try new beers, while sharing their favorites with other users.
			Come here if you need to find a specific beer or brewery near you, or
			you just want to geek out with other beer lovers.</p>


	</section>

</div>




<%@ include file="footer.jsp"%>
