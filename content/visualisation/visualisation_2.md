+++
title = "Databricks Notebook"
post = ""
weight = 1
+++

You can create custom visualisations including dashboards using a Datrabricks notebook.

Download the `databricks_notebook` from the attachments to get started.

{{% attachments style="blue" %}}
{{% /attachments %}}


#### **Step 1:** Import the notebook
Go to your Databricks `Workspace` and click on the Down Arrowhead sign then select `Import`.
Browse to the downloaded databricks notebook and click `Import`.

For further information on this, check out the official Databricks [documentation](https://docs.databricks.com/notebooks/notebooks-manage.html)

#### **Step 2:** Attach the notebook to your cluster
Before you can do any work, you must first attach the notebook to a cluster.

To attach a notebook to a cluster:

1. In the notebook toolbar, click `Detached`.

2. From the drop-down, select a cluster.

#### **Step 3:** Change source table schemas and or variables
The predefined SQL statements all refer to the `derived` schema. Make sure to update this to your own schema before attempting to run the notebook. It should be `[your_dbt_schema]_derived`.

#### **Step 4:** Run the notebook
Click on `Run all` which you can find in the toolbar at the top of the page. It should take a minute or so to have everything refreshed. Once finished you can go to `View` and click on `Results onl`y` to see the outcome without the code snippets.

#### **Step 5:** Check out the dashboard
Head over to `Views/web_accelerator` under dashboards to open the corresponding dashboard as well.
