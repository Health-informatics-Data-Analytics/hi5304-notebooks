HI 5312 – Introduction to Data Analysis
Module 4: Cleaning and Exploring Healthcare Data with Python

FILES
-----
HI5312_Module4_Python_Data_Cleaning_and_EDA.ipynb
    Complete student-facing digital textbook and laboratory notebook.

HI5312_Module4_Python_Cheat_Sheet.py
    Compact reference for Python, pandas, PostgreSQL, and matplotlib commands.

ENVIRONMENT
-----------
GitHub Codespaces
Kernel: Python 3.12.12
PostgreSQL host: db
Port: 5432
Database: hi5304
Username: hi5304_user
Password: hi5304

OPENING THE NOTEBOOK
--------------------
1. Upload or copy the notebook into the course repository.
2. Open the notebook in Codespaces.
3. Select the Python 3.12.12 kernel.
4. Run cells from top to bottom.
5. The notebook connects to the PostgreSQL database already running in the Codespace.

REQUIRED PACKAGES
-----------------
pandas
numpy
matplotlib
sqlalchemy
psycopg2-binary

The course Codespace is expected to include these packages. If a package is missing, install it in the terminal with:

python -m pip install pandas numpy matplotlib sqlalchemy psycopg2-binary

DESIGN NOTES
------------
The notebook inspects the database schema before selecting variables. It prefers the cardio table when present and falls back to patients or another available public table. Examples avoid assuming that a column named age exists. The notebook preserves the raw import and performs cleaning on a working copy.

OUTPUT
------
The notebook exports module4_analysis_ready.csv to the current notebook directory.
