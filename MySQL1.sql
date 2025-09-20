create database zepto;
use zepto;

-- count the no of rows
select count(*) from zepto_v2;

-- first 10 rows
select * from  zepto_v2
limit 10;
-- rows where any col name is null
select * from zepto_v2 
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
availableQuantity is null
or
outOfStock is null
or
quantity is null
or
weightInGms is null;

-- extract distinct category and order by category
select distinct category
from zepto_v2
order by category;

-- extract outofstock
select outOfStock, count(ï»¿sku_id)
from zepto_v2
group by outOfStock;

select name, count(ï»¿sku_id) as "Number of SKUs"
from zepto_v2
group by name
having count(ï»¿sku_id)>1
order by count(ï»¿sku_id) desc;

SET SQL_SAFE_UPDATES = 0;

-- extract the row whose mrp and discountedSellingPrice is 0
select * from zepto_v2
where mrp=0 or discountedSellingPrice=0;

-- deleting the row which have mrp is 0
delete from zepto_v2
where mrp=0;

-- updating the mrp and discountedSellingPrice
update zepto_v2 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;


select mrp, discountedSellingPrice from zepto_v2;

-- find the top 10 best-value products based on discount percent

select distinct name, mrp, discountPercent
from zepto_v2
order by discountPercent desc
limit 10;

-- calculate estimated revenue for each category

select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto_v2
group by category
order by total_revenue;

-- find all product where mrp is grater than 500 and discount is less than 10%

select distinct name, mrp, discountPercent
from zepto_v2
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;

