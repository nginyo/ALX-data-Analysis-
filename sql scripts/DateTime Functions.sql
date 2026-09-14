#current_date
select
	current_date();
#NOW()
select
	NOW()as timestamp;

select 
	current_timestamp() as current;
    
 #Day(),Month(),Year()   
select
	day(time_period)
from
	united_nations.access_to_basic_services;

select
	year(time_period)as day
from
	united_nations.access_to_basic_services;
    
select 	
	month(time_period)
from	
	united_nations.access_to_basic_services;

#datediff()
select 
	datediff(year,time_period,now()) as years_elapsed
from 
	united_nations.access_to_basic_services;
    
#dateadd()
select
	date_add(time_period,interval 7 year)
from 	
	united_nations.access_to_basic_services;
    
    
select *
from united_nations.access_to_basic_services