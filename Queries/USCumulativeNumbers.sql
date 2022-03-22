Select
us.date,
co.country_code,
us.cumulative_persons_vaccinated,
us.cumulative_persons_fully_vaccinated,
us.cumulative_vaccine_doses_administered
FROM
us_vacc_totals_by_provider as us
inner join countries as co
	on co.country_code=us.location_key
WHERE
co.country_code = 'US'
ORDER BY
	us.date asc;
