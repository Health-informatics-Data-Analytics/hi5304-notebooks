HI 5312 - Module 3: Retrieving Healthcare Data with SQL and PostgreSQL
======================================================================

FILES
-----
1. HI5312_Module3_SQL_and_PostgreSQL.ipynb
   Complete student-facing Jupyter Notebook.

2. HI5312_Module3_SQL_Cheat_Sheet.sql
   Reusable terminal and SQL examples.

DATABASE CONNECTION
-------------------
Host: db
Port: 5432
Database: hi5304
Username: hi5304_user
Password: hi5304

Connect from the Codespaces terminal:

psql -h db -U hi5304_user -d hi5304

Enter this password when prompted:

hi5304

JUPYTER REQUIREMENTS
--------------------
The notebook uses:
- pandas
- SQLAlchemy
- psycopg2-binary

If needed, uncomment the package installation cell in the notebook.

COURSEWORK SECURITY NOTE
------------------------
The database credentials are intentionally simple and are for coursework only.
Real systems should use environment variables, Codespaces secrets, or another
secure credential-management service.

SUGGESTED WORKFLOW
------------------
1. Open the notebook in the course Codespace.
2. Complete the terminal exercises first.
3. Confirm that the database tables are visible.
4. Run the Python connection cells.
5. Complete the guided, practice, and exploration laboratories.
6. Export the final query result for use in Module 4.
