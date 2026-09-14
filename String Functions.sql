#upper() and lower() functions
select 
	upper(country_name)upper_country_name,
    lower(country_name)lower_country_name
from
	united_nations.access_to_basic_services;
    
#ltrim,rtrim and trim() functions
select 
	rtrim(ltrim(country_name))as trimmed_country_name
from
	united_nations.access_to_basic_services;

#length() functions
select 
	distinct
		country_name,
	length(country_name)
from
	united_nations.access_to_basic_services
order by 
	country_name;
    
#position()
select
	distinct
		country_name,
    position("m" in country_name)as position
from
	united_nations.access_to_basic_services
where 
	country_name like "%m";
    
    
#left() and right() functions
select
	distinct
		Country_name,
    left(country_name,5) as left_country_name,
    right(country_name,6) as right_country_name
from
	united_nations.access_to_basic_services;
    
#substring function()
select
	distinct
		Country_name,
        substring(country_name,1,5)
from
	united_nations.access_to_basic_services;
    
#concat() function
select
	distinct
		country_name,
        Region,
        concat(country_name," located in ", region)as Location
from 
	united_nations.access_to_basic_services;
    
#replace()
select
	distinct
		Country_name,
        replace(country_name,"Lucia", "")
from
	united_nations.access_to_basic_services;
    
#Have you ever downloaded a dataset where the country names look like "Iran (Islamic Republic of)" when all you want is just "Iran"? 
select distinct 
	country_name,
    length(country_name)as country_name,
    position('(' in country_name)as pos_opening_bracket,
    trim(left(country_name,position('(' in country_name)-1)) as new_country_name,
    length(trim(left(country_name,position('(' in country_name)-1))) as length_new_country_name
from
	united_nations.access_to_basic_services
where
	country_name like "%(%)%";
   
   
select
	Country_name,
    length(country_name)as coiuntry_name_length,
    position("(" in country_name)as position,
	trim(left(country_name,position("(" in country_name)-1))as position2
from 
	united_nations.access_to_basic_services
where	
	Country_name like "%(%)%";
    
#Creating a Custom ID Using String Functions
select
	distinct
		country_name,
        time_period,
        Est_population_in_millions,
	concat(
    substring(ifnull(upper(country_name),"Unknown"),1,4),
    substring(ifnull(time_period,"unknown"),1,4),
    substring(ifnull(Est_population_in_millions,"Unknown"),-7)
    )as country_id
from
	united_nations.access_to_basic_services;