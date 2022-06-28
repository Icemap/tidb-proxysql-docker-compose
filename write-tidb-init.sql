DROP TABLE IF EXISTS test.test;
CREATE TABLE test.test (db VARCHAR(255));
CREATE USER 'write_account';
GRANT ALL ON *.* TO 'write_account';

INSERT INTO test.test (db) VALUES ('write-database');