with cte as(select *
from (
select *,sum("Amount") over(partition by "Card Type" order by "Amount") as "total"
	from credit
) t
where total <=1008000
)

select * 
from cte
where "total">=1000000
