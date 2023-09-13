--to calculate the total prize of pizzas ordered
SELECT SUM(total_price) as TotalPrice from sales

--avg order value
select sum(total_price)/ count(distinct(order_id)) as avg_order_value from sales

--total orders
select count(distinct (order_id)) as  total_orders from sales;

--quanity of total pizzas sold
select sum(quantity) as total_pizzas_sold from sales

--Average pizzas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM sales

--daily trend for orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM sales
GROUP BY DATENAME(DW, order_date)

--monthly trend for orders
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from sales
GROUP BY DATENAME(MONTH, order_date)

--percentage sales by pizza category
SELECT pizza_category,
SUM(total_price) * 100 / (SELECT SUM(total_price) from sales )AS PCT
FROM sales
GROUP BY pizza_category

--percentage sales by pizza size
SELECT pizza_size,
SUM(total_price) * 100 / (SELECT SUM(total_price) from sales where datepart(quarter,order_date)=1 ) AS PCT
FROM sales
 where datepart(quarter,order_date)=1
GROUP BY pizza_size
order by pizza_size

--Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 Pizzas by revenue

--top 5 pizzas by quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


--Bottom 5 Pizzas by quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 pizzas by total order
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC




