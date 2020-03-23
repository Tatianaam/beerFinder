-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS breweries_beers;
DROP TABLE IF EXISTS brewery_reviews;
DROP TABLE IF EXISTS beer_reviews;
DROP TABLE IF EXISTS fav_breweries;
DROP TABLE IF EXISTS fav_beers;
DROP TABLE IF EXISTS app_user_breweries;


CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  personal_name varchar(164) NOT NULL,
  password varchar(32) NOT NULL,
  birthday date,
  email varchar(128) NOT NULL,
  phone varchar(32) NOT NULL,
  city varchar(128) NOT NULL,
  state varchar(4) NOT NULL,
  zip varchar(10) NOT NULL,
  favBeer varchar(164) NOT NULL,
  role varchar(32) NOT NULL,
  salt varchar(255) NOT NULL
);


CREATE TABLE breweries(
brw_id serial PRIMARY KEY,
name VARCHAR UNIQUE NOT NULL,
contact_no VARCHAR,
days_open VARCHAR,
hours_open VARCHAR,
active BOOLEAN,
street_address VARCHAR UNIQUE NOT NULL,
city VARCHAR,
state VARCHAR,
zip VARCHAR,
imgString VARCHAR,
description VARCHAR
);

CREATE TABLE beers(
br_id serial PRIMARY KEY,
name VARCHAR UNIQUE NOT NULL,
style VARCHAR NOT NULL,
abv VARCHAR NOT NULL,
description VARCHAR NOT NULL,
imgString VARCHAR NOT NULL
);


CREATE TABLE breweries_beers(
brw_id INT NOT NULL, br_id INT NOT NULL,
CONSTRAINT pk_breweries_beers PRIMARY KEY (brw_id, br_id),
CONSTRAINT fk_breweries_beers_brw_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id),
CONSTRAINT fk_breweries_beers_br_id FOREIGN KEY (br_id) REFERENCES beers(br_id)
);

CREATE TABLE brewery_reviews(
brw_r_id serial PRIMARY KEY,
brw_id INT NOT NULL,
reviewer_name VARCHAR NOT NULL,
rating INT NOT NULL,
review_body VARCHAR NOT NULL,
CONSTRAINT fk_breweries_r_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id)
);

CREATE TABLE beer_reviews(
br_r_id serial PRIMARY KEY,
br_id INT NOT NULL,
reviewer_name VARCHAR NOT NULL,
rating INT NOT NULL,
review_body VARCHAR NOT NULL,
CONSTRAINT fk__beers_r_id FOREIGN KEY (br_id) REFERENCES beers(br_id)
);

CREATE TABLE fav_beers(
user_id INT NOT NULL, br_id INT NOT NULL,
CONSTRAINT pk_user_beers PRIMARY KEY (user_id, br_id),
CONSTRAINT fk_user_beers_user_id FOREIGN KEY (user_id) REFERENCES app_user(id),
CONSTRAINT fk_user_beers_br_id FOREIGN KEY (br_id) REFERENCES beers(br_id)
);


CREATE TABLE fav_breweries(
user_id INT NOT NULL, brw_id INT NOT NULL,
CONSTRAINT pk_user_breweries PRIMARY KEY (user_id, brw_id),
CONSTRAINT fk_user_breweries_user_id FOREIGN KEY (user_id) REFERENCES app_user(id),
CONSTRAINT fk_user_breweries_brw_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id)
);

CREATE TABLE app_user_breweries(
user_id INT NOT NULL, brw_id INT NOT NULL,
CONSTRAINT pk_app_user_breweries PRIMARY KEY (user_id, brw_id),
CONSTRAINT fk_app_user_breweries_user_id FOREIGN KEY (user_id) REFERENCES app_user(id),
CONSTRAINT fk_app_user_breweries_brw_id FOREIGN KEY (brw_id) REFERENCES breweries(brw_id)
);

COMMIT;