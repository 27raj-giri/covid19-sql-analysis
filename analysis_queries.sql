SELECT 
    country_region,
    date,
    confirmed - LAG(confirmed) OVER (
        PARTITION BY country_region ORDER BY date
    ) AS daily_new_cases
FROM covid_master
ORDER BY country_region, date;

WITH daily AS (
    SELECT 
        country_region,
        date,
        confirmed - LAG(confirmed) OVER (
            PARTITION BY country_region ORDER BY date
        ) AS daily_new_cases
    FROM covid_master
)
SELECT 
    country_region,
    date,
    AVG(daily_new_cases) OVER (
        PARTITION BY country_region 
        ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_avg
FROM daily;

SELECT 
    country_region,
    date,
    (deaths::NUMERIC / NULLIF(confirmed,0)) * 100 AS death_rate
FROM covid_master
WHERE confirmed > 1000;

SELECT 
    country_region,
    MAX(confirmed) AS total_cases,
    MAX(deaths) AS total_deaths,
    MAX(recovered) AS total_recovered
FROM covid_master
GROUP BY country_region
ORDER BY total_cases DESC
LIMIT 10;


