+++
title = "Adding Context"
weight = 3
post = ""
+++

Whilst the tracking set up provides event data on user **actions** at a specific point in time, **context** describes the setting in which an event takes place. To describe the context of an event, we need to define and capture individual **entities**. For example:

- The user performing an action
- The web page the action occured on
- A product that has been interacted with

Together, these entities make up the context of an event.

Similar to the predefined events, a number of entities are available to implement out of the box including:

- **webPage Entity -** Explanation?
- **session Entity -** Information about the user session
- **performanceTiming Entity -** Calculate page performance metrics
- **geolocation Entity -** Information on the users location

***

### **Step 1:** Enable Predefined Entities
The `webPage` entity is enabled by default in the JavaScript tracker.

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

***

### **Step 2:** Custom Entities 
**Do we want to do this?**
In addition to the out of the box entities, Snowplow lets you add custom entities to provide additional information surrounding an event. 

These are defined using JSON schemas uploaded to your iglu repository

***