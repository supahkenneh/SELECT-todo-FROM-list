--Drops database if it exists
DROP DATABASE IF EXISTS todo_app;

--Drops user if it exists
DROP USER IF EXISTS michael;

--Create a user = michael
CREATE USER michael
WITH ENCRYPTED PASSWORD 'stonebreaker';

--Creates database
CREATE DATABASE todo_app;

--connect to todo_app
\c todo_app;

