-- My first query. Btw, this is a comment.

-- Comments start with -- (single line) or /* */ (multi-line)
-- They help explain what your code does but are ignored by the database.

/**
 * YOUR FIRST SQL QUERY - Let's break it down piece by piece!
 * 
 * Think of SQL like asking a librarian for books from a specific shelf.
 * 
 * SELECT * FROM Artist;
 * 
 * 1. SELECT - This is like saying "I want to see..." or "Show me..."
 *    It's the command that tells the database you want to retrieve data.
 * 
 * 2. * (asterisk) - This is a wildcard that means "EVERYTHING"
 *    Instead of listing specific columns, the * says "give me all columns"
 *    Think of it as "give me all the information about each item"
 * 
 * 3. FROM - This tells the database WHERE to look for the data
 *    It's like pointing to a specific shelf in the library
 * 
 * 4. Artist - This is the name of our table (like a shelf labeled "Artist")
 *    Tables store related data, just like folders store related documents
 * 
 * The semicolon (;) at the end is like a period - it tells the database 
 * "this is the end of my command"
 */
SELECT * FROM Artist;

/**
 * LIMITING RESULTS - Getting just a taste!
 * 
 * Sometimes tables have THOUSANDS of rows. That's overwhelming!
 * LIMIT tells the database "only show me this many rows"
 * 
 * This is perfect for:
 * - Testing your query (faster than loading everything)
 * - Getting a sample of the data
 * - Seeing the structure without being overwhelmed
 * 
 * SELECT * FROM Artist LIMIT 10;
 * 
 * Translation: "Show me everything from the Artist table, but only the first 10 rows"
 */
SELECT * FROM Artist LIMIT 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- NOTE: we ALWAYS want to avoid "SELECT *". --

-- 1. Prevents breaking changes.
-- 2. Improves performance.
-- 3. Reduces network load.
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
