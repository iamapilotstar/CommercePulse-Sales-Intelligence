SELECT * FROM Product

-- Converting discount values to number

CREATE VIEW promotion_discount AS
SELECT PromotionID, Promotion_Name, Ad_type, Price_Reduction_Type,
		CASE
			WHEN PromotionID = 'PR001' THEN 20
			WHEN PromotionID = 'PR002' THEN 10
			WHEN PromotionID = 'PR003' THEN 50
			WHEN PromotionID = 'PR004' THEN 50
			ELSE 70
		END AS Discount_Percentage
FROM Promotion

-- Merging Price per unit from Product Table to Fact using LEFT JOIN

CREATE VIEW Price_Per_Unit AS
SELECT f.*,p.Product_Name, p.Product_Line, p.Price_INR AS Price_Per_Units
FROM Fact_Table f
LEFT JOIN Product p ON f.Product_ID = p.ProductID;


-- -- Merging Discount Percentage from Product Table to Fact using LEFT JOIN

CREATE VIEW Discount_Percent AS
SELECT pp.*,COALESCE(pd.Promotion_Name,'No Promotion Code') AS Promotion_Name, COALESCE(pd.Discount_Percentage, 0) AS Discount_Percentages FROM Price_Per_Unit pp
LEFT JOIN promotion_discount pd ON pp.PromotionID = pd.PromotionID


-- Creating Total Sales column using units_sold and Price Per unit Formula
CREATE VIEW Sales_Total AS
SELECT *, Units_sold * Price_per_units AS Total_Sale FROM Discount_Percent

-- Creating Discount Value Column

CREATE VIEW Discount_value AS
SELECT *, (Total_Sale * Discount_Percentages) / 100.0 AS Discount_Values FROM Sales_Total



-- Net Sales
CREATE VIEW Net_Sales AS
Select *, Total_Sale - Discount_values AS Net_Sale FROM Discount_value


CREATE VIEW Final_View AS
SELECT Date_dd_mm_yyyy, CustomerID, PromotionID, Product_ID, Units_Sold, Price_Per_Units,Promotion_Name, Product_Name, Product_Line, Discount_Percentages, Total_Sale, Discount_Values, 
Net_Sale, 0.1 * Net_Sale AS Estimated_Profit FROM Net_Sales



SELECT * FROM Final_View


