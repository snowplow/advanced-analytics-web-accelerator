+++
title = "Adding Context"
weight = 3
+++

Whilst the tracking set-up provides event data on user **actions** at a specific point in time, **context** describes the setting in which an event takes place. To describe the context of an event, we need to define and capture individual **entities**. For example:

- The user performing an action
- The web page the action occured on
- A product that has been interacted with

Together, these entities make up the context of an event.

Similar to the predefined events, a number of entities are available to implement out of the box including:

- **webPage Entity -** Adds the Pageview ID
- **session Entity -** Information about the user session
- **performanceTiming Entity -** Calculate page performance metrics
- **geolocation Entity -** Information on the users location

{{< tabs groupId="select_js" >}}
{{% tab name="Javascript" %}}

#### **Step 1:** Enable predefined entities
The `webPage` entity is enabled by default in the JavaScript tracker. This is **required** for modelling your data using the `dbt-web-model`.

Enable the context by including the below context options in your tracker creation.

<!-- To enable `session`, `performanceTiming` and `geolocation` use the options below. -->

```javascript
window.snowplow('newTracker', 'sp', '{{Url for Collector}}', {
  ...
  contexts: {
        webPage: true,
      }
  ...
});
```

Each event sent with this tracker will now contain the data from each of these entities.

<!--
#### **Step 2:** Custom Entities
**Do we want to do this?**
In addition to the out of the box entities, Snowplow lets you add custom entities to provide additional information surrounding an event.

These are defined using JSON schemas uploaded to your iglu repository

*** -->

{{% /tab %}}
{{% tab name="React" %}}
#### **Step 1:** Enable predefined entities
The `webPage` entity is enabled by default in the JavaScript tracker. This is **required** for modelling your data using the `dbt-web-model`.

Enable the context by including the below context options in your tracker creation.

<!-- To enable `session`, `performanceTiming` and `geolocation` use the options below. -->

```javascript
let tracker = newTracker('sp', '{{Url for Collector}}', {
  ...
  contexts: {
    webPage: true
  }
  ...
});
```

Each event sent with this tracker will now contain the data from each of these entities.

{{% /tab %}}
{{% tab name="Angular" %}}

#### **Step 1:** Enable predefined entities
The `webPage` entity is enabled by default in the JavaScript tracker. This is **required** for modelling your data using the `dbt-web-model`.

Enable the context by including the below context options in your tracker creation.

```javascript
export class SnowplowService {
  tracker: BrowserTracker = newTracker('sp', '{{Url for Collector}}', {
  ...
  contexts: {
      webPage: true,
      session: false
      }
  ...
  }
});
```

Each event sent with this tracker will now contain the data from each of these entities.

{{% /tab %}}
{{< /tabs >}}
