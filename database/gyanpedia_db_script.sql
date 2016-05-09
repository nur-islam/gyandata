create database gyanpedia;

use gyanpedia;

CREATE TABLE user_details (
    user_details_id INT PRIMARY KEY AUTO_INCREMENT,
    user_details_name VARCHAR(50),
    user_details_organization VARCHAR(100),
    user_details_role VARCHAR(50),
    user_details_password VARCHAR(50),
    user_details_createdate DATE,
    user_details_phone INT,
    user_details_street VARCHAR(50),
    user_details_city VARCHAR(50),
    user_details_state VARCHAR(50),
    user_details_pincode INT,
    user_details_email VARCHAR(50),
    user_details_country VARCHAR(50),
    user_details_stream VARCHAR(100),
    user_details_nationality VARCHAR(100),
    user_details_gender VARCHAR(6)
)  ENGINE=INNODB;

CREATE TABLE user_content (
    user_content_id INT PRIMARY KEY AUTO_INCREMENT,
    user_details_id INT REFERENCES user_details,
    user_content_details VARCHAR(5000),
    user_content_created_on DATE,
	user_content_created_by int REFERENCES user_details
	
)  ENGINE=INNODB;

CREATE TABLE user_content_reply (
    user_content_reply_id INT PRIMARY KEY AUTO_INCREMENT,
    user_details_id INT REFERENCES user_details,
    user_content_id INT REFERENCES user_content,
    user_content_reply_details VARCHAR(5000),
    user_content_reply_created_on DATE,
	user_content_reply_created_by int REFERENCES user_details
)  ENGINE=INNODB;
