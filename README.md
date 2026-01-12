
# HI 5304 — Health Informatics Data Analytics

**GitHub Codespaces + PostgreSQL + Python**

Welcome to **HI 5304**. In this course, you will work with real-world–style health data using **SQL, Python, and Jupyter notebooks** inside **GitHub Codespaces**.

This repository provides a **preconfigured environment** so you can focus on learning data analytics concepts rather than software installation.

---

## 🚀 Getting Started

### 1. Open the Repository in Codespaces

* Click **Code → Codespaces → Create codespace**
* Wait for the environment to fully load
  (this may take a few minutes the first time)

Once ready, you will have:

* A Linux-based development environment
* PostgreSQL running in the background
* Python and Jupyter configured for analytics

---

## 🗄️ Database Overview

This course uses a **PostgreSQL database** running inside the Codespace.

### Database Connection Details

(**For coursework only — do not reuse passwords in real systems**)

* **Host:** `db`
* **Port:** `5432`
* **Database:** `hi5304`
* **Username:** `hi5304_user`
* **Password:** `hi5304`

> ⚠️ These credentials are intentionally simple for instructional purposes.
> In real-world systems, credentials are managed using environment variables or secure secrets.

---

## 🔑 Connecting to PostgreSQL from the Terminal

To open a PostgreSQL session in the terminal:

```bash
psql -h db -U hi5304_user -d hi5304
```

When prompted for the password, enter:

```text
hi5304
```

### Useful `psql` Commands

| Command                     | Description         |
| --------------------------- | ------------------- |
| `\dt`                       | List all tables     |
| `\d table_name`             | Describe a table    |
| `SELECT * FROM table_name;` | View table contents |
| `\q`                        | Exit `psql`         |

---

## 🧱 Creating Tables (SQL Pattern)

You will frequently create tables from CSV files.
Below is the **standard pattern** used throughout the course.

### Example: Creating a Table

```sql
DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
  patient_id     INTEGER PRIMARY KEY,
  first_name     TEXT,
  last_name      TEXT,
  date_of_birth  DATE,
  sex            TEXT,
  race           TEXT,
  ethnicity      TEXT,
  zip_code       TEXT
);
```

Run SQL like this **from the terminal** using `psql`:

```bash
psql -h db -U hi5304_user -d hi5304 -c "
DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
  patient_id     INTEGER PRIMARY KEY,
  first_name     TEXT,
  last_name      TEXT,
  date_of_birth  DATE,
  sex            TEXT,
  race           TEXT,
  ethnicity      TEXT,
  zip_code       TEXT
);
"
```

---

## 📥 Loading CSV Files into PostgreSQL

CSV files for this course are stored in the `data/` folder.

### Correct Method: `\copy`

Always use **`\copy`**, not `COPY`, in Codespaces.

Example:

```bash
psql -h db -U hi5304_user -d hi5304 -c "\
\copy patients FROM 'data/patients.csv' WITH (FORMAT csv, HEADER true);
"
```

You should see output like:

```text
COPY 5
```

---

## 🔍 Verifying Data in the Terminal

```bash
psql -h db -U hi5304_user -d hi5304 -c "SELECT COUNT(*) FROM patients;"
```

```bash
psql -h db -U hi5304_user -d hi5304 -c "SELECT * FROM patients LIMIT 10;"
```

---

## 📓 Working with Data in Jupyter Notebooks

### Select the Correct Kernel

In every notebook, select:

**✅ Python (HI5304) or Python 3.12.12** 

Do **not** use the generic Python kernel.

---

### Connecting to PostgreSQL from Python

```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine(
    "postgresql+psycopg2://hi5304_user:hi5304@db:5432/hi5304"
)
```

### Example Query in Jupyter

```python
df = pd.read_sql(
    "SELECT * FROM patients;",
    engine
)

df.head()
```

---

## 🧠 Key Learning Concepts Reinforced in This Course

* Relational data modeling
* SQL table creation and constraints
* Loading and validating clinical data
* SQL ↔ Python integration
* Reproducible analytics workflows

---

## ❓ Common Issues & Tips

* **“command not found”** → You are in the shell, not `psql`
* **CSV load errors** → Check column types carefully
* **Kernel issues** → Always select **Python (HI5304)**

---

## 📌 Final Note

This repository is designed to support your learning in **health informatics data analytics**.
If something breaks, that’s often part of the learning process — focus on understanding *why*.

Welcome to HI 5304.

