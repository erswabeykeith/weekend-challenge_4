
CREATE TABLE tasks (
	id SERIAL PRIMARY KEY,
	taskName VARCHAR(100) UNIQUE NOT NULL);

SELECT * FROM tasks;

ALTER TABLE tasks
  ADD completionStatus VARCHAR(50);


INSERT INTO tasks (taskname, completionstatus)
VALUES ('Do the dishes', 'yes');
