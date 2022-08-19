# Advanced Analytics for Web

!['logo-banner'](images/logo_banner.png)

#### Introduction

Welcome to the Advanced Analytics for Web accelerator. In this guide you'll learn how to set up tracking and enrichment as well as how to model and visualise Snowplow data. 

Once finished, you will be able to build a deeper understanding of customer behavior on your website and use your data to influence business decisions.

***

#### Who is this guide for?
Data practicioners with or without Javascript developer experience who would like to set up tracking on their company's website or single page application and learn how to use the Snowplow web data model to gain insight from their customers' behavioural data as quickly as possible.

***

#### What you'll learn
In approximately 2 working days you will learn to: 

- **Track -** Setup and deploy tracking to your website or single page application
- **Enrich -** Add enrichments to your data
- **Model -** Configure the snowplow-web data model and run it against your Snowflake warehouse
- **Visualise -** Visualise your output data with Streamlit 

{{<mermaid>}}
gantt
        dateFormat  HH-mm
        axisFormat %M
        section 1. Track
        8h          :track, 00-00, 6m
        section 2. Enrich
        4h          :enrich, after track, 2m
        section 3. Model
        2h          :model, after enrich, 4m
        section 4. Visualise
        5h          :visaualise, after model, 4m
{{</mermaid >}}

***

#### Prerequisites
- Snowplow Pipeline
- Web app to implement tracking on
- dbt installed
  - a new dbt project created and configured
  - a dataset of web events from the Snowplow Javascript tracker in your data warehouse (Snowflake will be used for illustration but the package also supports BigQuery, Databricks, Postgres and Redshift)


