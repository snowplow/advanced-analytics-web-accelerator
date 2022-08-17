+++
title = "Testing"
weight = 3
post = ""
+++

**Test using Snowplow Mini or Micro??**

The [Snowplow Chrome Extension](https://chrome.google.com/webstore/detail/snowplow-inspector/maplkdomeamdlngconidoefjpogkmljm?hl=en) can be used to ensure the event was emitted correctly but the browser extension does not check that the event was processed correctly. 

![](/images/chrome_extension.png)

To get the full picture, tracking must be QA’d using the Snowplow Mini, not just by simply checking in the browser.

Note: both events and context entities must be tested thoroughly - if a context entity
that is appended to an event fails validation, the whole event will fail validation.

To QA events in Snowplow Mini:
1. The collector endpoint in the tracker code should be set to point to the Snowplow
Mini collector endpoint. The endpoint address can be found in your console under
Data Structures > Testing Details.
2. Events can be triggered manually (from a testflight app, staging site, GTM preview
mode etc).
3. The processed events can then be viewed in Kibana as shown below. The “bad”
index should be checked too, to ensure that no events are landing there.

***
