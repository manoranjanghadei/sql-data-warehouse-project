/*
==================================================
Script: Create Database and Schemas (Bronze, Silver, Gold)
==================================================

Purpose:
- Creates a new database 'DataWarehouse'.
- If 'DataWarehouse' already exists, the script drops and recreates it.
- Also creates three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
- This script **deletes all data** if 'DataWarehouse' already exists.
- Use with caution and ensure backups are taken if needed.
- Commonly used in Data Warehouse ETL setups for layer-wise data management.
*/


-- Create Database 'DataWareHouse'

-- Step 1: Switch to the master database (recommended before creating a new database)
USE master;

-- Step 2: Check if 'DataWarehouse' already exists, if yes, drop it
/*
This section checks if 'DataWarehouse' exists in the server.
If it exists, it forces all connections to close using SINGLE_USER mode, then drops the database.
This ensures a clean slate before recreating the database.
*/
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  -- Force disconnect all sessions
    DROP DATABASE DataWarehouse;  -- Permanently delete the database
END
GO

-- Step 3: Create a fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

-- Step 4: Switch to 'DataWarehouse' to work within it
USE DataWarehouse;

-- Step 5: Create necessary schemas for data layers
-- Bronze: Raw/ingested data
CREATE SCHEMA bronze;
GO
-- Silver: Cleaned/transformed data
CREATE SCHEMA silver;
GO
-- Gold: Final/consumable data (for reporting/analytics)
CREATE SCHEMA gold;
GO
