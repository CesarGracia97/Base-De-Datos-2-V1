DELIMITER //
CREATE PROCEDURE orden_producto (orderNumber int, orderDate date, 
                                  requiredDate date, shippedDate date, 
								  status varchar(15), comments text,  
                                  customerNumber int, productCode varchar(15), 
                                  quantityOrdered int, priceEachP decimal(10, 2), 
                                  orderLineNumber smallint)
BEGIN
            insert  into `orders`(`orderNumber`,`orderDate`,`requiredDate`,`shippedDate`,`status`,`comments`,`customerNumber`)
            values (orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber);
            insert  into `orderdetails`(`orderNumber`,`productCode`,`quantityOrdered`,`priceEach`,`orderLineNumber`)
            values  (orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber);
            select max(orders.orderNumber) as number from orders;
select 'Orden registrada' AS 'Mensaje';
END //
DELIMITER ;

CALL orden_producto('11101','2020-06-13','2020-06-13','2020-06-13','Shipped','','323','S10_1678','8','103.45','5');
