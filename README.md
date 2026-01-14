# CommercePulse-Sales-Intelligence
An end-to-end retail sales intelligence project built using SQL, Power Query, and Power BI. This dashboard transforms fragmented transactional data into actionable insights for inventory optimization, campaign ROI analysis, and executive decision-making.
---

💡 The Problem

Retail businesses often operate with fragmented sales data spread across products, cities, promotions, and time periods. This lack of a centralized analytical view creates blind spots in understanding performance trends, leads to inefficient inventory planning, and makes it difficult to accurately evaluate promotional ROI.

As a result, decision-makers are forced to rely on static reports or delayed insights, slowing down strategic actions and increasing operational risk. This problem becomes even more critical at scale, where thousands of transactions and multiple campaigns are involved.
---

🔧 The Solution

I designed and built an interactive Power BI dashboard that transforms raw, fragmented retail sales data into a unified decision-making command center.

The solution analyzes ₹129M (£1.23M) in sales across 3,510 orders, providing dynamic insights into:

• Product performance
• Promotional effectiveness
• Temporal sales trends
• Profitability and order behavior

Using SQL for data extraction, Power Query for transformation, and a star-schema data model, the dashboard enables fast, cross-dimensional slicing by product, city, promotion, and time. KPIs are powered by DAX measures and updated dynamically through filters and drilldowns 

🛠️ Tools & Technologies

• MS SQL Server – Data extraction and querying
• Power Query – ETL, data cleaning, transformation
• Power BI – Dashboarding, DAX measures, visual analytics

🧪 Technical Approach
Data Engineering & Modeling

• Built a centralized fact table with one-to-many relationships to dimension tables (Product, Customer, Promotion, Calendar) using a star schema.
• Implemented transaction-level validation tables to reconcile raw records with aggregated KPIs, ensuring trust in reported metrics.
• Standardized formats, handled missing values, and derived calculated fields using Power Query 

Data Cleaning & Feature Engineering (Power Query)

Raw transactional sales data often contains missing values, inconsistent pricing, and incomplete promotion logic. To ensure analytical accuracy and business trust, I implemented a structured data cleaning and feature engineering pipeline inside Power Query.

1. Discount Percentage Mapping

The dataset did not contain an explicit discount percentage column. Instead, discounts were inferred using Promotion IDs.

I created a conditional logic mapping:

• If Promotion ID = PR001 → 20% discount
• If Promotion ID = PR002 (Buy 1 Get 1) → 50% discount
• If Promotion ID = NULL → 0% discount

This ensured that all discount logic was standardized and analytically usable.

2. Price Per Unit Imputation

The fact table contained missing values for Price Per Unit.

To resolve this:

• I performed a Left Outer Join with the Product Dimension table
• Pulled the correct price_per_unit from the product master
• Retained only the required pricing field

This guaranteed pricing consistency across all transactions.

3. Derived Business Metrics

Several core KPIs did not exist in raw form and were engineered manually:

• Total Sales = Units Sold × Price per Unit
• Discount Value = Total Sales × Discount % / 100
• Net Sales = Total Sales − Discount Value
• Estimated Profit = 10% × Net Sales

These derived columns enabled deeper business-level analysis rather than surface-level reporting.

4. Missing Value Handling

• Null discount values were replaced with 0 (indicating no promotion)
• Ensured no nulls remained in pricing or revenue-impacting fields
• Removed invalid or incomplete rows where necessary

This step ensured mathematical stability and prevented visual or KPI distortions.

5. Analytical Integrity

Every transformation was designed to preserve financial accuracy and business logic. This ensured that:

• KPI totals matched transaction-level sums
• Revenue and profit calculations were fully traceable
• Aggregated metrics could be trusted by stakeholders

This step is critical in enterprise BI systems, where incorrect numbers destroy credibility.

Findings:

• Top & Bottom 5 Products: Ranked by both revenue and quantity to guide inventory prioritization.
• Campaign Comparison: Built side-by-side analysis of promotional effectiveness (Summer Sale ₹4.26M vs Weekend Flash ₹1.87M).
• KPI Dashboard: Total Sales, Orders, Profit Margin (9.45%), AOV (₹36.9K).
• Time-Series Analysis: Year-over-year trends from 2020–2023, with 2023 peaking at ₹32.3M.
• Category-level breakdowns for profitability and discount efficiency.

📘 Technical Report

This repository contains the interactive Power BI dashboard and detailed documentation explaining:

• Data model architecture
• KPI calculations
• Feature engineering logic
• Visual design choices
• Validation methodology

🖥️ Desktop: Sidebar
📱 Mobile: Top of page

🎯 Value Delivered

• Consolidated ₹129M in sales data into a single unified dashboard, eliminating the need to manually combine reports and enabling instant cross-functional analysis.

• Identified revenue leaders like Apple iPhone 14 (₹21M) and volume champions (281 units), helping inventory teams prioritize high-impact SKUs.

Revealed dramatic ROI differences between promotions:
• Summer Sale: ₹4.26M
• Weekend Flash: ₹1.87M
• Clearance Sale: ₹1.05M

• This allows marketing teams to double down on high-performing strategies.
• Live KPI monitoring replaced static monthly reports with dynamic insights, accelerating decision cycles from weeks to minutes.
