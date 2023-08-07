with cte as(select *,extract(dow from "Date") as day
from credit),

cte1 as(
	select "City",day,"Amount"
	from cte
	where day='0' or day='6'
)

select "City",sum("Amount") as total,count("City") as count,
sum("Amount")/count("City") as ratio
from cte1
group by "City"
order by ratio desc
limit 1
