+++
title = "Modelling"
date = 2022-08-16T17:24:05+01:00
weight = 3
chapter = true
pre = "<b>3. </b>"
+++

### Chapter 3

# Modelling your Data

{{<mermaid>}}
flowchart LR
    id1(Track)-->id2(Enrich)-->id3(Model)-->id4(Visualise)
    style id3 fill:#f9f,stroke:#000,stroke-width:4px
{{</mermaid >}}


The [snowplow-web dbt package](https://hub.getdbt.com/snowplow/snowplow_web/latest/) transforms and aggregates the raw web event data collected from the Snowplow JavaScript tracker into a set of derived tables: page views, sessions and users. Modelling the data makes it easier to digest and derive business value from the Snowplow data.
