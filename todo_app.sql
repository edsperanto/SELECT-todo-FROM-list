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
ALTER TABLE "tasks" ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN updated_at SET DEFAULT now();
INSERT INTO "tasks" VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO "tasks" (title, description, created_at) VALUES ('Study PostgreSQL', 'Read all the documentation', now());
SELECT title FROM "tasks" WHERE completed_at IS NULL;