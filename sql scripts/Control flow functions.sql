select distinct country_name,	
	case
		when country_name in("Angola","Botswana","comoros","Democratic republic of congo","Eswatini","Lesotho","Madagsacar","Malawi",
        "Mauritius","Mozambique","Namibia","Sychelles","South Africa","United republic of tanzania","Zambia","zimbambwe")
        then "SADC"
		else "Not Classified"
    case
		when country_name in("Kenya","Tanzania","Uganda","Somalia","ethiopia","South sudan","Djibouti","Rwanda","Burundi")
        then "East africa"
	else
		"not classsified"
	end as regional_economic_community
from	
	united_nations.access_to_basic_services
where 
	region like "%africa%"