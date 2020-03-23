<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<meta charset="UTF-8">

<style>
.has-bg-img {
	background: url("img/background/brw2.jpg") center center;
	 background-attachment: fixed;
	background-size: cover;
	
}
</style>

<div class="hero-body ">

	<div class="tile is-ancestor ">

		<div class="tile is-child is-1" style="width: 6%;"></div>
		<div class="tile is-child is-4 box" style="width: 40%; padding:3%">
			<article class="tile is-child is-info">
				<p class="title">Favorite Beers</p>
				<div class="card">
					<div class="card-image">
						<figure class="image is-3by2">
						<a href="favoriteBeers">
							<img src="/capstone/img/Sierra-Nevada-Beers-Small-2.jpg">
							</a>
						</figure>
					</div>
					<div class="card-content">
						<div class="media">
							<div class="media-left">
								<figure class="image is-96x96">
									<img src="/capstone/img/beer_clink_emoji.png"
										alt="Beer Click Image"> 
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4">Favorite Beers</p>
								<p class="subtitle is-6">@${ currentUser.userName }</p>
							</div>
						</div>
					</div>
				</div>
			</article>
		</div>
		<div class="tile is-child is-2" style="width: 8%;"></div>
		<div class="tile is-child is-4 box " style="width: 40%; padding:3%">
			<article class="tile is-child is-info">
				<p class="title">View your breweries</p>
				<div class="card">
					<div class="card-image">
						<figure class="image is-3by2">
						<a href="myBreweries">
							<img src="/capstone/img/Wallpaper1.jpg">
							</a>
						</figure>
					</div>
					<div class="card-content">
						<div class="media">
							<div class="media-left">
								<figure class="image is-96x96">
									<img src="/capstone/img/beer_clink_emoji.png"
										alt="Beer Click Image">
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4"> Breweries</p>
								<p class="subtitle is-6">@${ currentUser.userName }</p>
							</div>
						</div>
					</div>
				</div>
			</article>
		</div>
		<div class="tile is-child is-1" style="width: 6%;"></div>
	</div>

</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />