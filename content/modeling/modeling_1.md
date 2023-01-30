+++
title = "Install Snowplow dbt Package"
weight = 1
post = ""
+++

#### **Step 1:** Add snowplow-web package
Add the snowplow-web package to your packages.yml file. The latest version can be found [here](https://hub.getdbt.com/snowplow/snowplow_web/latest/)

```yml
packages:
  - package: snowplow/snowplow_web
    version: 0.12.4
```

***

#### **Step 2:** Install the package
Install the package by running:

```
dbt deps
```

