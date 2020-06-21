CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `classicmodels`.`cliente_mayor_cantidad_compras_view` AS
    SELECT 
        COUNT(`o`.`customerNumber`) AS `cantVentas`,
        `c`.`customerName` AS `customerName`,
        SUM(`od`.`quantityOrdered` * `od`.`priceEach`) AS `VentaTotal`,
        COUNT(DISTINCT `od`.`productCode`) AS `ProductosDiferentes`
    FROM
        ((`classicmodels`.`customers` `c`
        JOIN `classicmodels`.`orders` `o`)
        JOIN `classicmodels`.`orderdetails` `od`)
    WHERE
        `c`.`customerNumber` = `o`.`customerNumber`
            AND `o`.`orderNumber` = `od`.`orderNumber`
            AND `o`.`orderDate` BETWEEN CAST('2003-05-31' AS DATE) AND CAST('2004-05-31' AS DATE)
    GROUP BY `c`.`customerNumber`
    ORDER BY COUNT(`o`.`customerNumber`) DESC
    LIMIT 1