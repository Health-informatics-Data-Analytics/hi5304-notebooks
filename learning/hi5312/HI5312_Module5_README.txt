HI 5312 - Module 5: Data Visualization and Visual Analytics with Tableau
==========================================================================

FILES
-----
1. HI5312_Module5_Data_Visualization_and_Tableau.ipynb
2. HI5312_Module5_Tableau_Export.sql
3. HI5312_Module5_Python_Visualization_Cheat_Sheet.py
4. HI5312_Module5_Tableau_Cheat_Sheet.pdf

ENVIRONMENT
-----------
Use the Python 3.12.12 kernel in Codespaces.

PostgreSQL connection:
Host: db
Port: 5432
Database: hi5304
Username: hi5304_user
Password: hi5304

The notebook uses existing MIMIC-IV demo tables:
- mimiciv_hosp.patients
- mimiciv_hosp.admissions
- mimiciv_icu.icustays
- mimiciv_hosp.diagnoses_icd
- mimiciv_hosp.d_icd_diagnoses

WORKFLOW
--------
1. Open the notebook in Codespaces.
2. Select the Python 3.12.12 kernel.
3. Run the connection and schema-verification cells.
4. Run the admission-level extract and validation cells.
5. Run the CSV export cells.
6. Download the aggregated CSV from module5_outputs.
7. Open Tableau and connect to the CSV.
8. Complete the worksheet and dashboard laboratories.

TABLEAU PUBLIC CAUTION
----------------------
Tableau Public publishes workbooks and data to the internet. Do not publish
row-level healthcare data. Use the aggregated extract and follow course policy.
Tableau Desktop can be used for local row-level work.

WHY THE CSV IS CREATED BY THE NOTEBOOK
--------------------------------------
The package does not include fabricated patient data. The notebook generates
its practice files directly from the MIMIC-IV demo database already loaded in
the course Codespace, ensuring the examples reflect data that actually exist.
