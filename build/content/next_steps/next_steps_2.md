+++
title = "Visualise your pipeline data"
weight = 2
post = ""
+++

Assuming you have already set-up your Streamlit project all you have to do is change the `schema` variable within the `secrets.toml` file under the streamlit-project-web folder and rerun the dashboard.


```toml
# .streamlit/secrets.toml

[snowflake]
...
schema = "YOUR_NEW_DERIVED_SCHEMA"

```

Run the command below to run the streamlit locally:

```bash
streamlit run Dashboard.py
```
