--Total vaccines administered by country
select
	c.country,
	v.vaccination_provider,
	sum(u.cumulative_persons_vaccinated)
from
	us_vacc_totals_by_provider u
join 
	countries c on u.location_key = c.country_code
join 
	vaccination_providers v on u.vaccination_provider_id = v.vaccination_provider_id
where
	u.vaccination_provider_id = '1'
group by 
	v.vaccination_provider, 
	c.country
;

--Total vaccines people fully vaccinated  by country 
select
	sum(u.cumulative_persons_fully_vaccinated),
	c.country_code
from
	us_vacc_totals_by_provider u
join
	countries c on u.location_key = c.country_code
group by
	c.country_code
	
	