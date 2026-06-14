-- HR Analytics SQL Project
-- Author: Facundo Miranda
-- Description:
-- SQL analysis of employee attrition, compensation,
-- demographics, education, and tenure.
-- =====================================================

-- =====================================================
-- Challenge 1
-- Calculate the employee attrition rate.
-- =====================================================

WITH left_employees AS (
SELECT COUNT(*) AS total_attrition
FROM data
WHERE Attrition = 'Yes'
),
total_employees AS (
SELECT COUNT(*) AS total
FROM data
)

SELECT
(total_attrition * 100.0 / total) AS attrition_rate
FROM left_employees
CROSS JOIN total_employees;

-- =====================================================
-- Challenge 2
-- Find the number of employees who left from each
-- department and rank departments by attrition count.
-- =====================================================

SELECT
Department,
COUNT(*) AS left_employees
FROM data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY left_employees DESC;

-- =====================================================
-- Challenge 3
-- Compare average monthly income of employees who left
-- versus employees who remained with the company.
-- =====================================================

WITH employee_avg AS (
SELECT
AVG(MonthlyIncome) AS employed_salary
FROM data
WHERE Attrition = 'No'
),
left_employee AS (
SELECT
AVG(MonthlyIncome) AS attrition_salary
FROM data
WHERE Attrition = 'Yes'
)

SELECT
employed_salary,
attrition_salary
FROM left_employee
CROSS JOIN employee_avg;

-- =====================================================
-- Challenge 4
-- Segment employees into age groups and calculate
-- attrition counts for each segment.
-- =====================================================

SELECT
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age >= 30 AND Age < 40 THEN '30-39'
WHEN Age >= 40 AND Age < 50 THEN '40-49'
ELSE '50+'
END AS age_band,
COUNT(*) AS employees_left
FROM data
WHERE Attrition = 'Yes'
GROUP BY age_band
ORDER BY
CASE
WHEN age_band = 'Under 30' THEN 1
WHEN age_band = '30-39' THEN 2
WHEN age_band = '40-49' THEN 3
WHEN age_band = '50+' THEN 4
END;

-- =====================================================
-- Challenge 5
-- Identify education fields with the highest
-- employee attrition.
-- =====================================================

SELECT
EducationField,
COUNT(*) AS employees_attrition
FROM data
WHERE Attrition = 'Yes'
GROUP BY EducationField
ORDER BY employees_attrition DESC;

-- =====================================================
-- Challenge 6
-- Calculate the average number of years employees
-- stayed with the company before leaving.
-- =====================================================

SELECT
ROUND(AVG(YearsAtCompany), 1) AS avg_years_before_exit
FROM data
WHERE Attrition = 'Yes';
