"""HI 5312 Module 5 - Python Visualization Cheat Sheet
Uses the existing MIMIC-IV PostgreSQL data in Codespaces.
"""

import os
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+psycopg2://hi5304_user:hi5304@db:5432/hi5304",
)
engine = create_engine(DATABASE_URL)

# Load a query into pandas
df = pd.read_sql("SELECT * FROM mimiciv_hosp.admissions LIMIT 100;", engine)

# Frequency table
counts = df["admission_type"].value_counts()

# Horizontal bar chart
fig, ax = plt.subplots(figsize=(9, 5))
counts.sort_values().plot(kind="barh", ax=ax)
ax.set_title("Admissions by Type")
ax.set_xlabel("Admissions")
plt.tight_layout()
plt.show()

# Time trend
df["admittime"] = pd.to_datetime(df["admittime"])
monthly = df.groupby(df["admittime"].dt.to_period("M")).size()
fig, ax = plt.subplots(figsize=(10, 5))
monthly.plot(ax=ax, marker="o")
ax.set_title("Admissions Over Time")
ax.set_xlabel("Month")
ax.set_ylabel("Admissions")
plt.tight_layout()
plt.show()

# Histogram
fig, ax = plt.subplots(figsize=(9, 5))
ax.hist(df["hospital_expire_flag"].dropna(), bins=2)
ax.set_title("Hospital Expire Flag")
plt.tight_layout()
plt.show()

# Export to CSV
df.to_csv("tableau_extract.csv", index=False)
