SELECT *
FROM
 company_dim
WHERE
name IN('facebook','Meta');


SELECT *
FROM  information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT *
FROM  information_schema.columns
WHERE table_catalog = 'data_jobs';


SELECT * table_name, column_name, data_type
FROM  information_schema.columns
WHERE table_catalog = 'data_jobs';


-- it shows related meta data that we have connected from the data jobs
PRAGMA show_tables;   --also use to show the the meta data as information schema

PRAGMA show_tables_expanded; --it shows extra data regarding the tables


-- yeh tables ke information janne ke liye jarori hota hai
DESCRIBE job_postings_fact;
