+++
title = "Setup"
weight = 1
post = ""
+++

There are a number of options to implement Snowplow tracking in your website or single page application. 

Select the required pathway to implement tracking on your project.

{{< tabs groupId="select" >}}
{{% tab name="JS" %}}

#### **Step 1:** Download sp.js
Add the sp.js file to your project directory. The latest version can be found [here](https://github.com/snowplow/snowplow-javascript-tracker/releases). 

*** 

#### **Step 2:** Add JS snippet
Add the below snippet to all of the pages you would like to track. **Make sure to update the link to the sp.js file**

Typically this will be placed into the `<head>` element of your page or in a similar, suitable, location if using a Single Page Application framework.

```javascript
<script type="text/javascript" async=1 >
;(function (p, l, o, w, i, n, g) { if (!p[i]) { p.GlobalSnowplowNamespace = p.GlobalSnowplowNamespace || []; p.GlobalSnowplowNamespace.push(i); p[i] = function () { (p[i].q = p[i].q || []).push(arguments) }; p[i].q = p[i].q || []; n = l.createElement(o); g = l.getElementsByTagName(o)[0]; n.async = 1; n.src = w; g.parentNode.insertBefore(n, g) } }(window, document, "script", "{{Link to sp.js file}}", "snowplow"));
<script>
```

***

#### **Step 3:** Configure the Tracker
Call `newTracker` in the `<script>` tag, with the following arguments. This creates an instance of a basic tracker without any additional context.

- Tracker Name: `'sp'`
- Collector Url: `'{{Url for Collector}}'`

```javascript 
window.snowplow('newTracker', 'sp', '{{Url for Collector}}')
```

<!-- **should we point the collector to mini/micro collector for testing??** -->

In addition to the basic tracker, add the below optional arguments to the tracker to make use of some of Snowplow's more advanced features.

**Optional Settings (JSON):**
  - `appId`: Identify events that occur on different applications
  - `platform`: Identify the platform the event occurred on, in this case `web`
  - `cookieSameSite`: Lax **Not sure why, or what explanation to give, but is recommended**

```javascript 
window.snowplow('newTracker', 'sp', '{{Url for Collector}}', { 
    appId: 'appId',
    platform: 'web',
    cookieSameSite: 'Lax',
});
```

{{% /tab %}}
{{% tab name="React" %}}

#### **Step 1:** Install browser-tracker package

Install the `@snowplow/browser-tracker` via npm by running:

```cmd
npm install @snowplow/browser-tracker
```

**Have react router dom installed**

***

#### **Step 2:** Import the tracker package
In your `src` folder, create a file called `tracker.js`. 

Import the browser tracker into `tracker.js` with the below snippet:

```javascript
import React from 'react';
import { newTracker, trackPageView, enableActivityTracking } from "@snowplow/browser-tracker";
```

***

#### **Step 3:** Configure the tracker
Create the tracker with the with the following arguments. This creates an instance of a basic tracker without any additional context.

- Tracker Name: `'sp'`
- Collector Url: `'{{Url for Collector}}'`

```javascript 
let tracker = newTracker('sp', '{{Url for Collector}}')
```

In addition to the basic tracker, add the below optional arguments to the tracker to make use of some of Snowplow's more advanced features.

**Optional Settings (JSON):**
  - `appId`: Identify events that occur on different applications
  - `platform`: Identify the platform the event occurred on, in this case `web`
  - `cookieSameSite`: Lax **Not sure why, or what explanation to give, but is recommended**
  
```javascript 
let tracker = newTracker('sp', '{{Url for Collector}}', { 
    appId: 'appId',
    platform: 'web',
    cookieSameSite: 'Lax',
});

```
 
{{% /tab %}}
{{% tab name="Angular" %}}

#### **Step 1:** Install browser-tracker package

Install the `@snowplow/browser-tracker` via npm by running:

```cmd
npm install @snowplow/browser-tracker
```

***

####  **Step 2:** Generate Snowplow Service 
Run `ng generate service snowplow` to create `snowplow.service.ts` and `snowplow.service.spec.ts` within `src/app`.

***

#### **Step 3:**  Configure the tracker
Create the tracker with the with the following arguments. This creates an instance of a basic tracker without any additional context.

- Tracker Name: `'sp'`
- Collector Url: `'{{Url for Collector}}'`

Add the below snippet to `snowplow.service.ts`

```javascript
export class SnowplowService {
  tracker: BrowserTracker = newTracker('sp', '{{Url for Collector}}')
}

```

In addition to the basic tracker, add the below optional arguments to the tracker to make use of some of Snowplow's more advanced features.

**Optional Settings (JSON):**
  - `appId`: Identify events that occur on different applications
  - `platform`: Identify the platform the event occurred on, in this case `web`
  - `cookieSameSite`: Lax **Not sure why, or what explanation to give, but is recommended**
  
```javascript 
export class SnowplowService {
  tracker: BrowserTracker = newTracker('sp',  '{{Url for Collector}}', {
    appId: 'appId',
    platform: 'web',
    cookieSameSite: 'Lax',
  })
}
```
{{% /tab %}}
{{< /tabs >}}
