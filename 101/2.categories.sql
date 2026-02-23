/**
 * SQL LANGUAGE CATEGORIES - The 5 Main Types!
 * 
 * Think of SQL like having different tools in a toolbox:
 * Each tool has a specific job to do!
 */

/**
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * 1) DQL (Data Query Language) - The "Reader" Tool
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * Purpose: ASK for and READ data from the database
 * Analogy: Like reading a book - you don't change anything, just look
 */

SELECT * FROM Album;
-- Translation: "Show me everything from the Album table"

/**
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * 2) DML (Data Manipulation Language) - The "Editor" Tools
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * Purpose: CHANGE the actual data inside tables
 * Analogy: Like editing a document - adding, fixing, or removing content
 */

/**
 * INSERT - The "Add New" Tool
 * Purpose: Add NEW rows of data to a table
 * Analogy: Like adding new entries to a contact list
 * 
 * INSERT INTO Genre (Name) VALUES ('Rock'), ('Jazz'), ('Metal');
 * Translation: "Add three new music genres: Rock, Jazz, and Metal"
 */
INSERT INTO Genre (Name) VALUES ('Rock'), ('Jazz'), ('Metal');

/**
 * UPDATE - The "Fix/Change" Tool
 * Purpose: Change EXISTING data in a table
 * Analogy: Like updating someone's phone number in your contacts
 * 
 * UPDATE Customer SET NAME = 'John' WHERE Id = 1;
 * Translation: "Change the name to 'John' for the customer with ID 1"
 * 
 * WHERE is CRITICAL - it specifies WHICH row to change!
 * Without WHERE, you'd change ALL customers to 'John'! 😱
 */
UPDATE Customer SET NAME = 'John' WHERE Id = 1;

/**
 * DELETE - The "Remove" Tool
 * Purpose: Remove rows from a table
 * Analogy: Like deleting contacts from your phone
 * 
 * DELETE FROM Employee WHERE EmployeeId < 10;
 * Translation: "Delete all employees whose ID is less than 10"
 * 
 * ⚠️  WARNING: WHERE clause is your safety net!
 * Without WHERE, you delete ALL employees! Be careful!
 */
DELETE FROM Employee WHERE EmployeeId < 10;

/**
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * 3) DDL (Data Definition Language) - The "Architect" Tools
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * Purpose: CHANGE the STRUCTURE of the database itself
 * Analogy: Like building/removing rooms in a house - changes the blueprint
 */

/**
 * CREATE - The "Build" Tool
 * Purpose: Create NEW tables, indexes, or other database objects
 * Analogy: Like building a new filing cabinet from scratch
 * 
 * CREATE TABLE Playlist (
 *   PlaylistId INT PRIMARY KEY,  -- Unique ID for each playlist
 *   Name NVARCHAR(120)          -- Playlist name (up to 120 characters)
 * );
 * Translation: "Build a new Playlist table with an ID and Name column"
 */
CREATE TABLE Playlist (
  PlaylistId INT PRIMARY KEY,
  Name NVARCHAR(120)
);

/**
 * ALTER - The "Remodel" Tool
 * Purpose: Change the STRUCTURE of an existing table
 * Analogy: Like adding a new drawer to an existing filing cabinet
 * 
 * ALTER TABLE Playlist ADD IsPublic BOOLEAN NOT NULL DEFAULT 0;
 * Translation: "Add a new column called IsPublic to the Playlist table"
 * - BOOLEAN: true/false values
 * - NOT NULL: must have a value (can't be empty)
 * - DEFAULT 0: if not specified, default to false (0)
 */
ALTER TABLE Playlist ADD IsPublic BOOLEAN NOT NULL DEFAULT 0;

/**
 * DROP - The "Demolish" Tool
 * Purpose: Completely DELETE a table or other database object
 * Analogy: Like throwing away an entire filing cabinet
 * 
 * ⚠️  EXTREME WARNING: This is PERMANENT!
 * DROP TABLE PlaylistTrack;
 * Translation: "Delete the entire PlaylistTrack table and ALL its data"
 * 
 * There's no "undo" button for DROP! Use with extreme caution!
 */
DROP TABLE PlaylistTrack;

/**
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * 4) DCL (Data Control Language) - The "Security" Tools
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * Purpose: Control WHO can do WHAT with the data
 * Analogy: Like giving out different keys to different people
 */

/**
 * GRANT - The "Give Permission" Tool
 * Purpose: Give specific users permission to perform actions
 * Analogy: Like giving someone a key that only opens specific doors
 * 
 * GRANT SELECT ON Customer to SomeEmployee;
 * Translation: "Allow SomeEmployee to read (but not change) the Customer table"
 */
GRANT SELECT ON Customer to SomeEmployee;

/**
 * REVOKE - The "Take Away Permission" Tool
 * Purpose: Remove permissions that were previously granted
 * Analogy: Like taking back a key you gave someone
 * 
 * REVOKE SELECT ON Customer to SomeEmployee;
 * Translation: "Remove SomeEmployee's permission to read the Customer table"
 */
REVOKE SELECT ON Customer to SomeEmployee;

/**
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * 5) TCL (Transaction Control Language) - The "Safety Net" Tools
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
 * Purpose: Group multiple changes together or undo mistakes
 * Analogy: Like having an "undo" button and "save" button for your work
 */

/**
 * BEGIN TRANSACTION - The "Start Recording" Tool
 * Purpose: Start a group of related changes
 * Analogy: Like pressing "record" on a video camera - everything gets captured
 * 
 * BEGIN TRANSACTION;
 * Translation: "I'm about to make several changes - treat them as one group"
 */
BEGIN TRANSACTION;

/**
 * COMMIT - The "Save Permanently" Tool
 * Purpose: Make all changes in the current transaction permanent
 * Analogy: Like clicking "Save" - everything becomes permanent
 * 
 * COMMIT;
 * Translation: "All the changes I made are good - save them permanently"
 */
COMMIT;

/**
 * ROLLBACK - The "Emergency Undo" Tool
 * Purpose: Undo all changes in the current transaction
 * Analogy: Like hitting "Ctrl+Z" - everything goes back to how it was
 * 
 * ROLLBACK;
 * Translation: "Oops! Something went wrong - undo all my recent changes"
 * 
 * This is your safety net when mistakes happen!
 */
ROLLBACK;
