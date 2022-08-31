+++
title = "Setup"
post = ""
weight = 1
+++

There are a number of options to visualise your modelled data. We will explore a few ideas to get started.

Download the `streamlit-visualisation` project template and copy the unzipped folder to your project directory to get started.

{{% attachments style="blue" %}}

#### **Step 1:** Install Requirements
Run the command below to install the project requirements and run the virtual environment

```cmd
pipenv install
pipenv shell
```

#### **Step 2:** Setup Database Connection
Open `secrets.toml` and add your Snowflake account and database details. **Ensure `secrets.toml` is in `.gitignore` to keep your information safe.**

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

```cmd
streamlit run Dashboard.py
```
<!-- 
baseURL = "https://snowplow-incubator.github.io/advanced-analytics-web-accelerator"
languageCode = "en-US"
defaultContentLanguage = "en"
landingPageURL = "/advanced-analytics-web-accelerator/"
landingPageName = "Introduction" 
disableLandingPageButton = false


title = "Advanced Analytics for Web"
theme = "hugo-theme-learn"
themesdir = "themes"
metaDataFormat = "yaml"
defaultContentLanguageInSubdir= true

[params]
  description = "Advanced Analytics for Web"
  author = "Agnes Kiss and Jack Keene"
  showVisitedLinks = true
  disableBreadcrumb = false
  disableNextPrev = false
  disableLandingPageButton = false
  disableMermaid = false
  disableSearch = true
  customMermaidURL = "https://unpkg.com/browse/mermaid@8.1.0/dist/mermaid.min.js"
  titleSeparator = "|"
  baseURL = "https://snowplow-incubator.github.io/advanced-analytics-web-accelerator/"


[outputs]
home = [ "HTML", "RSS", "JSON"]

[Languages]
[Languages.en]
title = "Advanced Analytics for Web"
titleSeparator = "|"
weight = 1
languageName = "English"
landingPageName = "Introduction" 
landingPageURL = "advanced-analytics-web-accelerator"

[[Languages.en.menu.shortcuts]]
name = "Try Snowplow"
identifier = "ds"
url = "https://try.snowplowanalytics.com/"
weight = 10
 -->
