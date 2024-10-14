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
ORDER BY location, date
LIMIT 5;

-- (1). Total Cases vs Total Deaths (in %) 👇
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

-- (2). Total Cases Vs Population 👇 
-- Shows the % of the population that got Covid-19
SELECT 
    Location, 
    Date,
    Population,
    Total_cases, 
    ROUND((total_cases / population) * 100, 2) AS Percent_population_infected
FROM 
    portfoliodb.covid_deaths
WHERE location = 'Nigeria'
ORDER BY 
    location, date;

-- (3). Countries with highest infection rate compared population
SELECT 
    Location, 
    Population,
    MAX(total_cases) AS Highest_infection_count, 
    ROUND(MAX((total_cases / population) * 100), 2) AS Percent_population_infected
FROM 
    portfoliodb.covid_deaths
-- WHERE location = 'Nigeria'
GROUP BY
	Location, 
    Population
ORDER BY 
    Percent_population_infected DESC;
    
-- (4). Countries with highest deaths compared to population
SELECT 
    Location, 
    MAX(CONVERT(NULLIF(total_deaths, '') , UNSIGNED)) AS Total_death_count
FROM 
    portfoliodb.covid_deaths
-- WHERE 
--     continent IS NOT NULL -- Ensure that the continent is specified
--     AND Location NOT IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica') -- Exclude continents
GROUP BY
    Location
ORDER BY 
    Total_death_count DESC;

-- (5). By Total Deaths by Continents
SELECT 
    continent, 
    MAX(CONVERT(NULLIF(total_deaths, '') , UNSIGNED)) AS Total_death_count
FROM portfoliodb.covid_deaths
WHERE 
    continent IS NOT NULL 
    AND continent != ''  -- Exclude empty strings
GROUP BY continent
ORDER BY Total_death_count DESC;

