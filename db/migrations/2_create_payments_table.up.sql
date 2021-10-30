CREATE TABLE payments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    purchaseid INT,
    gateway VARCHAR(50),
    amount DECIMAL(10,2),
    dateattempted TIMESTAMP on update current_timestamp NOT NULL,
    paymentstatus VARCHAR(50)
);