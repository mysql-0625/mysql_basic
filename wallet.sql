-- One To One Relation
CREATE TABLE wallet (
	id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY id_customer_unique (id_customer),
    FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customers(id)
);

DESC wallet;
SHOW CREATE TABLE wallet;

SELECT * FROM customers;
SELECT * FROM wallet;

INSERT INTO wallet (id_customer) VALUES (1), (2);
INSERT INTO wallet (id_customer, balance) VALUES (4, 150000);

SELECT wa.id AS wallet_id, c.id AS customer_id, c.last_name AS customer_lastname, wa.balance AS wallet_balance
FROM wallet AS wa
JOIN customers AS c ON (wa.id_customer = c.id);




