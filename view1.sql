create view producto_mas_vendido_view as
select p.productName, p.productLine, sum(od.quantityOrdered*od.priceEach) VentaTotal, count(o.customerNumber) Clientes
from products p, orderdetails od, orders o
where p.productCode=od.productCode and o.orderNumber=od.orderNumber 
group by p.productCode
order by VentaTotal desc
limit 1;
