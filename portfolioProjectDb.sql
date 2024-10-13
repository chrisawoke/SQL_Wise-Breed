SELECT * 
FROM portfoliodb.covid_deaths
ORDER BY 3,4;

-- SELECT * 
-- FROM portfoliodb.covid_vaccinations
-- ORDER BY 3,4;

SELECT location, date, 
total_cases, new_cases,
total_deaths, population
FROM portfoliodb.covid_deaths
ORDER BY location, date;

-- Total Cases vs Total Deaths

SELECT 
    Location, 
    date, 
    total_cases, 
    total_deaths,
    ROUND((total_deaths / total_cases) * 100, 2) AS Death_Percent
FROM 
    portfoliodb.covid_deaths
ORDER BY 
    location, date;

