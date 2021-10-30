CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    userpass VARCHAR(200),
    accountstatus VARCHAR(10),
    usertype INT(1),
    joindate TIMESTAMP ON UPDATE current_timestamp NOT NULL
);

INSERT INTO user (id, email, userpass, accountstatus, usertype, joindate) VALUES 
(NULL, "sirpros@gmail.com", "password1", "ACTIVE", "1", "2021-10-21 20:12:20"),
(NULL, "prosper@samedayshop.com", "password1", "ACTIVE", "2", "2021-10-21 20:12:20"),
(NULL, "prosper@gmail.com", "password1", "ACTIVE", "2", "2021-10-21 20:12:20");
