
# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive **data warehousing and analytics solution**, covering everything from **building a modern data warehouse** to **generating actionable business insights**.

Designed as a **portfolio project**, it highlights industry best practices in **data engineering, ETL, data modeling, and analytics**.

---

## 🏗️ Data Architecture

The architecture follows the **Medallion Architecture** using three layers:

- **Bronze Layer:** Raw data ingestion from source systems (ERP and CRM) provided as **CSV files** into **SQL Server Database**.
- **Silver Layer:** Data cleansing, standardization, and transformation to make data analysis-ready.
- **Gold Layer:** Final analytical layer using a **Star Schema** — optimized for reporting and querying.

---

## 📖 Project Overview

This project includes:

✅ **Modern Data Architecture:** Designing and implementing the medallion architecture (Bronze, Silver, Gold).  
✅ **ETL Pipelines:** Extract, Transform, Load processes using SQL scripts.  
✅ **Data Modeling:** Creating **fact and dimension tables** to support analytical queries.  
✅ **Analytics & Reporting:** SQL-based **business reports** and insights generation.

---

## 🎯 Targeted Skills

This repository highlights my capabilities in:

✔️ SQL Development  
✔️ Data Engineering  
✔️ ETL Pipeline Development  
✔️ Data Modeling (Star Schema)  
✔️ Analytical Reporting  

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL Server Express** | Hosting data warehouse |
| **SQL Server Management Studio (SSMS)** | Managing and querying data |
| **DrawIO** | Designing architecture diagrams |
| **Notion** | Tracking project tasks and documentation |
| **GitHub** | Version control & collaboration |

---

## 🚀 Project Requirements

### 📊 Building the Data Warehouse (Data Engineering)
**Objective:**  
Create a **centralized data warehouse** in SQL Server to consolidate sales data and support analytical reporting for better decision-making.

**Specifications:**  
- **Data Sources:** Two source systems (ERP & CRM) delivered as **CSV files**.
- **Data Quality:** Data cleansing and standardization prior to modeling.
- **Data Integration:** Merge both sources into a unified, user-friendly analytical model.
- **Scope:** Focus on latest data only (no historization required).
- **Documentation:** Clear technical documentation for future users and analysts.

---

### 📈 BI, Analytics & Reporting (Data Analysis)
**Objective:**  
Deliver **insightful analytics** to answer key business questions like:

- Who are the top-performing customers?
- What products are driving sales?
- How are sales trending over time?

These insights enable data-driven decisions for business stakeholders.

---

## 📂 Repository Structure

```
data-warehouse-project/
│
├── datasets/                         # Raw data (ERP and CRM CSV files)
│
├── docs/                             # Documentation & Diagrams
│   ├── etl.drawio                    # ETL flow diagram
│   ├── data_architecture.drawio      # Data warehouse architecture
│   ├── data_catalog.md               # Field descriptions & metadata
│   ├── data_flow.drawio               # Data flow diagram
│   ├── data_models.drawio             # Star schema model
│   ├── naming-conventions.md         # Consistent naming rules
│
├── scripts/                          # SQL scripts for all transformations
│   ├── bronze/                       # Data ingestion scripts
│   ├── silver/                       # Data cleansing & transformation
│   ├── gold/                         # Analytical data modeling
│
├── tests/                            # Data quality test scripts
│
├── README.md                         # Project Overview (this file)
├── LICENSE                           # Project License
├── .gitignore                        # Files to be ignored by Git
└── requirements.txt                  # Project dependencies (if any)
```

---

## 🛡️ License

This project is licensed under the **MIT License** — you are free to use, modify, and share this project with proper credit.

---

## 🌟 About Me

👋 Hi there! I’m **Manoranjan Ghadei** from **India** — a passionate **Data Engineering and Analytics Enthusiast** building hands-on projects to sharpen my skills.


