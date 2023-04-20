+++
title = "Visualise your pipeline data"
weight = 2
post = ""
+++

{{< tabs groupId="visualise" >}}

{{% tab name="Streamlit" %}}

Assuming you have already set-up your Streamlit project all you have to do is change the `schema` variable within the `secrets.toml` file under the streamlit-project-web folder and rerun the dashboard.


```toml
# .streamlit/secrets.toml

# Snowflake or Databricks
...
schema = "YOUR_NEW_DERIVED_SCHEMA"

# BigQuery
...
dataset = "YOUR_NEW_DERIVED_SCHEMA"
```

Run the command below to run the streamlit locally:

```bash
streamlit run Dashboard.py
```
{{% /tab %}}

{{% tab name="Databricks" %}}

Assuming you have already imported the IPython notebook provided in the chapter about visualisations, all you have to do is change the schema within the queries used to generate the graphs.

You can do this quickly by using the `Edit/ Find and replace` functionality.

{{% /tab %}}

{{< /tabs >}}
