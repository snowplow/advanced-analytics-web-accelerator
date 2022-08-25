+++
title= "Setup dbt Package"
weight = 3
post = ""
+++

At this stage you should EITHER:

1. Have tracking and enrichment setup, as well as:

- Data in the `ATOMIC.EVENTS` table
- Enabled IAB, UA parser and YAUAA enrichments

2. In case you skipped the tracking and enrichment steps and used our SAMPLE_DATA.csv instead you should have:

- Data in the `ATOMIC.SAMPLE_EVENTS` table

***

#### **Step 1:** Setup Variables

Edit the `dbt_project.yml` which can be found at `[dbt_project_name]/dbt_packages/snowplow_web/dbt_project.yml` with the below options.

- `snowplow__start_date`: The date of the first tracked event inside your atomic.events table you would like to model.
- `snowplow__backfill_limit_days`: The maximum number of days of new data to be processed since the latest event processed. We suggest changing this to 1 whilst  working in your dev environment so that can test that your incremental runs work.

Add the snippet to `dbt_project.yml`:

```yml
vars:
  snowplow_web:
    snowplow__start_date: {{YYYY-MM-DD}}
    snowplow__backfill_limit_days: 1
    snowplow__enable_iab: true
    snowplow__enable_ua: true
    snowplow__enable_yauaa: true
```
If you would like to use the `ATOMIC.SAMPLE_EVENTS` table as a base instead of `ATOMIC.EVENTS` where the data is sent through the pipeline, add the following variable as well:

```yml
vars:
  snowplow_web:
    ...
    ...
    snowplow__events: 'SAMPLE_EVENTS'
```
***

#### **Step 2:** Add the selectors.yml to your project

The web package provides a suite of suggested selectors to help run and test the models.

These are defined in the [selectors.yml](https://github.com/snowplow/dbt-snowplow-web/blob/main/selectors.yml) file within the package, however to use these model selections you will need to copy this file into your own dbt project directory.

This is a top-level file and therefore should sit alongside your `dbt_project.yml` file.

***

#### **Step 3:** Run the model

Execute the following either through your CLI or from within dbt Cloud

```cmd
dbt run --selector snowplow_web
```

This should take a couple of minutes to run.

