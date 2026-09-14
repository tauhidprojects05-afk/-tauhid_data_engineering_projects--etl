/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?

- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
- This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
- The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.

*/

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
  COUNT(jpf.*) AS demand_count,
  COUNT(jpf.*) AS corrected_demand_count,
  ROUND(LN(COUNT(jpf.*)),1) AS ln_demand_count,
  ROUND((MEDIAN(jpf.salary_year_avg) *  LN(COUNT(jpf.*)))/1_000_000 , 2) AS optimal_score  --diving to remove the million after the decimal


FROM job_postings_fact AS jpf

INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id=sjd.job_id

INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id

WHERE
  jpf.job_title_short ='Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.salary_year_avg IS NOT NULL

GROUP BY                            
 sd.skills

HAVING 
COUNT(jpf.*) > 100   

ORDER BY
 optimal_score DESC  

LIMIT 25;

--SELECT LN(100)    must put natural log 1 to whatever number but not zero

/*

### 📊 Key Insights — Based on Optimal Score

* **Terraform — 0.97:** Highest optimal score due to its very high salary.
* **Python — 0.95:** Excellent balance of demand and salary.
* **SQL — 0.91:** High demand with strong career value.
* **AWS — 0.91:** Best-performing cloud skill in the dataset.
* **Airflow — 0.89:** Strong value for data pipeline orchestration.
* **Spark — 0.87:** High-value skill for large-scale data processing.
* **Kafka & Snowflake — 0.82:** Strong options for streaming and data warehousing.
* **Azure — 0.79:** Valuable cloud alternative to AWS.
* **Java — 0.77 & Scala — 0.76:** Strong programming skills for data platforms.
* **Kubernetes & Git — 0.75:** Important supporting engineering skills.
* **Overall:** **Terraform, Python, SQL, AWS, Airflow, and Spark** form the highest-scoring skill group.




┌────────────┬───────────────┬──────────────┬────────────────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ corrected_demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │         int64          │     double      │    double     │
├────────────┼───────────────┼──────────────┼────────────────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │                    193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │                   1133 │             7.0 │          0.95 │
│ sql        │      130000.0 │         1128 │                   1128 │             7.0 │          0.91 │
│ aws        │      137320.0 │          783 │                    783 │             6.7 │          0.91 │
│ airflow    │      150000.0 │          386 │                    386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │                    503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │                    292 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │          438 │                    438 │             6.1 │          0.82 │
│ azure      │      128000.0 │          475 │                    475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │                    303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │                    247 │             5.5 │          0.76 │
│ kubernetes │      150500.0 │          147 │                    147 │             5.0 │          0.75 │
│ git        │      140000.0 │          208 │                    208 │             5.3 │          0.75 │
│ databricks │      132750.0 │          266 │                    266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │                    274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │                    196 │             5.3 │          0.72 │
│ nosql      │      134415.0 │          193 │                    193 │             5.3 │          0.71 │
│ hadoop     │      135000.0 │          198 │                    198 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │                    152 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │          136 │                    136 │             4.9 │          0.67 │
│ docker     │      135000.0 │          144 │                    144 │             5.0 │          0.67 │
│ go         │      140000.0 │          113 │                    113 │             4.7 │          0.66 │
│ r          │      134775.0 │          133 │                    133 │             4.9 │          0.66 │
│ bigquery   │      135000.0 │          123 │                    123 │             4.8 │          0.65 │
│ github     │      135000.0 │          127 │                    127 │             4.8 │          0.65 │
└────────────┴───────────────┴──────────────┴────────────────────────┴─────────────────┴───────────────┘
*/