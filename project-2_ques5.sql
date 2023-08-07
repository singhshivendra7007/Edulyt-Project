with cte as
(select "City",max("Amount") as "max",min("Amount") as "min"
from credit
group by "City"
order by "City" asc),
cte1 as(
	select credit."City",credit."Exp Type" as "High Exp",cte."max"
	from cte
	left join credit
	on credit."Amount"=cte."max"
) ,
cte2 as(
	select credit."City",credit."Exp Type" as "Low Exp",cte."min"
	from cte
	left join credit
	on credit."Amount"=cte."min"
)

select c1."City" , c1."High Exp",c2."Low Exp" from
cte1 c1 join cte2 c2
on c1."City"=c2."City"



