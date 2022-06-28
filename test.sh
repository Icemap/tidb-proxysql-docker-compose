mysql -u root -h 127.0.0.1 -P 4000 << EOF
DROP TABLE IF EXISTS test.test;
CREATE TABLE test.test (db VARCHAR(255));
INSERT INTO test.test (db) VALUES ('write-database');
DROP USER IF EXISTS 'write_account';
CREATE USER 'write_account';
GRANT ALL ON *.* TO 'write_account';
EOF

mysql -u root -h 127.0.0.1 -P 4001 << EOF
DROP TABLE IF EXISTS test.test;
CREATE TABLE test.test (db VARCHAR(255));
INSERT INTO test.test (db) VALUES ('read-database');
DROP USER IF EXISTS 'read_account';
CREATE USER 'read_account';
GRANT ALL ON *.* TO 'read_account';
EOF

mysql -u write_account -h 127.0.0.1 -P 6033 -e "select * from test.test"
mysql -u read_account -h 127.0.0.1 -P 6033 -e "select * from test.test"