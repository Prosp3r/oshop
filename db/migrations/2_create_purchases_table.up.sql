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