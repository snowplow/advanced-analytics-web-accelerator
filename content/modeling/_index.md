+++
title = "Modeling"
date = 2022-08-16T17:24:05+01:00
weight = 2
chapter = true
pre = "<b>2. </b>"
+++

### Chapter 2

# Modeling your Data

{{<mermaid>}}
flowchart LR
    id1(Upload)-->id2(Model)-->id3(Visualise)-->id4(Track)-->id5(Enrich)-->id6(Next steps)
    style id2 fill:#f9f,stroke:#000,stroke-width:4px
{{</mermaid >}}


The [snowplow-web dbt package](https://hub.getdbt.com/snowplow/snowplow_web/latest/) transforms and aggregates the raw web event data collected from the [Snowplow JavaScript tracker](https://github.com/snowplow/snowplow-javascript-tracker) into a set of derived tables: *page views, sessions* and *users*. Modeling the data makes it easier to digest and derive business value from the Snowplow data either through AI or BI.

In this chapter you will learn how to set up an run the snowplow-web package to model the sample data.
