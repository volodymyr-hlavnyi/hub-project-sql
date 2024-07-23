use 310524ptm_volodymyr;
select database();

CREATE TABLE IF NOT EXISTS 
Person 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS
Passport
(
id INT PRIMARY KEY,
passport_number VARCHAR(20),
passport_id VARCHAR(25),
issued_by VARCHAR(75),
issue_year Date,
exp_date Date,
user_id int UNIQUE,
FOREIGN KEY (user_id) REFERENCES Person(id)
)
;

CREATE TABLE IF NOT EXISTS Teacher 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50)

);

CREATE TABLE IF NOT EXISTS Class 
(
id INT PRIMARY KEY,
class_number INT, 
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teacher(id)
);

CREATE TABLE IF NOT EXISTS Student 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50),
class_id INT,
FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE IF NOT EXISTS Store 
(
id INT PRIMARY KEY,
address VARCHAR(255),
name VARCHAR(55)
);


CREATE TABLE IF NOT EXISTS Customer 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS StoreCustomer 
(
store_id INT,
customer_id INT,
PRIMARY KEY (store_id, customer_id),
FOREIGN KEY (store_id) REFERENCES Store(id),
FOREIGN KEY (customer_id) REFERENCES Customer(id)
);
