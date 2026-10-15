-- HI 5312 Module 3: SQL and PostgreSQL Cheat Sheet

-- TERMINAL CONNECTION
-- psql -h db -U hi5304_user -d hi5304
-- Password: hi5304

-- USEFUL PSQL COMMANDS
-- \l                 List databases
-- \dn                List schemas
-- \dt                List tables
-- \d patients        Describe the patients table
-- \x                 Toggle expanded display
-- \q                 Exit psql

-- PREVIEW DATA
SELECT *
FROM patients
LIMIT 10;

-- SELECT SPECIFIC COLUMNS
SELECT patient_id, age, sex
FROM patients
LIMIT 20;

-- DISTINCT VALUES
SELECT DISTINCT sex
FROM patients
ORDER BY sex;

-- FILTERING
SELECT *
FROM patients
WHERE age >= 65;

SELECT *
FROM patients
WHERE age BETWEEN 45 AND 64;

SELECT *
FROM patients
WHERE bmi IS NULL;

-- SORTING
SELECT patient_id, age
FROM patients
ORDER BY age DESC
LIMIT 5;

-- AGGREGATION
SELECT
    COUNT(*) AS patient_count,
    AVG(age) AS mean_age,
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age
FROM patients;

-- GROUPING
SELECT
    sex,
    COUNT(*) AS patient_count,
    AVG(age) AS mean_age
FROM patients
GROUP BY sex
ORDER BY patient_count DESC;

-- HAVING
SELECT
    sex,
    COUNT(*) AS patient_count
FROM patients
GROUP BY sex
HAVING COUNT(*) >= 10;

-- INNER JOIN
SELECT
    p.patient_id,
    p.age,
    b.reading_date,
    b.systolic,
    b.diastolic
FROM patients AS p
INNER JOIN bp_readings AS b
    ON p.patient_id = b.patient_id;

-- LEFT JOIN
SELECT
    p.patient_id,
    p.age,
    m.medication_name
FROM patients AS p
LEFT JOIN medications AS m
    ON p.patient_id = m.patient_id;
