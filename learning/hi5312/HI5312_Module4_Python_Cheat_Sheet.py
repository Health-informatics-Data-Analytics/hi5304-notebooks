# HI 5312 Module 4 – Python and pandas Cheat Sheet

# Confirm Python version
import sys
print(sys.version)

# Import libraries
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine, inspect, text

# Connect to PostgreSQL
engine = create_engine(
    "postgresql+psycopg2://hi5304_user:hi5304@db:5432/hi5304"
)

# List tables
inspector = inspect(engine)
print(inspector.get_table_names(schema="public"))

# Load SQL into pandas
df = pd.read_sql("SELECT * FROM public.cardio;", engine)

# Inspect data
df.head()
df.tail()
df.shape
df.columns.tolist()
df.info()
df.dtypes
df.describe(include="all").transpose()

# Preserve raw data
raw_df = df.copy()

# Select and filter
df["column"]
df[["column_a", "column_b"]]
df[df["numeric_column"] >= 100]
df[(df["a"] >= 100) & (df["b"] == 1)]
df.sort_values("numeric_column", ascending=False)

# Missing values
df.isna().sum()
df.isna().mean() * 100

# Duplicates
df.duplicated().sum()
df.duplicated(subset=["patient_id"]).sum()
df = df.drop_duplicates().copy()

# Categories and unique values
df["category"].value_counts(dropna=False)
df.nunique(dropna=True)

# Convert types
df["number"] = pd.to_numeric(df["number"], errors="coerce")
df["date"] = pd.to_datetime(df["date"], errors="coerce")

# Clean text
df["category"] = df["category"].str.strip()

# Derived variable
df["bmi"] = df["weight_kg"] / (df["height_cm"] / 100) ** 2

# Grouped summary
summary = (
    df.groupby("group", dropna=False)["value"]
      .agg(["count", "mean", "median", "min", "max"])
      .reset_index()
)

# Cross-tabulation
pd.crosstab(df["row_category"], df["column_category"], margins=True)

# Histogram
plt.figure(figsize=(8, 5))
plt.hist(df["value"].dropna(), bins=20, edgecolor="black")
plt.title("Distribution of value")
plt.xlabel("Value")
plt.ylabel("Number of records")
plt.tight_layout()
plt.show()

# Bar chart
df["category"].value_counts().plot(kind="bar")
plt.tight_layout()
plt.show()

# Scatterplot
plt.figure(figsize=(8, 5))
plt.scatter(df["x"], df["y"], alpha=0.5)
plt.xlabel("x")
plt.ylabel("y")
plt.tight_layout()
plt.show()

# Export
df.to_csv("module4_analysis_ready.csv", index=False)
