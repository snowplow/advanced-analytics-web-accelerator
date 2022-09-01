+++
title= "Setup dbt Package"
weight = 3
post = ""
+++

At this stage you should either:

Have tracking and enrichment setup, as well as:
- Data in the `ATOMIC.EVENTS` table
- Enabled IAB, UA parser and YAUAA enrichments

**or**

Loaded `sample_events.csv` to your warehouse, as well as:

- Data in the `ATOMIC.SAMPLE_EVENTS` table

***

#### **Step 1:** Setup Variables

The snowplow_web dbt package comes with a list of variables specified with a default value that you may need to overwrite in your own dbt project's `dbt_project.yml` file. For details you can have a look at the installed package's default variables which can be found at `[dbt_project_name]/dbt_packages/snowplow_web/dbt_project.yml`.

For the sake of simplicity we have selected the variables that you will most likely need to overwrite, the rest can be changed at a later stage if and when it is needed.

- `snowplow__start_date`: The date of the first tracked event inside your atomic.events table you would like to model.
- `snowplow__enable_iab`: Variable that by default is disabled but needed if the IAB enrichment is used.
- `snowplow__enable_ua`: Variable that by default is disabled but needed if the UA enrichment is used.
- `snowplow__enable_yauaa`: Variable that by default is disabled but needed if the YAUAA enrichment is used.

Optional:

- `snowplow__backfill_limit_days`: The maximum number of days of new data to be processed since the latest event processed. 

{{% notice note %}}
We suggest changing `snowplow__backfill_limit_days` to 1 whilst working in your dev environment initially so that you can test how your incremental runs work.  You will most likely only have a few days of data available at this stage and if you leave it at the default 30 days, you will model all your data in one go.
{{% /notice %}}

Add the following snippet to the `dbt_project.yml`:

```yml
vars:
  snowplow_web:
    snowplow__start_date: {{YYYY-MM-DD}}
    snowplow__enable_iab: true
    snowplow__enable_ua: true
    snowplow__enable_yauaa: true
```
If you would like to use the `ATOMIC.SAMPLE_EVENTS` table as a base instead of `ATOMIC.EVENTS` where the data is sent through the pipeline, add the following variable:

```yml
vars:
  snowplow_web:
    ...
    ...
    snowplow__events: 'atomic.sample_events'
```
#### **Step 2:** Add the selectors.yml to your project

The web package provides a suite of suggested selectors to help run and test the models.

These are defined in the [selectors.yml](https://github.com/snowplow/dbt-snowplow-web/blob/main/selectors.yml) file within the package, however to use these model selections you will need to copy this file into your own dbt project directory.

This is a top-level file and therefore should sit alongside your `dbt_project.yml` file.

***

#### **Step 3:** Run the model

Execute the following either through your CLI or from within dbt Cloud

```
dbt run --selector snowplow_web
```

This should take a couple of minutes to run. Depending on the period of data available since the `snowplow__start_date` and the `snowplow__backfill_limit_days` variable you might not process all your data during your first run. Each time the model runs it should display the period it processes and the timestamp of the last event processed for each model within the package. This gets saved in the `snowplow__incremental_manifest` table so you can always check the data processing state (see below).

![manifest](../images/manifest.png)
