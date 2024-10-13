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