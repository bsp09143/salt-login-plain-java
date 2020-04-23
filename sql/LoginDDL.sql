create database loginExample;  
use loginExample;

create table User(
id MEDIUMINT NOT NULL AUTO_INCREMENT,
UserId VARCHAR(75) NOT NULL,
Password VARCHAR(85) NOT NULL,
encid VARCHAR(200),
PRIMARY KEY (id)
);

INSERT INTO loginExample.User(encid,UserId,Password) VALUES('Z4ZQZOZG2SC2SCS2UQVGUSWAUSVW4O0Q','admin','admin');

create table loginExample.IRC_SALT_TEMP(
id MEDIUMINT NOT NULL AUTO_INCREMENT,
SALTNO VARCHAR(200) NOT NULL, 
GUID  VARCHAR(200) NOT NULL, 
PRIMARY KEY (id) 
);

SELECT * FROM loginExample.USER;
SELECT * FROM loginExample.IRC_SALT_TEMP;

