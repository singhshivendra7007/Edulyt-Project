with cte as(select "index","City","Date",
row_number() over(partition by "City" order by "Date") as count
from credit)

select c1."City" ,c1."Date",c2."Date",c2."Date"-c1."Date" as days
from cte c1
join cte c2	
on c1."City"=c2."City"
where c1.count='1' and c2.count='500'
order by days asc
limit 1