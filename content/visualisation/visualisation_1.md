+++
title = "Streamlit"
post = ""
weight = 1
+++

Streamlit uses Python to build shareable dashboards without the need for front-end development experience.

Download the `streamlit-visualisation` project template and copy the unzipped folder to your project directory to get started.

{{% attachments style="blue" %}}
{{% /attachments %}}


#### **Step 1:** Install requirements
Run the command below to install the project requirements and run the virtual environment

```bash
pipenv install
pipenv shell
```
{{% notice %}}
Please note that this implementation has been tested with the following dependencies:
- python=3.9.13
- streamlit=1.12.0
- snowflake-connector-python==2.7.9
In case you run into package compatibility issues or encounter any errors you try with them to build your own environment.
{{% /notice %}}
#### **Step 2:** Set-up Database Connection
Open `secrets.toml` and add your Snowflake account and database details.
{{% notice warning %}}
Ensure `secrets.toml` is in `.gitignore` to keep your information safe.
{{% /notice %}}

```toml
# .streamlit/secrets.toml

[snowflake]
user = "xxx"
password = "xxx"
account = "xxx"
database = "xxx"
schema = "xxx"

```

#### **Step 3:** Add your schema to queries
Open `pageviews.sql` and `sessions.sql`. Add your schema name to the queries.

```sql
SELECT * FROM SCHEMA_NAME.snowplow_web_page_views

SELECT * FROM SCHEMA_NAME.snowplow_web_sessions
```

#### **Step 4:** Run the Streamlit dashboard
Run the command below to run the streamlit locally

```bash
streamlit run Dashboard.py
```
