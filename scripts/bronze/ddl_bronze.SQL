/*
==================================================
DDL Script: Create Bronze Tables
==================================================

Script Purpose:
    This script creates tables in the 'bronze' schema.
    It drops the existing tables if they already exist.
    Run this script to redefine the DDL structure of 'bronze' tables.
==================================================
*/

-- Create table 'crm_cust_info' in 'bronze' schema using source file: cust_info.csv
-- This table stores raw customer data ingested from the CRM source system

-- Check if the table 'crm_cust_info' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE

);

-- Check if the table 'crm_prd_info' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

-- Create table 'crm_prd_info' in 'bronze' schema using source file: prd_info.csv
-- This table stores raw product data ingested from the CRM source system

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

-- Check if the table 'crm_sales_details' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

-- Create table 'crm_sales_details' in 'bronze' schema using source file: sales_details.csv
-- This table holds raw sales transaction data ingested from the CRM source system

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

-- Check if the table 'erp_loc_a101' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

-- Create table 'erp_loc_a101' in 'bronze' schema
-- Stores location data from ERP system

CREATE TABLE bronze.erp_loc_a101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);

-- Check if the table 'erp_cust_az12' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;

-- Create table 'erp_cust_az12' in 'bronze' schema
-- Stores customer demographic data from ERP system

CREATE TABLE bronze.erp_cust_az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);

-- Check if the table 'erp_px_cat_g1v2' already exists in the 'bronze' schema, and drop it if it does (to allow recreation)
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

-- Create table 'erp_px_cat_g1v2' in 'bronze' schema
-- Stores product category and maintenance data from ERP system

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
