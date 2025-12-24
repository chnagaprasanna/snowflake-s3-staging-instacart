-- Create stage for S3 bucket
create or replace stage my_stage
url = 's3://snowflake-db-np/instacart/'
credentials = (aws_key_id='XXXXXXXXXXXXXXX' aws_secret_key='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

-- List files in stage
LIST @my_stage;

-- Create CSV file format
create or replace file format csv_file_format
type = 'csv'
field_delimiter = ','
skip_header = 1
field_optionally_enclosed_by = '"';
