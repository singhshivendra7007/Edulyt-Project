select * from credit

with cte as(
select *,sum("Amount") over (partition by "Card Type"order by "Amount") as "total"
from credit)

select "Card Type",min("total") 
from cte
group by "Card Type"
having "total">=1000000

with cte as (
 select *,sum("Amount") over(ORDER BY "Amount" 
							 ROWS BETWEEN UNBOUNDED PRECEDING 
							 AND UNBOUNDED FOLLOWING) as "total"
	from credit
)
select "City",cast("Amount"/"total"*100 as float) as "amount"
from cte
where "Card Type"='Gold'
group by "City"
