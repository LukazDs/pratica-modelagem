-- Creating database

CREATE DATABASE "dataPractice";

-- Creating table states;

CREATE TABLE states (id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(140) UNIQUE NOT NULL);

-- Creating table cities

CREATE TABLE cities (
id SERIAL NOT NULL PRIMARY KEY, 
name VARCHAR(140) UNIQUE NOT NULL, 
"stateId" INTEGER NOT NULL REFERENCES "states"("id"));

-- Creating table customers

CREATE TABLE customers(
id SERIAL NOT NULL PRIMARY KEY,
"fullName" VARCHAR(255) UNIQUE NOT NULL,
cpf BIGINT UNIQUE NOT NULL,
email TEXT UNIQUE NOT NULL,
password TEXT NOT NULL);

-- Creating table customerPhones

CREATE TABLE "customerPhones" (
id SERIAL NOT NULL PRIMARY KEY, 
"customerId" INTEGER REFERENCES "customers"("id") NOT NULL,
number BIGINT UNIQUE NOT NULL,
type TEXT DEFAULT 'landline');

-- Creating table customerAddress

CREATE TABLE "customerAddress" (
id SERIAL NOT NULL PRIMARY KEY,
"customerId" INTEGER REFERENCES "customers"("id") NOT NULL,
street TEXT NOT NULL,
number INTEGER NOT NULL,
complement TEXT DEFAULT '',
"postalCode" BIGINT NOT NULL,
dataPractice "cityId" INTEGER REFERENCES "cities"("id") NOT NULL);

-- Creating table bankAccount

CREATE TABLE "bankAccount" (
id SERIAL NOT NULL PRIMARY KEY,
"customerId" INTEGER REFERENCES "customers"("id") NOT NULL,
"accountNumber" BIGINT UNIQUE NOT NULL,
agency BIGINT NOT NULL,
"openDate" DATE NOT NULL,
"closeDate" DATE NOT NULL);

-- Creating table transactions

CREATE TABLE transactions (
id SERIAL NOT NULL PRIMARY KEY,
"bankAccountId" INTEGER REFERENCES "bankAccount"("id") NOT NULL,
amount INTEGER NOT NULL,
type TEXT DEFAULT 'deposit' NOT NULL,
time TIMESTAMP NOT NULL,
description TEXT NOT NULL,
cancelled BOOLEAN NOT NULL );

-- Creating table creditCards

CREATE TABLE "creditCards" (
id SERIAL NOT NULL PRIMARY KEY,
"bankAccountId" INTEGER REFERENCES "bankAccount"("id") NOT NULL,
name VARCHAR(140) UNIQUE NOT NULL,
number BIGINT NOT NULL, 
"securityCode" BIGINT NOT NULL,
"expirationMonth" INTEGER NOT NULL, 
"expirationYear" INTEGER NOT NULL,
password TEXT NOT NULL, 
"limit" INTEGER NOT NULL);

