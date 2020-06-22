use classicmodels;
/*-----------Tabla-------------*/
drop table if exists logProducts;
create table logProducts(
id int auto_increment,
productCode VARCHAR(15),
dateLog TIMESTAMP DEFAULT NOW(),
descripcion VARCHAR(255) NOT NULL,
PRIMARY KEY (id, productCode));
/*-----------Disparador---------------*/
use classicmodels;
DELIMITER $$
DROP TRIGGER IF EXISTS after_inserts_products;
create trigger after_inserts_products
after insert on products
for each row
Begin
		INSERT INTO logProducts(productCode, descripcion)
        VALUES (new.productCode, CONCAT('Se ha añadido un nuevo producto: ', NEW.productName));
End$$
DELIMITER ; 
/*-------------Ejemplo-------------*/
INSERT INTO products(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES('B85_1563','tren grande','Trains','1:72','España','Nuevo producto',4554,18.51,41.51);
SELECT * FROM classicmodels. logProducts;
/*-----------Disparador-------------*/
DELIMITER $$
DROP TRIGGER IF EXISTS after_update_products;
create trigger after_update_products
after update on products
for each row
Begin
		INSERT INTO logProducts(productCode, descripcion)
        VALUES (new.productCode, CONCAT('Se ha actualizado un producto: ', NEW.productName));
End$$
DELIMITER ; 

UPDATE products
SET productVendor = 'Multiplaza'
WHERE productCode = 'B85_1563';



