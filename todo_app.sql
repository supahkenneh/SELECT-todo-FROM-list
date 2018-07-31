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

--Create table named tasks, set id as primary key
CREATE TABLE tasks (
  id              integer                       NOT NULL,
  title           varchar(255)                  NOT NULL,
  description     text,
  created_at      timestamp without time zone   NOT NULL DEFAULT now(),
  updated_at      timestamp without time zone,
  completed       boolean                       NOT NULL DEFAULT false,
  PRIMARY KEY(id)
);

--remove column named completed
ALTER TABLE "tasks"
DROP "completed",
--add column named completed_at
ADD "completed_at"  timestamp DEFAULT null,
--change updated_at to be null
ALTER "updated_at"  SET NOT NULL,
ALTER "updated_at"  SET DEFAULT now()
