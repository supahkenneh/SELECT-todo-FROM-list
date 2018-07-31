--Drops database if it exists
DROP DATABASE IF EXISTS todo_app;

--Drops user if it exists
DROP USER IF EXISTS "michael";

--Create a user = michael
CREATE USER "michael"
WITH ENCRYPTED PASSWORD 'stonebreaker';

--Creates database
CREATE DATABASE todo_app;

--connect to todo_app
\c todo_app;

--Create table named tasks, set id as primary key
CREATE TABLE "tasks" (
  id              serial                       NOT NULL,
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
--change updated_at to be null and default to now
ALTER "updated_at"  SET NOT NULL,
ALTER "updated_at"  SET DEFAULT now();

--create a new row into tasks table
INSERT INTO "tasks" 
VALUES (
  default, 
  'Study SQL', 
  'Complete this exercise', 
  default, 
  default, 
  NULL
);

--show table
\d+ tasks;

--create new row into tasks table
INSERT INTO "tasks" (title, description) 
VALUES (
  'Study PostgreSQL',
  'Read all the documentation'
);

--select all titles with uncompleted tasks
SELECT title
FROM tasks
WHERE completed_at IS NULL;

--update task with title 'study sql', change to completed
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

--get titles and description of tasks that aren't completed
SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

