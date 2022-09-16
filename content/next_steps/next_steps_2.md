+++
title = "Visualise your pipeline data"
weight = 2
post = ""
+++

{{< tabs groupId="visualise" >}}

{{% tab name="Streamlit Dashboard" %}}

Assuming you have already set-up your Streamlit project all you have to do is change the schema within the queries used to generate the visualisations.

Update your schema name in the queries found in `queries/pageviews`, `queries/sessions` and `queries/users`. For example:

```sql
SELECT count(1) AS number_of_sessions
FROM NEW_SCHEMA_NAME.snowplow_web_sessions
WHERE START_TSTAMP BETWEEN DATEADD(day, -7, GETDATE()) AND  DATEADD(day, -1, GETDATE())
```

{{% /tab %}}

{{% tab name="Databricks Notebook" %}}

Assuming you have already imported the IPython notebook provided in the chapter about visualisations, all you have to do is change the schema within the queries used to generate the graphs.

You can do this quickly by using the `Edit/ Find and replace` functionality.

{{% /tab %}}

{{< /tabs >}}
