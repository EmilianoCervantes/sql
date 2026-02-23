-- -- -- -- -- -- -- -- -- --
-- -- WRITE READABLE SQL! ---
-- -- -- -- -- -- -- -- -- --

/**
 * SQL READABILITY - Writing Code That Humans Can Understand!
 * 
 * Created by: Oscar
 * Creation date: Feb/23/2026
 * Description: Learn how to write clean, readable SQL queries
 * 
 * Why readability matters:
 * - Your future self will thank you
 * - Teammates can understand your code
 * - Easier to debug and maintain
 * - Professional best practice
 */

-- ❌ BAD: Hard to read, everything crammed on one line
SELECT FirstName, LastName, Email FROM Customer;

-- ✅ GOOD: Each clause on its own line - much clearer!
SELECT FirstName, LastName, Email
FROM Customer;

/**
 * 📚 THE 7 GOLDEN RULES OF READABLE SQL
 * 
 * Think of SQL like writing a book - you want it to be easy to read!
 * 
 * 1️⃣ Separate major clauses - Each SQL keyword gets its own line
 * 2️⃣ Write meaningful aliases - Use descriptive names, not just a, b, c
 * 3️⃣ Always alias calculated columns - Give computed fields clear names
 * 4️⃣ Align conditions clearly - Line up your WHERE conditions
 * 5️⃣ Indent subqueries - Show hierarchy with indentation
 * 6️⃣ Separate logical conditions - Use line breaks for complex logic
 * 7️⃣ Avoid deeply nested logic - Keep it simple and readable
 */

-- 🚀 LEVEL UP: Adding aliases for better column names
-- Notice we're fixing a typo in the second alias!
SELECT
    FirstName AS [Customer First Name],  -- ❌ Avoid square brackets unless you're SQL Server-only, not standard SQL.
    LastName AS "Customer Last Name",    -- Only use "" when spaces are required.
    Email AS 'Customer Email',           -- ❌ Incorrect / Misleading. '' are for strings, NOT identifiers.
    PostalCode AS ZIP
FROM Customer;

-- 🎯 PRO LEVEL: Adding ORDER BY with proper formatting
-- Now we're sorting customers by last name alphabetically
SELECT
    FirstName AS "Customer First Name",
    LastName AS "Customer Last Name",
    Email AS "Customer Email",
    PostalCode AS ZIP
FROM Customer
ORDER BY
    FirstName DESC,
    LastName ASC  -- ASC = Ascending (A to Z), DESC = Descending (Z to A)
LIMIT 10;
