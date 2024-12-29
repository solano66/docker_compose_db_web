-- 確保 database存在
create database if not exists mydatabase;
use mydatabase;

-- 確保 table 存在
CREATE TABLE IF NOT EXISTS full_passengers(
  id INT(11), 
  pclass DECIMAL(10, 2), 
  survived DECIMAL(10, 2), 
  pname VARCHAR(100), 
  sex VARCHAR(50), 
  age INT(11),
  sibsp INT(11), 
  parch INT(11),
  ticket VARCHAR(100),
  fare DECIMAL(10, 2),
  cabin VARCHAR(50), 
  embarked VARCHAR(50),
  boat VARCHAR(50),
  body INT(11),
  homedest varchar(100)
 );

-- 讀取 csv ，/var/lib/mysql-files 為 MySQL 默認可讀取目錄
LOAD DATA
INFILE '/var/lib/mysql-files/my.csv'
INTO TABLE full_passengers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id, pclass, survived, pname, sex, @age, sibsp, parch, ticket, @fare, cabin, embarked, boat, @body, homedest)
SET age = NULLIF(@age,''), fare = nullif(@fare, ''), body = nullif(@body, '');