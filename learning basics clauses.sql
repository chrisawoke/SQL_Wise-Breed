-- The where clause is used to filter records or rows of data. 
-- On the otherhand, the select clause is used to filter or select actual columns 
SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';
