CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    details JSON CHECK(JSON_VALID(details)),
    dateadded TIMESTAMP on update current_timestamp NOT NULL,
    quantity INT(9),
    itemstatus VARCHAR(10)
);

INSERT INTO poducts (id, title, details, dateadded, quantity, itemstatus) VALUES 
(NULL, "Logitech Mouse M234", "", "2021-10-30 03:25:02", "100", "active"),
(NULL, "Logitech Keyboard K244", "", "2021-10-30 03:25:02", "100", "active"),
(NULL, "Black Men Dress Shoes", "", "2021-10-30 03:25:02", "100", "active");