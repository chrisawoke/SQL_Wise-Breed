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

-- Total Cases vs Total Deaths (in %) 👇
-- This reveals the probability of dying if a person contracts covid in a particular country.
SELECT 
    Location, 
    Date, 
    Total_cases, 
    Total_deaths,
    ROUND((total_deaths / total_cases) * 100, 2) AS Death_percent
FROM 
    portfoliodb.covid_deaths
WHERE location = 'Nigeria'
ORDER BY 
    location, date;

