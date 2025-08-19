CREATE TABLE covid_master AS
SELECT 
    c.province_state,
    c.country_region,
    c.lat,
    c.long,
    c.date,
    c.confirmed,
    d.deaths,
    r.recovered
FROM covid_confirmed c
LEFT JOIN covid_deaths d 
    ON c.country_region = d.country_region 
   AND c.province_state = d.province_state 
   AND c.date = d.date
LEFT JOIN covid_recovered r 
    ON c.country_region = r.country_region 
   AND c.province_state = r.province_state 
   AND c.date = r.date;
