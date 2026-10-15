-- HI 5312 Module 5: MIMIC-IV admission-level Tableau extract
-- Run in psql or adapt for pandas.read_sql.
-- One row per hospital admission.

WITH icu_summary AS (
    SELECT
        subject_id,
        hadm_id,
        COUNT(*) AS icu_stay_count,
        SUM(los) AS total_icu_los_days,
        MIN(intime) AS first_icu_intime,
        MAX(outtime) AS final_icu_outtime,
        MIN(first_careunit) AS first_careunit
    FROM mimiciv_icu.icustays
    GROUP BY subject_id, hadm_id
),
principal_diagnosis AS (
    SELECT
        d.subject_id,
        d.hadm_id,
        d.icd_code,
        d.icd_version,
        dd.long_title AS principal_diagnosis
    FROM mimiciv_hosp.diagnoses_icd d
    LEFT JOIN mimiciv_hosp.d_icd_diagnoses dd
      ON d.icd_code = dd.icd_code
     AND d.icd_version = dd.icd_version
    WHERE d.seq_num = 1
)
SELECT
    a.subject_id,
    a.hadm_id,
    p.gender,
    p.anchor_age,
    a.admittime,
    a.dischtime,
    DATE_TRUNC('month', a.admittime) AS admission_month,
    a.admission_type,
    a.admission_location,
    a.discharge_location,
    a.insurance,
    a.language,
    a.marital_status,
    a.race,
    a.hospital_expire_flag,
    EXTRACT(EPOCH FROM (a.dischtime - a.admittime)) / 86400.0 AS hospital_los_days,
    COALESCE(i.icu_stay_count, 0) AS icu_stay_count,
    COALESCE(i.total_icu_los_days, 0) AS total_icu_los_days,
    i.first_careunit,
    pd.icd_code AS principal_icd_code,
    pd.icd_version AS principal_icd_version,
    pd.principal_diagnosis
FROM mimiciv_hosp.admissions a
JOIN mimiciv_hosp.patients p
  ON a.subject_id = p.subject_id
LEFT JOIN icu_summary i
  ON a.subject_id = i.subject_id
 AND a.hadm_id = i.hadm_id
LEFT JOIN principal_diagnosis pd
  ON a.subject_id = pd.subject_id
 AND a.hadm_id = pd.hadm_id
ORDER BY a.admittime;
