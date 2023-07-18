+++
title = "Tracking"
chapter = true
weight = 5
pre = "4. "
post = ""
+++

<!-- ### Chapter 4 -->

# Tracking


{{<mermaid>}}
flowchart LR
    id1(Upload)-->id2(Model)-->id3(Visualize)-->id4(Track)-->id5(Enrich)-->id6(Next steps)
    style id4 fill:#f5f5f5,stroke:#6638B8,stroke-width:3px
    style id1 fill:#f5f5f5,stroke:#333,stroke-width:1px
    style id3 fill:#f5f5f5,stroke:#333,stroke-width:1px
    style id5 fill:#f5f5f5,stroke:#333,stroke-width:1px
    style id2 fill:#f5f5f5,stroke:#333,stroke-width:1px
    style id6 fill:#f5f5f5,stroke:#333,stroke-width:1px
{{</mermaid >}}


Getting started with sending events using the JavaScript tracker is very similar to other web analytics vendors like Google Analytics and Adobe Analytics.

Once set-up, you will have the ability to send behavioral data to your Snowplow pipeline.
