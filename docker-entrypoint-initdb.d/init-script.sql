CREATE DATABASE IF NOT EXISTS oshop;
-- SHOW DATABASES;
-- CREATE USER 'dbadmin'@'%' IDENTIFIED BY 'password1';
-- GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `oshop`.* TO 'dbadmin'@'%';
-- FLUSH PRIVILEGES;
--
USE oshop;
--
DROP TABLE IF EXISTS payments;
--
CREATE TABLE payments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    purchaseid INT,
    gateway VARCHAR(50),
    amount DECIMAL(10,2),
    dateattempted TIMESTAMP on update current_timestamp NOT NULL,
    paymentstatus VARCHAR(50)
);
--
DROP TABLE IF EXISTS purchases;
--
CREATE TABLE purchases (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    productdetails JSON CHECK(JSON_VALID(productdetails)),
    deliverydetails  JSON CHECK(JSON_VALID(deliverydetails)),
    paymentdetails JSON CHECK(JSON_VALID(paymentdetails)),
    checkoutdate TIMESTAMP on update current_timestamp NOT NULL,
    totalprice DECIMAL(10,2),
    purchasestatus VARCHAR(20)
);
--
DROP TABLE IF EXISTS views;
--
CREATE TABLE views (
    productid INT,
    views BIGINT
);
--
DROP TABLE IF EXISTS products;
--
CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    details JSON CHECK(JSON_VALID(details)),
    dateadded TIMESTAMP on update current_timestamp NOT NULL,
    quantity INT(9),
    itemstatus VARCHAR(10)
);
--
INSERT INTO poducts (id, title, details, dateadded, quantity, itemstatus) VALUES 
(NULL, "Logitech Mouse M234", "Logitech Mouse M234", "2021-10-30 03:25:02", "100", "active"),
(NULL, "Logitech Keyboard K244", "Logitech Mouse M234", "2021-10-30 03:25:02", "100", "active"),
(NULL, "Black Men Dress Shoes", "Logitech Mouse M234", "2021-10-30 03:25:02", "100", "active");
--
DROP TABLE IF EXISTS user;
--
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    userpass VARCHAR(200),
    accountstatus VARCHAR(10),
    usertype INT(1),
    joindate TIMESTAMP ON UPDATE current_timestamp NOT NULL
);
--
INSERT INTO user (id, email, userpass, accountstatus, usertype, joindate) VALUES 
(NULL, "sirpros@gmail.com", "password1", "ACTIVE", "1", "2021-10-21 20:12:20"),
(NULL, "prosper@samedayshop.com", "password1", "ACTIVE", "2", "2021-10-21 20:12:20"),
(NULL, "prosper@gmail.com", "password1", "ACTIVE", "2", "2021-10-21 20:12:20");
--
