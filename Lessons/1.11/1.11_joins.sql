SELECT
 jpf.*,
 cd.*
FROM
job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
 ON jpf.company_id = cd.company_id  -- on here ensure how does jpf connect to the company id coloumn
 LIMIT 10;




SELECT
  jpf.job_id,
  jpf.job_title_short,
  cd.company_id,
  cd.name AS company_name,
  jpf.job_location
FROM
 job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
 ON jpf.company_id = cd.company_id  
 LIMIT 10;



 SELECT
 COUNT(*)
 FROM job_postings_fact;   --it shows the content that is inside the job posting




SELECT
  jpf.job_id,
  jpf.job_title_short,
  cd.company_id,
  cd.name AS company_name,
  jpf.job_location
FROM
 job_postings_fact AS jpf
RIGHT JOIN company_dim AS cd     -- everthing of right table and matching from left table only
 ON jpf.company_id = cd.company_id;  


SELECT
  jpf.job_id,
  jpf.job_title_short,
  cd.company_id,
  cd.name AS company_name,
  jpf.job_location
FROM
 job_postings_fact AS jpf
INNER JOIN company_dim AS cd  --return only the matching value
 ON jpf.company_id = cd.company_id;  




SELECT
  jpf.job_id,
  jpf.job_title_short,
  cd.company_id,
  cd.name AS company_name,
  jpf.job_location
FROM
 job_postings_fact AS jpf
FULL OUTER JOIN company_dim AS cd  --we  can write full join also   in this everyinthing is return from both the table
 ON jpf.company_id = cd.company_id;  







