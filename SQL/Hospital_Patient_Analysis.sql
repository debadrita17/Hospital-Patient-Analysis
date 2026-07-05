-- ===========================================
-- Healthcare Operations & Billing Analysis
-- ===========================================

CREATE DATABASE healthcare_project;
USE healthcare_project;

-- Dataset Preview
-- View the first 10 records
SELECT * 
FROM healthcare_cleaned
LIMIT 10;

-- Check Dataset Structure
DESCRIBE healthcare_cleaned;

-- How many total patients are recorded?
SELECT COUNT(*) AS total_patients
FROM healthcare_cleaned;

 -- What is the patient distribution across age groups?
SELECT
CASE
    WHEN Age BETWEEN 13 AND 17 THEN '13-17'
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 44 THEN '25-44'
    WHEN Age BETWEEN 45 AND 64 THEN '45-64'
    ELSE '65+'
END AS age_group,
COUNT(*) AS patient_count
FROM healthcare_cleaned
GROUP BY age_group;

-- Which medical conditions are most common?
SELECT `Medical Condition`,
COUNT(*) AS condition_count
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY condition_count DESC;

-- Which admission type is most common?
SELECT `Admission Type`,
COUNT(*) AS admissions
FROM healthcare_cleaned
GROUP BY `Admission Type`
ORDER BY admissions DESC;

-- Which insurance provider is used most frequently?
SELECT `Insurance Provider`,
COUNT(*) AS provider_usage
FROM healthcare_cleaned
GROUP BY `Insurance Provider`
ORDER BY provider_usage DESC;

-- Which insurance provider contributes the highest billing amount?
SELECT `Insurance Provider`,
SUM(`Billing Amount`) AS total_billing
FROM healthcare_cleaned
GROUP BY `Insurance Provider`
ORDER BY total_billing DESC;

-- What is the average billing amount per patient?
SELECT AVG(`Billing Amount`) AS average_billing
FROM healthcare_cleaned;

-- Which medical condition generates the highest billing revenue?
SELECT `Medical Condition`,
SUM(`Billing Amount`) AS billing
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY billing DESC;

-- Which hospitals generate the highest revenue?
SELECT Hospital,
SUM(`Billing Amount`) AS total_revenue
FROM healthcare_cleaned
GROUP BY Hospital
ORDER BY total_revenue DESC
LIMIT 10;



