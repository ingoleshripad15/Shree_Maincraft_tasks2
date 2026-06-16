select * from sales1_data;
select * from sales2_data;
DESCRIBE sales1_data;

select s1.`Order ID`, s1.`Order Date`, s2.`Customer Name`,s2.Region ,s1.Category, s1.Sales, s1.Profit, s1.`Customer ID`
from sales1_data s1
inner join sales2_data s2
on s1.`Customer ID` = s2.`Customer ID`
order by `Order Date`;

select s2.region, sum(s1.Sales) as 'Total_sales'
from sales1_data s1
join sales2_data s2
on s1.`Customer ID` = s2.`Customer ID`
group by Region;

select Category, sum(Profit)/sum(Sales) as 'Profit_Margin'
from sales1_data
group by Category;

select MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Month,
       SUM(Sales) AS Monthly_sales
from sales1_data
group by MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y'))
order by Month;

select s2.`Customer Name`, sum(Sales) as 'Total Revenue'
from sales1_data s1
join sales2_data s2
on s1.`Customer ID` = s2.`Customer ID`
group by s2.`Customer Name`
order by 'Total Revenue' desc
limit 5;