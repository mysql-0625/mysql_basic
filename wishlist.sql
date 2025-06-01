CREATE TABLE wishlist (
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(15) NOT NULL,
    description TEXT,
    PRIMARY KEY(id),
    CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id)
);

DESC wishlist;
SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id);

INSERT INTO wishlist (id_product, description) VALUES ('P1685356845', 'Stok gula Mei');
-- INSERT INTO wishlist (id_product, description) VALUES ('P16853568450', 'Stok gula Mei'); Gagal add krn tidak ada id tsb

SELECT * FROM wishlist;

DELETE FROM products WHERE id = 'P1685356845'; -- Tidak dapat hapus product krn fk ada di wishlist

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Atur ketika update/delete di parent, maka di child ikut terupdate (default : RESTRICT)

INSERT INTO wishlist (id_product, description) VALUES ('P1685357098', 'Sandal Rumah');

DELETE FROM products WHERE id = 'P1685357098'; -- di wishlist akan ikut terhapus setelah di set CASCADE


