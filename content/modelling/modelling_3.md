+++
title= "Testing"
weight = 3
post = ""
+++

Data should now be loaded into your warehouse, next we will check the models output.

#### **Step 1:** Check the output
Head to the SQL editor of your choice (e.g.: Snowflake Web UI) to check the model's output. You should be able to see three new schemas created:
1. [your_custom_schema_name_]*scratch*: drop and recompute models that aid the incremental run
2. [your_custom_schema_name_]*derived*: main output models you can use in your downstream models and reporting
3. [your_custom_schema_name_]*manifest*: tables that help the integrity and core incremental logic of the model
Check out the `database` section of the [`documentation site`] [snowplow-web-documentation] for a breakdown of what the output should look like.

[selectors-yml-file](https://github.com/snowplow/dbt-snowplow-web/blob/main/selectors.yml)
[snowplow-web-documentation](https://snowplow.github.io/dbt-snowplow-web/#!/overview/snowplow_web)


