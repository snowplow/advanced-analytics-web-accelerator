+++
title= "Testing the output"
weight = 3
post = ""
+++

Data should now be loaded into your warehouse, next we will check the models output.

#### **Step 1:** Check the output schemas
Head to the SQL editor of your choice (e.g.: Snowflake Web UI) to check the model's output. You should be able to see three new schemas created:
1. [your_custom_schema]_***scratch***: drop and recompute models that aid the incremental run
2. [your_custom_schema]_***derived***: main output models you can use in your downstream models and reporting
3. [your_custom_schema]_***manifest***: tables that help the integrity and core incremental logic of the model

***
#### **Step 2:** Run dbt test

Run our recommended selector specified tests to identify potential issues with the data:

```bash
dbt test --selector snowplow_web_lean_tests
```
***
#### **Step 3:** Explore your data

Take some time to familiarise yourself with the derived tables. You could run a few simple queries such as the ones listed below:

**Find out the number of page reads using `derived.snowplow_web_page_views:`**
 {{% expand SQL_script %}}
```sql

WITH READS AS (

  SELECT

    PAGE_TITLE,
    COUNT(*)

  FROM [YOUR_CUSTOM_SCHEMA]_DERIVED.SNOWPLOW_WEB_PAGE_VIEWS

  WHERE ENGAGED_TIME_IN_S > 60

  AND VERTICAL_PIXELS_SCROLLED > 5000

  GROUP BY 1 ORDER BY 2 DESC

)

SELECT * FROM READS

```
{{% /expand %}}

**Calculate the bounce rate using `derived.snowplow_sessions:`**
 {{% expand SQL_script %}}
```sql

WITH BOUNCE_RATE AS (

  SELECT

    FIRST_PAGE_URLPATH,
    COUNT(DISTINCT DOMAIN_SESSIONID) AS SESSIONS,
    COUNT(DISTINCT CASE WHEN PAGE_VIEWS = 1 THEN DOMAIN_SESSIONID END) / COUNT(DISTINCT DOMAIN_SESSIONID) AS BOUNCE_RATE

  FROM DERIVED.SNOWPLOW_WEB_SESSIONS

  GROUP BY 1
  ORDER BY SESSIONS DESC

)

SELECT * FROM BOUNCE_RATE
```
{{% /expand %}}

**Find out details about the highest engaged user using `derived.snowplow_users:`**
 {{% expand SQL_script %}}
```sql

WITH ENGAGEMENT AS (

  SELECT *

  FROM DERIVED.SNOWPLOW_WEB_USERS

  ORDER BY ENGAGED_TIME_IN_S DESC

  LIMIT 1

)

SELECT * FROM ENGAGEMENT
```
{{% /expand %}}

***

Check out the **database** section of the [`documentation site`](https://snowplow.github.io/dbt-snowplow-web/#!/overview/snowplow_web) for a breakdown of what the output should look like.
