-- this show the paraser error

SELECT*
LIMIT 10
FROM job_postings_fact;

/*find the top 10 companies for posting jobs
they must have  > 3000 postings
*/


SELECT
cd.name AS company_name,
COUNT(jpf.*) AS postings_count
from job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
GROUP BY cd.name;

EXPLAIN ANALYZE  -- explain used for without caution whereas explain analyize is use must in cautious
--jayadh time agar query leta hai run krne me toh hame explain analyze use krna chaihye

SELECT
cd.name AS company_name,
COUNT(jpf.*) AS postings_count
from job_postings_fact AS jpf

LEFT JOIN company_dim AS cd

ON jpf.company_id = cd.company_id

GROUP BY cd.name;