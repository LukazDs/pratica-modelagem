-- Creating database

CREATE DATABASE "dataPractice";

-- Creating table states;

CREATE TABLE states (id SERIAL PRIMARY KEY, name VARCHAR(140) NOT NULL);

-- Creating table cities;

CREATE TABLE cities (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(140) NOT NULL, 
	"stateId" INTEGER NOT NULL REFERENCES "states"("id"));

