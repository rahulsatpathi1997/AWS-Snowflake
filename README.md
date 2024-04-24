# How To Data Loaded AWS-Snowflake
Data Loaded AWS To Snowflake


<h2>Project Objective</h2>
The objective of this project is to develop a streamlined data pipeline that efficiently processes CSV files uploaded to an AWS S3 bucket and loads the data into Snowflake, a cloud-based data warehousing platform. This pipeline aims to automate the ingestion, transformation, and loading processes, ensuring data integrity, scalability, and reliability.


<h3>We will use AWS S3 and IAM service</h3>
<ol>
<li>Create AWS Account</li>
<li>Create S3 Bucket</li>
<li>Create IAM Role</li>
<li>Upload CSV File AWS S3 Bucket</li>
</ol>


<h3>We will create a Warehouse, Database, External Stage, and Worksheet in Snowflake.</h3>
<ol>
<li>Create Worksheet</li>
<li>Create Database</li>
<li>Create External Stage</li>
<li>Create Warehouse</li>
</ol>

<h2>Project Details :</h2>
After loading the data in AWS, we will work on all these points in Snowflake.
<ol>
  <li>How to Create Storage Integration Object in Snowflake</li>
   <li> Get external_id and update it in S3</li>
   <li>Create Database</li>
   <li>How to Create file format object</li>
   <li>Create stage object with integration object & file format object</li>
   <li>Listing files under your s3 buckets</li>
   <li>Use the Copy command to load the files</li>
  <li>Validate the data</li>
</ol>
