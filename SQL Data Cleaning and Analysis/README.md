# SQL Data Cleaning & Analysis – CommercePulse Sales Intelligence

## Overview
This folder contains the SQL-based data engineering and analysis pipeline used for the CommercePulse project. The goal of this pipeline is to transform raw transactional data into a clean, business-ready dataset and generate all KPIs used in the Power BI dashboard.


## Files in this Folder

### 1. Data Cleaning and Engineering.sql
This file performs all data preparation and feature engineering steps.

Key operations:
  - Standardizing discount percentages using CASE logic
  - Handling missing discounts using COALESCE
  - Enriching fact data using LEFT JOINs with dimension tables
    
  
Creating derived metrics:
  - Total Sale
  - Discount Value
  - Net Sale
  - Estimated Profit
  - Producing a final analytical table: `Final_View`

This file ensures the dataset is consistent, complete and ready for business analysis.

---


### 2. Data Analysis.sql
This file contains all business-focused analytical queries used to generate KPIs and insights.

It includes:
- Total Sales
- Total Discount
- Net Sales
- Estimated Profit
- Profit Margin %
- Average Order Value (AOV)
- Top and Bottom products by revenue
- Top products by quantity
- Promotion impact analysis
- Yearly sales trends

These queries replicate the logic used in Power BI visuals.

---

Why i created this SQL Pipeline?

This SQL pipeline was created to:
- Ensure reproducibility of results
- Validate Power BI metrics
- Demonstrate data engineering fundamentals
- Maintain traceability of business logic
- Enable platform-independent analysis

---

How This Connects to Power BI

The final SQL output (`Final_View`) acts as the analytical foundation for the Power BI dashboard. All KPIs and visuals are based on the same business logic implemented in the Power Query Editor, ensuring consistency between backend transformations and frontend reporting.
