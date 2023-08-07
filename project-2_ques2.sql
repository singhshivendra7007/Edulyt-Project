with cte as(
  select "Card Type",max("Amount") as "Amount"
from credit
group by "Card Type"
)

select credit."Card Type",
extract(month from credit."Date") as "month",credit."Amount"
from credit
inner join cte on credit."Amount"=cte."Amount"

