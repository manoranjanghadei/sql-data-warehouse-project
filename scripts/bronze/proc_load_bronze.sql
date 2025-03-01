/*
=================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=================================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
        - Truncates the bronze tables before loading data.
        - Uses the `BULK INSERT` command to load data from CSV files into bronze tables.

Parameters:
    None.

    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
=================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY
		PRINT '===========================================================================';
		PRINT 'LOADING Bronze Layer';
		PRINT '===========================================================================';

		PRINT '---------------------------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '---------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		-- Clear existing data from from the crm_cust_info table to prepare for fresh load
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		-- Bulk load data from the source CRM customer data file into bronze.crm_cust_info table
		PRINT '>> Inserting data into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,				-- Skip the header row in the file
			FIELDTERMINATOR = ',',		-- Fields are separated by commas (CSV format)
			TABLOCK						-- Use table-level lock for better bulk load performance
		);
		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

		SET @start_time = GETDATE();
		-- Clear existing data from bronze.crm_prd_info before loading fresh data
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		-- Load data into bronze.crm_prd_info from the source CRM product data file
		PRINT '>> Inserting data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,				-- Skip header row
			FIELDTERMINATOR = ',',		-- CSV file - fields separated by comma
			TABLOCK						-- Improves performance during bulk load
		);
		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

		SET @start_time = GETDATE();
		-- Clear existing data from bronze.crm_sales_details before loading fresh data
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		-- Load data into bronze.crm_sales_details from the source CRM sales details file
		PRINT '>> Inserting data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,				-- Skip header row
			FIELDTERMINATOR = ',',		-- CSV file - fields separated by comma
			TABLOCK						-- Improves performance during bulk load
		);
		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

		PRINT '---------------------------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '---------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		-- Clear existing data from bronze.erp_cust_az12 before loading fresh data
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		-- Load data into bronze.erp_cust_az12 from the source ERP customer file
		PRINT '>> Inserting data into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,				-- Skip header row
			FIELDTERMINATOR = ',',		-- CSV file - fields separated by comma
			TABLOCK						-- Improves performance during bulk load
		);
		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

		SET @start_time = GETDATE();
		-- Clear existing data from bronze.erp_loc_a101 before loading fresh data
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		-- Load data into bronze.erp_loc_a101 from the source ERP location file
		PRINT '>> Inserting data into: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,				-- Skip header row
			FIELDTERMINATOR = ',',		-- CSV file - fields separated by comma
			TABLOCK						-- Improves performance during bulk load
		);

		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

		SET @start_time = GETDATE();
		-- Clear existing data from bronze.erp_px_cat_g1v2 before loading fresh data
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		-- Load data into bronze.erp_px_cat_g1v2 from the source ERP product category file
		PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Projects - SQL Data Warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,				-- Skip header row
			FIELDTERMINATOR = ',',		-- CSV file - fields separated by comma
			TABLOCK						-- Improves performance during bulk load
		);
		SET @end_time = GETDATE();
		PRINT '------------';
		PRINT '>> Load Duartion: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '------------';

	END TRY
	
	BEGIN CATCH
    PRINT '==================================================';
    PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
    PRINT 'Error Message   : ' + ERROR_MESSAGE();
    PRINT 'Error Number    : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT 'Error State     : ' + CAST(ERROR_STATE() AS NVARCHAR);
    PRINT '==================================================';
	END CATCH


END
