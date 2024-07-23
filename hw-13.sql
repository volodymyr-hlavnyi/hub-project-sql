Create database if NOT EXISTS 310524ptm_taxi_volodymyr;
use 310524ptm_taxi_volodymyr;
select database();


CREATE TABLE IF NOT EXISTS 
client 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50),
email VARCHAR(100),
phone VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS 
driver 
(
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR (50),
email VARCHAR(100),
phone VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS 
rate_coef 
(
id INT PRIMARY KEY,
coef DECIMAL(5,3)
);


CREATE TABLE IF NOT EXISTS 
rate 
(
id INT PRIMARY KEY,
rate DECIMAL(7,2)
);


CREATE TABLE IF NOT EXISTS 
auto 
(
id INT PRIMARY KEY,
model VARCHAR(20),
color VARCHAR(20),
reg_number VARCHAR(10),
rate_coef_id int,
FOREIGN KEY (rate_coef_id) REFERENCES rate_coef(id)
);


CREATE TABLE IF NOT EXISTS 
work_shift 
(
id INT PRIMARY KEY,
shift VARCHAR(20),
driver_id int,
FOREIGN KEY (driver_id) REFERENCES driver(id),
auto_id int,
FOREIGN KEY (auto_id) REFERENCES auto(id)
);


CREATE TABLE IF NOT EXISTS 
feedback 
(
id INT PRIMARY KEY,
rate DECIMAL(1,0), 
description VARCHAR(200)
);


CREATE TABLE IF NOT EXISTS 
feedback_type 
(
id INT PRIMARY KEY,
f_type VARCHAR(10)
);


CREATE TABLE IF NOT EXISTS 
feedback_connect 
(
feedback_id INT,
feedback_type_id INT,
PRIMARY KEY (feedback_id, feedback_type_id),
FOREIGN KEY (feedback_id) REFERENCES feedback(id),
FOREIGN KEY (feedback_type_id) REFERENCES feedback_type(id)
);


CREATE TABLE IF NOT EXISTS
taxi_order
(
id INT PRIMARY KEY,
feedback_id int,
FOREIGN KEY (feedback_id) REFERENCES feedback(id),
rate_id int,
FOREIGN KEY (rate_id) REFERENCES rate(id),
rate_coef_id int,
FOREIGN KEY (rate_coef_id) REFERENCES rate_coef(id),
client_id int,
FOREIGN KEY (client_id) REFERENCES client(id),
driver_id int,
FOREIGN KEY (driver_id) REFERENCES driver(id)
)
;

