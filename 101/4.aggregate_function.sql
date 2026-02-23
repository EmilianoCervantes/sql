-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 1 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Count how many customers' last name start with "B".
 */
SELECT
    COUNT(*) AS "Customers last names starting with B or D"
FROM Customer c
WHERE c.LastName LIKE 'B%' OR c.LastName LIKE 'D%';
-- EXPLANATION:
/*
 * COUNT(*) is an aggregate function that counts ALL rows
 * LIKE is used for pattern matching with wildcards:
 * - 'B%' = starts with "B" (B followed by anything)
 * - '%B' = ends with "B"
 * - '%B%' = contains "B" anywhere
 */

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 2 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Count how many customers purchased 2 songs at $0.99 each.
 */
SELECT COUNT(*)
FROM Invoice i
WHERE i.Total = 1.98;

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 3 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Count the amount of invoices between $1.98 and $5.
 */
SELECT COUNT(*)
FROM Invoice
-- WHERE 1.98<= TOTAL AND Total <= 5;
WHERE
 TOTAL BETWEEN 1.98 AND 5;

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 4 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Amount of invoices exactly $1.98 or $3.96.
 */
SELECT COUNT(*)
FROM Invoice
WHERE
 TOTAL IN(1.98, 3.96);

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 5 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Amount of invoices billed to the city of Brussels.
 */
SELECT COUNT(*)
FROM Invoice
-- WHERE BillingCity = 'Brussels';
WHERE
 BillingCity IN('Brussels', 'Orlando', 'Paris');

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 5 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Amount of invoices billed to any city with b or B in their names.
 */
SELECT COUNT(*)
FROM Invoice
WHERE
 BillingCity LIKE '%B%'; -- you'll notice this is CASE INSENSITIVE!

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 6 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: All invoices billed to any city with d or p in their names and greater than 1.98.
 */
SELECT COUNT(*)
FROM Invoice
WHERE
 TOTAL > 1.98
 AND (
    BillingCity LIKE "D%"
    OR BillingCity LIKE "p%"
 );

-- -- -- -- -- -- -- -- -- --
-- -- -- Sneak peek -- -- ---
-- -- -- -- -- -- -- -- -- --
-- Count each monetary range case.
-- Use of 'COUNT', 'SUM', 'AVG'
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
