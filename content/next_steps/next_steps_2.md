+++
title = "Visualise your pipeline data"
weight = 2
post = ""
+++

Assuming you have already set-up your Streamlit project all you have to do is change the schema within the queries used to generate the visualisations.

Open `pageviews.sql` and `sessions.sql`. Change your schema name within the queries.

```sql
SELECT * FROM NEW_SCHEMA_NAME.snowplow_web_page_views

SELECT * FROM NEW_SCHEMA_NAME.snowplow_web_sessions
```

