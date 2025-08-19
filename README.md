# COVID-19 Data Analysis with SQL

Hi! This is one of my beginner SQL projects where I analyzed the **COVID-19 dataset** from [Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19).

The goal was simple:
- Take raw data about confirmed cases, deaths, and recoveries,
- Load it into PostgreSQL,
- And then use SQL to answer real-world questions.

##  What I Did

- Created database tables for COVID confirmed cases, deaths, and recoveries
- Combined them into a single **master table**
- Wrote SQL queries to analyze:
  * Daily new cases
  * Rolling 7-day averages
  * Death rates
  * Top 10 countries most affected

## Example Query

Here’s one query that calculates the **rolling 7-day average of daily new cases**:

```sql
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
```

## Project Structure

```
covid19-sql-analysis/
│
├── sql/
│   ├── create_tables.sql       # Table creation
│   ├── load_data.sql           # Load into master table
│   └── analysis_queries.sql    # My analysis queries
│
├── data/
│   └── README.md               # Link to JHU dataset
│
└── README.md                   # This file
```

## Dataset

Data is from the **Johns Hopkins CSSE COVID-19 Repository**.
[View Dataset](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data)

I didn’t upload the raw CSVs here because they’re large and update often.

## Why This Project?

I built this project to practice:

* SQL **joins**
* **Window functions** (like `LAG()` and `AVG()` over time)
* **Time series analysis** in SQL

And to show how SQL alone can be powerful enough to answer big, real-world questions.
