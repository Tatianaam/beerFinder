-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS  breweries_beers;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS beer_reviews;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  birthday date NOT NULL,
  email varchar(128) NOT NULL,
  phone varchar(32) NOT NULL,
  city varchar(128) NOT NULL,
  state varchar(4) NOT NULL,
  zip varchar(10) NOT NULL,
  favBeer varchar(164) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE breweries(
brw_id serial PRIMARY KEY,
name VARCHAR UNIQUE NOT NULL,
street_address VARCHAR UNIQUE NOT NULL,
city VARCHAR NOT NULL,
state VARCHAR NOT NULL,
zip VARCHAR NOT NULL
);

CREATE TABLE beers(
br_id serial PRIMARY KEY,
name VARCHAR UNIQUE NOT NULL,
style VARCHAR NOT NULL,
abv VARCHAR NOT NULL,
description VARCHAR NOT NULL,
imgString VARCHAR NOT NULL
);

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES ('BudLight.png', 'Bud Light', 'American Style Light Lager', '5%', 'Bud Light is brewed using a blend of premium aroma hop varieties, both American-grown and imported, and a combination of barley malts and rice. The light-bodied beer features a fresh, clean and subtle hop aroma, delicate malt sweetness and a crisp finish that delivers the ultimate refreshment.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES ('Corona.jpeg', 'Corona', 'Pale Lager', '4.5%', 'This light, dry beer has pleasant malt and hop notes with a round dry finish. Regardless of the time of the year, Corona is best served ice cold, with a wedge of lime that complements and intensifies the flavour through the palate.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES('Yuengling.jpeg', 'Yuengling', 'Traditional Lager', '4.5%', 'Yuengling Traditional Lager is an iconic American lager famous for its rich amber color and medium-bodied flavor. Brewed with roasted caramel malt for a subtle sweetness and a combination of cluster and cascade hops, this true original promises a well balanced taste with very distinct character.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES ('Guiness.png', 'Guiness', 'Dark Irish  Dry Stout', '4.2%', 'Guinness is a traditional Irish stout beer made from roasted barley, hops, yeast, and water. The deep color and caramelized flavor that are characteristic of Guinness come from barley that has been roasted but not malted.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES ('StoneIPA.jpeg', 'Stone IPA', 'India Pale Ale', '6.9%', 'One of the most well respected and best-selling IPAs in the country, this golden beauty explodes with citrusy flavor and hop aromas, all perfectly balanced by a subtle malt character. By definition, an India pale ale is hoppier and higher in alcohol than its little brother, pale ale—and we deliver in spades.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES('GreatLakesPorter.jpeg', 'Great Lakes Edmund Fitzgerald', 'Porter', '6.0%', 'Complex, roasty aroma with a bittersweet, chocolate-coffee taste and a bold hop presence. A tan head of roasted malt greets the nose. Flavor is rich roast that runs deep with a nice bitter edge lingering on the pallet.');

INSERT INTO beers (imgString, name, style, abv, description) 
VALUES ('SweatwaterPorter.png', 'Sweetwater Georgia Brown', 'English Brown Ale', '5.1%', 'The malt bill gives a subtle nutty & toasty flavors and the chocolate malt provides a rich cocoa flavor with aromas that range from roasted coffee to chocolate-covered dark fruits. The hops used provides excellent bitterness in relation to the chocolate notes of the malt. The flavor and aroma provide clean floral, fruity and herbal notes. A light dose of hops brings balance to all.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('MonkeyBoy.png', 'Monkey Boy', 'German Hefeweizen', '4.8%', 'Smooth, subtle wheat beer with hints of banana and spice. Great in the summer and very drinkable. Light, not overwhelming but interesting flavor. Mildly carbonated and refreshing.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES('QuadWeyerbacher.jpeg', 'QUAD by Weyerbacher Brewing Co.', 'Belgian Quadrupel - Dark Ale', '11.8%', 'An elegant and dark ale. Rich with complexity and flavor, try savoring it after a long day or during a fine dinner. You also might enjoy it as an aperitif or as an accompaniment to a dessert, but QUAD stands alone quite well. We recommend enjoying QUAD in a brandy snifter or wineglass so you can drink in the aroma of this fine elixir.');

INSERT INTO beers (imgString, name, style, abv, description)
VALUES ('FatTire.jpeg', 'Fat Tire', 'Amber Ale', '5.2%', 'It is a classic amber with biscuit notes and a soft warming alcohol touch in the aroma and flavor. The hops arent your typical citrus hops, but they are still refreshing and crisp.');


UPDATE beers
SET abv = '5.22%'
WHERE name = 'Fat Tire';

BEGIN TRANSACTION;

DELETE FROM beers
WHERE name = 'Fat Tire';

SELECT * FROM beers;

SELECT br_id, name, style, abv, description
FROM beers
WHERE name = 'Guiness';

ROLLBACK;

SELECT * FROM beers;

CREATE TABLE breweries_beers(
brw_id INT NOT NULL, br_id INT NOT NULL,
CONSTRAINT pk_breweries_beers PRIMARY KEY (brw_id, br_id),
CONSTRAINT fk_breweries_beers_brw_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id),
CONSTRAINT fk_breweries_beers_br_id FOREIGN KEY (br_id) REFERENCES beers(br_id)
);

CREATE TABLE beer_reviews(
br_r_id serial PRIMARY KEY,
br_id INT NOT NULL,
reviewer_name VARCHAR NOT NULL,
rating INT NOT NULL,
review_body VARCHAR NOT NULL
);

COMMIT;



SELECT * FROM breweries_beers;

SELECT * FROM breweries;


BEGIN TRANSACTION;

INSERT INTO breweries_beers(brw_id, br_id)
VALUES(1, 3), (1, 8), (1, 4), (3, 2);


SELECT beers.br_id, beers.name, beers.imgString,  beers.style, beers.abv, beers.description FROM beers
JOIN breweries_beers ON breweries_beers.br_id = beers.br_id
JOIN breweries ON breweries_beers.brw_id = breweries.brw_id
WHERE breweries.name = 'Penn Brewery';

SELECT br_id, name, imgString,  style, abv, description
FROM beers;
WHERE name = 'Corona';

ROLLBACK;

SELECT * FROM brewery_reviews;

Begin TRANSACTION;


INSERT INTO beer_reviews(br_id, reviewer_name, rating, review_body)
VALUES(4, 'Matt', 5, 'One of my all-time favorite beers. Flavour is dry overall, but with a small glimmer of sweet undercurrent. Thin front half that sells out for the silky mouthfeel, but catches up as it works across the palate, offering roast and ash and a pleasant bitter coffee finish.'),
(4, 'Amy', 5, 'Best served at a pub, in a Guinness glass with just the right amount of head and temperature. It has a buttery aroma of roasted malts, coffee, dark chocolate and caramel, with a tiny hint of alcohol.'),
(4, 'Bradley', 5, 'Good base stout. Not too expensive and nails the stout taste.');

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



ROLLBACK;

SELECT br_id, reviewer_name, rating, review_body 
FROM beer_reviews
WHERE br_id = 4;

SELECT ROUND(AVG(rating)::numeric, 1) FROM beer_reviews WHERE br_id =4;

SELECT DISTINCT style FROM beers;

SELECT * FROM app_user;

SELECT * FROM beers;

INSERT INTO fav_beers(user_id, br_id)
VALUES(4, 3), (4, 5);

SELECT * FROM fav_beers;

INSERT INTO breweries_beers(brw_id, br_id)
VALUES(4, 3), (4, 5);

CREATE TABLE app_user_breweries(
user_id INT NOT NULL, brw_id INT NOT NULL,
CONSTRAINT pk_app_user_breweries PRIMARY KEY (user_id, brw_id),
CONSTRAINT fk_app_user_breweries_user_id FOREIGN KEY (user_id) REFERENCES app_user(id),
CONSTRAINT fk_app_user_breweries_brw_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id)
);

INSERT INTO app_user_breweries(user_id, brw_id)
VALUES(4, 3), (4, 5);

SELECT * FROM breweries
JOIN app_user_breweries ON app_user_breweries.brw_id = breweries.brw_id
JOIN app_user ON app_user_breweries.user_id = app_user.id
WHERE app_user.user_id = 4;
