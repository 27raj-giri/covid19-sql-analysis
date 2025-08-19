CREATE TABLE covid_confirmed (
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    lat NUMERIC,
    long NUMERIC,
    date DATE,
    confirmed INT
);

CREATE TABLE covid_deaths (
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    lat NUMERIC,
    long NUMERIC,
    date DATE,
    deaths INT
);

CREATE TABLE covid_recovered (
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    lat NUMERIC,
    long NUMERIC,
    date DATE,
    recovered INT
);

