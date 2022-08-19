+++
title = "Add Enrichments"
weight = 1
post = ""
+++

Snowplow offers a large number of enrichments that can be used to enhance your event data. An enrichment either updates or populates fields of the atomic event or adds a self-describing context to derived_contexts.

For this project, we'll enable the IAB, UA parser and YAUAA enrichments in your console:

{{% notice note %}}
IAB requires purchase (included with Snowplow BDP)
{{% /notice %}}

#### IAB
Use the IAB/ABC International Spiders and Bots List to determine whether an event was produced by a user or a robot/spider based on its’ IP address and user agent.

#### UA Parser
Parse the useragent and attach detailed useragent information to each event.

#### YAUAA
Parse and analyse the user agent string of an event and extract as many relevant attributes as possible using YAUAA API.