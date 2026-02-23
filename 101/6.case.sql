-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 1 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Make as many spenders as possible between $7 and $15. See by billing city.
 *
 * Sales categories:
 * 1. Baseline - $0.99-$1.99
 * 2. Low - $2-$6.99
 * 3. Target - $7-$15
 * 4. Top - 15 < x
 */
-- Step 1) This WORKS!
SELECT
 CASE
  WHEN Total < 2 THEN 'Baseline'              -- Inside '' as there's no such column Baseline
  WHEN Total BETWEEN 2 AND 6.99 THEN 'Low'    -- Same for the others
  WHEN Total BETWEEN 7 AND 15 THEN 'Target'
  ELSE 'Top'
 END AS PurchaseType -- Try taking this out and you'll see the funny name of the column.
FROM Invoice
ORDER BY BillingCity;

-- Step 2) I'll add other columns, just to see things better
SELECT
 BillingCity,
 Total,
 CASE
  WHEN Total < 2 THEN 'Baseline'
  WHEN Total BETWEEN 2 AND 6.99 THEN 'Low'
  WHEN Total BETWEEN 7 AND 15 THEN 'Target'
  ELSE 'Top'
 END AS PurchaseType
FROM Invoice
ORDER BY BillingCity;

-- Step 3: WHERE to filter
SELECT
 BillingCity,
 Total,
 CASE
  WHEN Total < 2 THEN 'Baseline'
  WHEN Total BETWEEN 2 AND 6.99 THEN 'Low'
  WHEN Total BETWEEN 7 AND 15 THEN 'Target'
  ELSE 'Top'
 END AS PurchaseType
FROM Invoice
WHERE PurchaseType = 'Target'
ORDER BY BillingCity, Total DESC;

-- EXTRA Step:
-- Count each case
-- You need GROUP BY to count by categories
SELECT
    CASE
        WHEN Total < 2 THEN 'Baseline'
        WHEN Total BETWEEN 2 AND 6.99 THEN 'Low'
        WHEN Total BETWEEN 7 AND 15 THEN 'Target'
        ELSE 'Top'
    END AS PurchaseType,
    COUNT(*) AS number_of_invoices,
    COUNT(Total) AS total_records,
    SUM(Total) AS total_revenue,
    -- AVG(Total) AS average_invoice_amount
    ROUND(AVG(Total), 3) AS average_invoice_amount
FROM Invoice
GROUP BY 
    CASE
        WHEN Total < 2 THEN 'Baseline'
        WHEN Total BETWEEN 2 AND 6.99 THEN 'Low'
        WHEN Total BETWEEN 7 AND 15 THEN 'Target'
        ELSE 'Top'
    END
ORDER BY total_revenue DESC;

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 2 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description:
 * Your job is to create a report that categorizes each track based on its price, offering insights into the range of music available for purchase.
 * Write a SQL query that selects track names, composers, and unit prices, and categorizes each track based on its price.
 * New column 'PriceCategory'.
 *
 * Sales categories:
 * 1. Budget - x <= $0.99
 * 2. Regular - $1-$1.49
 * 3. Premium - $1.50-$1.99
 * 4. Exclusive - 1.99 < x
 */
SELECT
 name AS "Track Name",
 Composer,
 UnitPrice AS Price,
 CASE
    WHEN UnitPrice < 1 THEN 'Budget'
    WHEN UnitPrice BETWEEN 1 AND 1.49 THEN 'Regular'
    WHEN UnitPrice BETWEEN 1.50 AND 1.99 THEN 'Premium'
    ELSE 'Exclusive'
 END AS PriceCategory,
FROM Track
ORDER BY UnitPrice;
