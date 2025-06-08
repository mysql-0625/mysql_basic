-- LOCKING
START TRANSACTION;
SELECT * FROM guestbooks; 
UPDATE guestbooks SET title = 'Diubah oleh user 2' WHERE id =1; -- Menunggu user1 commit
COMMIT;

-- LOCKING MANUAL
START TRANSACTION;
SELECT * FROM products WHERE id = 'P1685356801' FOR UPDATE; -- Menunggu user1 commit
UPDATE products SET QUANTITY = QUANTITY - 10 WHERE id = 'P1685356801';
COMMIT;

-- DEADLOCK (saling menunggu)
START TRANSACTION;
SELECT * FROM products WHERE id = 'P1685356802' FOR UPDATE;
SELECT * FROM products WHERE id = 'P1685356801' FOR UPDATE; -- Menunggu di lock user 1

-- LOCK TABLE
-- -READ (bisa baca dan tidak bisa update table yg di lock READ user lain)
SELECT * FROM products; -- bisa langsung dijalankan
UPDATE products SET QUANTITY = QUANTITY - 10 WHERE id = 'P1685356801'; -- baru bisa running setelah table di unlock
-- -WRITE (tidak bisa baca dan tidak bisa update table yg di lock READ user lain)
SELECT * FROM products; -- baru bisa running setelah table di unlock
UPDATE products SET QUANTITY = QUANTITY - 10 WHERE id = 'P1685356801'; -- baru bisa running setelah table di unlock

-- LOOK INSTANCE (tidak dapat melakukan operasi table)
ALTER TABLE products ADD COLUMN sample VARCHAR(10); -- menunggu sampai unlock







