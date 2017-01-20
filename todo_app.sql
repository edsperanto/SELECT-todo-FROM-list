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
UPDATE "tasks" SET completed_at = now() WHERE title = 'Study SQL';
SELECT title, description FROM "tasks" WHERE completed_at IS NULL;
SELECT title, description FROM "tasks" ORDER BY created_at DESC;
INSERT INTO "tasks" (title, description, created_at) VALUES ('mistake 1', 'a test entry', now());
INSERT INTO "tasks" (title, description, created_at) VALUES ('mistake 2', 'another test entry', now());
INSERT INTO "tasks" (title, description, created_at) VALUES ('mistake 3', 'another test entry', now());
SELECT title FROM "tasks" WHERE title LIKE '%mistake%';
DELETE FROM "tasks" WHERE title = 'mistake 1';
SELECT title, description FROM "tasks" WHERE title LIKE '%mistake%';
DELETE FROM "tasks" WHERE title LIKE '%mistake%';
SELECT * FROM "tasks" ORDER BY title ASC;