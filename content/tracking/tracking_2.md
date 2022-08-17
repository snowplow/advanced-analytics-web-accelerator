+++
title = "Tracking Events"
weight = 2
post = ""
+++

The trackers create data on user **actions** at a specific point in time. For example:

- Loading a web page
- Clicking a link
- Submitting a form

A number of tracking events are available out of the box. These include, but aren't limited to:

- Page views
- Heartbeats (Page Pings)
- Link clicks
- HTML form actions

In this section, we will implement page views and page pings.

***

{{< tabs groupId="enable" >}}
{{% tab name="JS" %}}

### **Step 1:** Enable Activity Tracking
First we will enable activity tracking to collect 'page ping' events. This will allow us to monitor engagement and record how a user digests content on the page over time. 

  - `minimumVisitLength` : The number of seconds from page load before the first page ping occurs
  - `heartbeatDelay`: The number of seconds between page pings 

Add the snippet to your `script` tag below the tracker instance. 

```javascript
snowplow('enableActivityTracking', { 
  minimumVisitLength: 5, 
  heartbeatDelay: 10 
});
```

**Should we encourage call back function to limit number of events sent with enableActivityTrackingCallback?**

***

### **Step 2:** Track Page View
To track a page view, simply call `trackPageView'. 

```javascript
snowplow('trackPageView')
```
**Note:** `trackPageView` should go after the page ping event in step 1


{{% /tab %}}
{{% tab name="React" %}}

### **Step 1:** Enable Activity Tracking
First we will enable activity tracking to collect page ping events. This will allow us to monitor engagement and record how a user digests content on the page over time. 

  - `minimumVisitLength` : The number of seconds from page load before the first page ping occurs
  - `heartbeatDelay`: The number of seconds between page pings 

Add the snippet to your `tracker.js` file below the tracker instance. 

```javascript
enableActivityTracking({
  minimumVisitLength: 5,
  heartbeatDelay: 10,
});
```

### **Step 2:** Track Page View
**react-router-dom is required**

To track page views, we will first define a function called `useLocationChange`. This will take advantage of `useEffect` and the `useLocation` hook from `react-router-dom` and `trackPageView` function from `browser-tracker`. 

- `useLocation`: returns an object, `location`, describing the current page.
- `useEffect`: Exececutes a function whenever `location` changes. In this case `trackPageView()`
- `trackPageView()`: Sends a Snowplow page view event to the collector URL

Add the below snippet to `tracker.js`

```javascript
const useLocationChange = () => {
  const location = useLocation();
  React.useEffect(() => { 
    trackPageView();
   }, [location]);
};

export { tracker, useLocationChange };

```

{{% /tab %}}
{{< /tabs >}}

<!-- ## Further reading

### **Step 3:**  Link Click Tracking
To enable link click tracking, call the `enableLinkClickTracking` method.

```javascript
snowplow('enableLinkClickTracking');
```

You only need to call the method once to track all the links on a page. This will capture the links `href` by default as well as the `id`, `class` and `target` of the link.
  
**Add more complex link tracking?**

***

### **Step 4:** HTML Form Tracking
To enable form tracking, simply call the `enableFormTracking` method.

```javascript
snowplow('enableFormTracking');
```

This will track an event when a user focuses, changes or submits a form. -->