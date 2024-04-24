// Create storage integration object
  create or replace storage integration s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::211125539425:role/aws_s3_snowflake_intg'
  STORAGE_ALLOWED_LOCATIONS = ('s3://awss3rahul/csv/', 's3://awss3rahul/json/')
  COMMENT = 'Integration with aws s3 buckets' ;

// Get external_id and update it in S3
   DESC integration s3_int;

// Create Database
	CREATE DATABASE IF NOT EXISTS MYDB;
	CREATE SCHEMA IF NOT EXISTS MYDB.file_formats;

// Create file format object
    CREATE OR REPLACE file format mydb.file_formats.csv_fileformat
    type = csv
    field_delimiter = '|'
    skip_header = 1
    empty_field_as_null = TRUE;

    

// Create stage object with integration object & file format object
    CREATE OR REPLACE STAGE mydb.external_stages.aws_s3_csv
    URL = 's3://awss3rahul/csv/'
    STORAGE_INTEGRATION = s3_int
    FILE_FORMAT = mydb.file_formats.csv_fileformat ;

//Listing files under your s3 buckets
    list @mydb.external_stages.aws_s3_csv;



// Create a table first
	CREATE OR REPLACE TABLE mydb.public.mrf_data (
	UnitID NUMBER,
	UnitCity STRING,
	TotalUnitCity NUMBER,
	ProductName STRING,
	ProductPrice NUMBER,
	Quantity NUMBER,
	TotalSales NUMBER
	);  


// Use Copy command to load the files
	COPY INTO mydb.public.mrf_sales
	FROM @mydb.external_stages.aws_s3_csv
	PATTERN = '.*mrf_sales.*',
	file_format = (type = csv  field_delimiter = ','  skip_header=1);

//Validate the data
	SELECT * FROM mydb.public.mrf_sales;