
-- PROJECT: IAI UNIVERSITY MANAGEMENT DATABASE
-- FILE: 00_create_database.sql
-- DBMS: MariaDB
-- PURPOSE: Create the project database

CREATE DATABASE IF NOT EXISTS iai_university_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Select the database
USE iai_university_db;

-- Display the selected database
SELECT DATABASE() AS current_database;
