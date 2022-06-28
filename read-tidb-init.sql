DROP TABLE IF EXISTS test.test;
CREATE TABLE test.test (db VARCHAR(255));
CREATE USER 'read_account'@'%';
GRANT ALL ON *.* TO 'read_account';

INSERT INTO test.test (db) VALUES ('read-database');