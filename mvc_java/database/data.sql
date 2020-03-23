-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user (user_name, password, personal_name, birthday, email, phone, city, state, zip, favBeer, role, salt)
VALUES('admin', 'yLT9HVQ7yr2qd4+/odRqEg==', 'Admin', '01/01/1980', 'admin@curlymoney.com', '4128675309', 'Pittsburgh', 'PA', '15237', 'Guinness', 'admin', 'gc1W6bMRHBXQI2eWxm9j8aigihNFbQxQIf2K1n87DzBUf3+7U1/OPgU1c9k1LQbU//NHm8HWZxwQ1JFaP2kmSwfoV5oltfPacXEHG1Br1QObxuBGpYXcUInwIDkAnnM4/YV7E0u/2pFkJLKW0l251yDOKZRUwQLrULOWkZUfFlw=');
INSERT INTO app_user (user_name, password, personal_name, birthday, email, phone, city, state, zip, favBeer, role, salt)
VALUES('test_user', 'pzMxAUnGVJMduMxmwBE6Tw==', 'Tester', '01/01/1980', 'test_user@curlymoney.com', '4125555555', 'Pittsburgh', 'PA', '15237', 'Yeungling', 'beer_lover', 'E3oexg38XMhh1cZSPVMbGx7Rt1ykAYX6WFZx/kB2kBxPchtGOhOMN1gw369wi6SSiDi1QFUJcMAWMaTJYtJPXlmopxXh82ASWgI/bpsvuriXVO3r1+FF/0gx2U/mbPoO9psGp3+N6N38D0mb6QitvuBBSA7L6pBNbVeyhmqxtKw=');
INSERT INTO app_user (user_name, password, personal_name, birthday, email, phone, city, state, zip, favBeer, role, salt)
VALUES('T', 'STPccYr77lQAj1A/UkHDDA==', 'Tatiana', '03/28/1996', 'qtest_user@curlymoney.com', '4125555555',', ''Pittsburgh', 'PA', '15237', 'Yeungling', 'beer_lover', 'E3oexg38XMhh1cZSPVMbGx7Rt1ykAYX6WFZx/kB2kBxPchtGOhOMN1gw369wi6SSiDi1QFUJcMAWMaTJYtJPXlmopxXh82ASWgI/bpsvuriXVO3r1+FF/0gx2U/mbPoO9psGp3+N6N38D0mb6QitvuBBSA7L6pBNbVeyhmqxtKw=');
INSERT INTO app_user (user_name, password, personal_name, birthday, email, phone, city, state, zip, favBeer, role, salt)
VALUES('testBrewer', '1ld1UxTdHc9eHF6lC/jTKg==', 'Test and Sons Brewing Company', '01/01/1980', 'testBrewer@brewSite.com', '4128889999', 'Pittsburgh', 'PA', '15223', 'Coors', 'brewer', 'K4dNJmvEJZ2Bl0uZMKnI7Ae6L4YwDYjVxCgBfuqXmWvNqgZOAbF9vVfatsNn1E9rR0aolVyawA3CIeo/wK87l8zhwSOeE1GeBZpXOWRzrW10dxH+cG7JKY8NQ8BungbXKZJKwQuiBuzSZzd8AWfMLGlEmvLZgge2RgCAlbJKsrQ=');




INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active, street_address, city, state, zip) 
VALUES('img/BreweryImgs/eastend.jpg','Local brewery offering tours, a tasting room & house beers for sale by the growler or keg.','East End Brewing Company', '412-3245654','Everyday','10am-2am','True','147 Julius St', 'Pittsburgh', 'PA', '15206' );

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/gristhouse.jpg','Bring your family, bring your dog, everyone is welcome here.','Grist House Craft Brewery','413-543-6754','Everyday','10am-1am','True','10 E Sherman St', 'Pittsburgh', 'PA','15206');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/rivertown.jpg','Microbrewery offering a variety of house beers, comfort food & a full bar amid Amish furnishings.','Rivertowne Pour House', '456-6548755','Sunday-Friday','12pm-12am','True','312 Center Rd', 'Monroeville', 'PA','15146');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/mindful.jpg','House brews & more flow from the many taps at this casual brewpub with comfort fare & a bottle shop.','Mindful Brewing Company','436-6565755','Sunday-Friday','10am-2am','False','3759 Library Rd', 'Pittsburgh', 'PA','15234');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/penn.jpg','Long-standing brewery features German-style brews, diverse comfort fare, regular live music & tours.','Penn Brewery','446-6575955','Wednesday-Friday','5pm-3am','True', '800 Vinial St','Pittsburgh', 'PA','15212');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/allegheny.jpg','We are proud to be a part of the neighborhood, and the Pittsburgh craft brewing community. Our goal to every one of our patrons is to provide great beer, a relaxing environment, and great service.','Allegheny City Brewing','416-7654785','Everyday','1pm-12am','True','507 Foreland St', 'Pittsburgh', 'PA','15212');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/springhill.jpg','Join us on the hilltop for refreshing farmhouse-style beers that we brew in-house.  We specialize in fresh, flavorful Belgian-style session ales and saisons, and cannot wait for you join us for great drinks and a great view. ','Spring Hill Brewing','456-7642556','Tuesday-Sunday','2pm-2am','True','1958 Varley St', 'Pittsburgh', 'PA','15212');

INSERT INTO breweries (imgString,description,name,contact_no,days_open,hours_open,active,street_address, city, state, zip) 
VALUES('img/BreweryImgs/hopfarm.jpg','Hop Farm Brewing company is a independently partner owned brewery in the Lawrenceville neighborhood of Pittsburgh Pennsylvania. Our focus is on sustainability and local sourcing while producing hoppy ales, farmhouse ales, sour ales and various other interesting brews.','Hop Farm Brewing Company','456-7564353','Sunday-Friday','12pm-12am','True', '5601 Butler St', 'Pittsburgh', 'PA','15201');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/BudLight.png', 'Bud Light', 'American Style Light Lager', '5%', 'Bud Light is brewed using a blend of premium aroma hop varieties, both American-grown and imported, and a combination of barley malts and rice. The light-bodied beer features a fresh, clean and subtle hop aroma, delicate malt sweetness and a crisp finish that delivers the ultimate refreshment.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/Corona.jpeg', 'Corona', 'Pale Lager', '4.5%', 'This light, dry beer has pleasant malt and hop notes with a round dry finish. Regardless of the time of the year, Corona is best served ice cold, with a wedge of lime that complements and intensifies the flavour through the palate.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('img/BeerImgs/Yuengling.jpeg', 'Yuengling', 'Traditional Lager', '4.5%', 'Yuengling Traditional Lager is an iconic American lager famous for its rich amber color and medium-bodied flavor. Brewed with roasted caramel malt for a subtle sweetness and a combination of cluster and cascade hops, this true original promises a well balanced taste with very distinct character.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/Guiness.png', 'Guiness', 'Dark Irish Dry Stout', '4.2%', 'Guinness is a traditional Irish stout beer made from roasted barley, hops, yeast, and water. The deep color and caramelized flavor that are characteristic of Guinness come from barley that has been roasted but not malted.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/StoneIPA.jpeg', 'Stone IPA', 'India Pale Ale', '6.9%', 'One of the most well respected and best-selling IPAs in the country, this golden beauty explodes with citrusy flavor and hop aromas, all perfectly balanced by a subtle malt character. By definition, an India pale ale is hoppier and higher in alcohol than its little brother, pale ale—and we deliver in spades.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('img/BeerImgs/GreatLakesPorter.jpeg', 'Great Lakes Edmund Fitzgerald', 'Porter', '6.0%', 'Complex, roasty aroma with a bittersweet, chocolate-coffee taste and a bold hop presence. A tan head of roasted malt greets the nose. Flavor is rich roast that runs deep with a nice bitter edge lingering on the pallet.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/SweatwaterPorter.png', 'Sweetwater Georgia Brown', 'Brown Ale', '5.1%', 'The malt bill gives a subtle nutty & toasty flavors and the chocolate malt provides a rich cocoa flavor with aromas that range from roasted coffee to chocolate-covered dark fruits. The hops used provides excellent bitterness in relation to the chocolate notes of the malt. The flavor and aroma provide clean floral, fruity and herbal notes. A light dose of hops brings balance to all.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('img/BeerImgs/MonkeyBoy.png', 'Monkey Boy', 'German Hefeweizen', '4.8%', 'Smooth, subtle wheat beer with hints of banana and spice. Great in the summer and very drinkable. Light, not overwhelming but interesting flavor. Mildly carbonated and refreshing.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('img/BeerImgs/QuadWeyerbacher.jpeg', 'QUAD by Weyerbacher Co.', 'Dark Ale', '11.8%', 'An elegant and dark ale. Rich with complexity and flavor, try savoring it after a long day or during a fine dinner. You also might enjoy it as an aperitif or as an accompaniment to a dessert, but QUAD stands alone quite well. We recommend enjoying QUAD in a brandy snifter or wineglass so you can drink in the aroma of this fine elixir.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('img/BeerImgs/FatTire.jpeg', 'Fat Tire', 'Amber Ale', '5.2%', 'It is a classic amber with biscuit notes and a soft warming alcohol touch in the aroma and flavor. The hops arent your typical citrus hops, but they are still refreshing and crisp.');

INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('1','Andrew','5','This place is okay, but their website is made by my students and I am proud of them!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('2','Amy','4','This place is awesome! can get too noisy sometimes, but I would love to come back!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('3','Andy','2','There are better place than this in pittsburgh!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('4','Andrew','5','This place is okay, but their website is made by my students and I am proud of them!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('5','Amy','4','This place is awesome! can get too noisy sometimes, but I would love to come back!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('6','Andy','4','There are better place than this in pittsburgh!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('7','Amy','4','This place is awesome! can get too noisy sometimes, but I would love to come back!') ;
INSERT INTO brewery_reviews(brw_id,reviewer_name,rating,review_body) VALUES ('8','Andy','3','There are better place than this in pittsburgh!') ;



INSERT INTO beer_reviews(br_id, reviewer_name, rating, review_body)
VALUES(4, 'Matt', 5, 'One of my all-time favorite beers. Flavour is dry overall, but with a small glimmer of sweet undercurrent. Thin front half that sells out for the silky mouthfeel, but catches up as it works across the palate, offering roast and ash and a pleasant bitter coffee finish.'),
(4, 'Amy', 4, 'Best served at a pub, in a Guinness glass with just the right amount of head and temperature. It has a buttery aroma of roasted malts, coffee, dark chocolate and caramel, with a tiny hint of alcohol.'),
(4, 'Bradley', 4, 'Good base stout. Not too expensive and nails the stout taste.');

INSERT INTO beer_reviews(br_id, reviewer_name, rating, review_body)
VALUES(1, 'Matt', 5, 'Awesome stuff!'),
(3, 'Amy', 3, 'So-so'),
(2, 'Bradley', 1, 'Hell no!'),
(5, 'Bradley', 5, 'Hell yeah!'),
(6, 'Bradley', 3, 'Not the super awesome'),
(7, 'Bradley', 3, 'It s okaaay'),
(8, 'Bradley', 4, 'Can be better'),
(9, 'Bradley', 5, 'Really good one'),
(10, 'Bradley', 5, 'Personal favourite');




INSERT INTO fav_beers(user_id , br_id)
VALUES(2, 1),
      (2, 2),
      (2, 3);

INSERT INTO fav_breweries(user_id , brw_id)
VALUES(2, 1),
      (2, 2),
      (2, 3);

INSERT INTO breweries_beers(brw_id,br_id)
VALUES (1,1),
       (2,2),
       (3,3),
       (4,4),
       (5,5),
       (6,6),
       (7,7),
       (8,8);

INSERT INTO app_user_breweries(user_id, brw_id)
VALUES(4, 3), (4, 5);

COMMIT;