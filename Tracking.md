# Implement tracking in your JS project

### Prerequisites
- Snowplow Pipeline
- Web app to implement tracking on

##  <strong>Step 1: </strong>  Install and initialise the JS browser tracker
```javascript
import { newTracker, trackPageView } from "@snowplow/browser-tracker"

newTracker('sp1', '{{collector_url}}', {
    appId: 'my-app-id',
    plugins: [ ],
});

trackPageView();
```
##  <strong>Step 1: </strong>  Download the Javascript Tracker Code Snippets!? and add to site

```javascript 
(function (p, l, o, w, i, n, g) { if (!p[i]) { p.GlobalSnowplowNamespace = p.GlobalSnowplowNamespace || []; p.GlobalSnowplowNamespace.push(i); p[i] = function () { (p[i].q = p[i].q || []).push(arguments) }; p[i].q = p[i].q || []; n = l.createElement(o); g = l.getElementsByTagName(o)[0]; n.async = 1; n.src = w; g.parentNode.insertBefore(n, g) } }(window, document, "script", "{{Link to sp.js file}}", "snowplow"));

window.snowplow('newTracker', 'sp', '{{Url for Collector}}', { // 
    appId: 'demo-app'
});

window.snowplow('trackPageView');
```

npm, yarn and pnpm vs dl [sp.js](https://github.com/snowplow/snowplow-javascript-tracker/releases) do we have a preference?


##  <strong>Step 2: </strong>  Tracking out of the box events

- Scope and initialisation options 
- Page views
- Page pings

##  <strong>Step 3: </strong>  Tracking custom events

##  <strong>Step 4: </strong>  Tracking (strategy?) for advanced web analytics
