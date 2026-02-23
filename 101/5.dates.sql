-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 1 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: How many invoices were billed on May 22, 2010?
 */
-- Version1
SELECT COUNT(*)
FROM Invoice
WHERE
 InvoiceDate LIKE '2010-05-22%';
-- Version2
-- Using Date() function.
SELECT COUNT(*)
FROM Invoice
WHERE
 Date(InvoiceDate) = '2010-05-22';

-- -- -- -- -- -- -- -- -- --
-- -- -- EXERCISE 2 -- -- ---
-- -- -- -- -- -- -- -- -- --
/**
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: How many invoices were billed from May 2nd to May 21st 2010, and have a total of less than $3?
 */
SELECT COUNT(*)
FROM Invoice
WHERE Date(InvoiceDate)
 Between Date('2010-05-02') AND Date('2010-05-21')
 AND Total <= 3;
