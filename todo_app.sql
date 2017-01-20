DROP USER IF EXISTS "michael";
CREATE USER "michael";
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
\connect todo_app;
DROP TABLE IF EXISTS "tasks";
CREATE TABLE "tasks" ( 
	id serial NOT NULL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	description text NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	complete boolean NOT NULL
);

ALTER TABLE "tasks" DROP COLUMN complete;
ALTER TABLE "tasks" ADD COLUMN completed_at timestamp NULL;