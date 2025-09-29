# 📦 Olist E-Commerce Data Warehouse

## Project Overview

This project implements a robust, end-to-end **Analytics Engineering (AE) pipeline** to transform [raw e-commerce data from Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (a major Brazilian marketplace) into a clean, query-ready **Star Schema** optimized for analytical reporting.

The entire process, from data ingestion to data quality validation, is automated using modern AE tools: **Kaggle** (Source), **Python** (Ingestion), **DuckDB** (Data Warehouse), **dbt** (Transformation), and **GitHub Actions** (Orchestration).

## 🚀 The Analytics Engineering Pipeline (ELT)

The pipeline is structured following the standard ELT (Extract, Load, Transform) methodology:

| **Step** | **Tool** | **Description** |
| ----- | ----- | ----- |
| **Extract & Load** (E&L) | Python / Kaggle | Raw data is fetched from the Kaggle API and loaded directly into the filesystem, ready for DuckDB to query. |
| **Transform** (T) | dbt (DuckDB) | Raw CSV files are transformed into a clean, tested, and optimized Star Schema (Dimensional Modeling). |
| **Orchestration** | GitHub Actions | The entire process is automated to run daily at 6 AM UTC, ensuring the Data Warehouse is always fresh. |
| **Validation** | dbt Tests | Data quality checks (`not_null`, `unique`, `relationships...`) are executed on critical fields after transformation. |

## 🛠️ Technology Stack

* **Source Data:** Olist Public E-Commerce Dataset (Kaggle)

* **Data Warehouse:** **DuckDB** (In-process analytical database)

* **Transformation:** **dbt (data build tool)** (Used for all data modeling and testing)

* **Orchestration:** **GitHub Actions** (Scheduling and deployment)

* **Language:** Python 3.10+, SQL

* **Data Modeling:** Star Schema (`fct_*` and `dim_*` tables. Aggregation tables to facilitate data analytics job)

## 🏗️ Data Model & Structure

The final data warehouse is built in a **Star Schema** suitable for measuring E-commerce performance.

### 1. Staging Layer (`staging/`)

Raw CSV data is loaded via DuckDB's `READ_CSV_AUTO` and given standardized names and types, handling common raw data issues like file reading errors (`ignore_errors=true`).

### 2. Marts Layer (`marts/`)

This layer contains the final, analytics-ready tables:

| **Model** | **Granularity** | **Key Dimensions** | **Key Metrics** |
| ----- | ----- | ----- | ----- |
| `dim_customers` | One row per unique customer. | Location, Customer Unique ID, Coordinates. | N/A |
| `dim_sellers` | One row per unique seller. | Location, Coordinates. | N/A |
| `dim_geolocation` | One row per unique Zip Code Prefix. | Average coordinates per region. | N/A |
| **`fct_order_items`** | **One row per ordered item.** | Customer, Seller, Product, Payment Type, Review Score. | Price, Freight Value, Total Item Value. |

### 3. Reporting Layer (`marts/reporting/`)

(Future layer for aggregating daily or monthly KPIs ready for a BI tool).

## ⚙️ How to Run the Project Locally

To replicate the environment and run the dbt models on your local machine:

### 1. Prerequisites

You need Python 3.10+ and a local installation of the Kaggle CLI.

### 2. Setup

1. Clone the repository
2. Install dependancies (requirements.txt)
3. Run `python ingestion.py`
4. Run `cd brazilian_ecommerce`then `dbt build`