-- KPI Queries

SELECT * FROM Final_View

-- Total Sale

SELECT CAST(ROUND(SUM(Total_Sale),2) AS DECIMAL(12,2)) AS Total_Sales FROM Final_View

-- Total Discount

SELECT CAST(ROUND(SUM(Discount_values),2) AS DECIMAL(12,2)) AS Total_Discount FROM Final_View

-- Estimated Profit

SELECT CAST(ROUND(SUM(Estimated_Profit),2) AS DECIMAL(12,2)) AS Totat_Estimated_Profit FROM Final_View

-- Total Orders COUNT(*)

SELECT COUNT(Product_ID) AS Total_Orders FROM Final_View

-- Estimated Profit Margin

SELECT CAST(ROUND(SUM(Estimated_Profit )/ SUM(Total_Sale) * 100,2) AS DECIMAL(12,2)) AS Estimated_Profit_Margin_Percentage
FROM Final_View

-- Average Order Value

SELECT CAST(ROUND(SUM(Total_Sale)/ COUNT(*),2) AS DECIMAL(12,2)) AS AOV FROM Final_View

-- Top 5 Products by Net Sales

SELECT TOP 5 Product_Name, CAST(ROUND(SUM(Net_Sale),2) AS DECIMAL(12,2)) AS Top_5_products FROM Final_View
GROUP BY Product_Name
ORDER BY SUM(Net_Sale) DESC

-- Top 5 Products by Quantity

SELECT TOP 5 Product_Name, SUM(Units_Sold) AS Quantity, SUM(Net_Sale) AS Net_Sale FROM Final_View
GROUP BY Product_Name
ORDER BY
	SUM(Net_Sale) DESC,
	SUM (Units_Sold) DESC

-- Discount Value by Promotion
SELECT TOP 3 Promotion_Name, CAST(ROUND(SUM(Discount_Values),2) AS DECIMAL(10,2)) AS Total_Discount_Value FROM Final_View
GROUP BY Promotion_Name
ORDER BY SUM(Discount_Values) DESC

-- Bottom 5 Products by Net Sales
SELECT TOP 5 Product_Name, CAST(ROUND(SUM(Net_Sale),2) AS DECIMAL(10,2)) AS Net_Sale FROM Final_View
GROUP BY Product_Name
ORDER BY SUM(Net_Sale) ASC

-- Yearly Net Sales
SELECT TOP 4 YEAR(Date_dd_mm_yyyy) AS Year, CAST(ROUND(SUM(Net_Sale),2) AS DECIMAL(10,2)) AS Yearly_Net_Sales FROM Final_View
GROUP BY YEAR(Date_dd_mm_yyyy)
ORDER BY 
	YEAR(Date_dd_mm_yyyy) ASC


