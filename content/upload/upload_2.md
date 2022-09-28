+++
title = "Data upload - Databricks"
weight = 2
post = ""
+++

{{% attachments style="blue" %}}
{{% /attachments %}}


You can load the sample data to the warehouse using your `Databricks Workspace` as described in the below steps. Please download the *sample_events.csv* from the attachments. For more details please check out the official [Databricks documentation](https://docs.databricks.com/ingestion/add-data/index.html).


#### **Step 1:**  Create the ATOMIC schema
If the ATOMIC schema doesn't exist, create it in your target database.

```sql
CREATE SCHEMA IF NOT EXISTS ATOMIC

```

***

#### **Step 2:**  Upload the SAMPLE_DATA.CSV file
2.1 Select `+Create` -> `table` to get started.

2.2 Locate the sample_events.csv file and click `Upload`. It should take a minute or two.

2.3 Once you see the preview, choose the catalog, the schema (atomic) and change the name to sample_events**_base**.

2.4 Go to `advanced attributes` and change the column delimiter to tab then X out of the window. After this the data reloads, which will now be separated correctly column by column.

2.5 Locate the column **DOC_WIDTH** on the far right side of the table and change the proposed column type from `string` to `bigint`. This is needed for the data model to work later on.

2.6 Locate the column **DERIVED_TSTAMP** on the far right side of the table and changed the proposed column type from `string` to `datetime`.

2.6 Click create.



***

#### **Step 3:** Create the **ATOMIC.SAMPLE_EVENTS** table

The Snowplow pipeline creates context fields as arrays but uploading the test data can be achieved through string/varchar data type first. Run the below DDL statement in your SQL editor to create the sample_events table from the base table including the necessary conversions:

```sql
CREATE OR REPLACE TABLE ATOMIC.SAMPLE_EVENTS AS (

SELECT
	APP_ID,
	PLATFORM,
	ETL_TSTAMP,
	COLLECTOR_TSTAMP,
	DVCE_CREATED_TSTAMP,
	EVENT,
	EVENT_ID,
	TXN_ID,
	NAME_TRACKER,
	V_TRACKER,
	V_COLLECTOR,
	V_ETL,
	USER_ID,
	USER_IPADDRESS,
	USER_FINGERPRINT,
	DOMAIN_USERID,
	DOMAIN_SESSIONIDX,
	NETWORK_USERID,
	GEO_COUNTRY,
	GEO_REGION,
	GEO_CITY,
	GEO_ZIPCODE,
	GEO_LATITUDE,
	GEO_LONGITUDE,
	GEO_REGION_NAME,
	IP_ISP,
	IP_ORGANIZATION,
	IP_DOMAIN,
	IP_NETSPEED,
	PAGE_URL,
	PAGE_TITLE,
	PAGE_REFERRER,
	PAGE_URLSCHEME,
	PAGE_URLHOST,
	PAGE_URLPORT,
	PAGE_URLPATH,
	PAGE_URLQUERY,
	PAGE_URLFRAGMENT,
	REFR_URLSCHEME,
	REFR_URLHOST,
	REFR_URLPORT,
	REFR_URLPATH,
	REFR_URLQUERY,
	REFR_URLFRAGMENT,
	REFR_MEDIUM,
	REFR_SOURCE,
	REFR_TERM,
	MKT_MEDIUM,
	MKT_SOURCE,
	MKT_TERM,
	MKT_CONTENT,
	MKT_CAMPAIGN,
	SE_CATEGORY,
	SE_ACTION,
	SE_LABEL,
	SE_PROPERTY,
	SE_VALUE,
	TR_ORDERID,
	TR_AFFILIATION,
	TR_TOTAL,
	TR_TAX,
	TR_SHIPPING,
	TR_CITY,
	TR_STATE,
	TR_COUNTRY,
	TI_ORDERID,
	TI_SKU,
	TI_NAME,
	TI_CATEGORY,
	TI_PRICE,
	TI_QUANTITY,
	PP_XOFFSET_MIN,
	PP_XOFFSET_MAX,
	PP_YOFFSET_MIN,
	PP_YOFFSET_MAX,
	REPLACE(USERAGENT, '\"', '') as USERAGENT,
	BR_NAME,
	BR_FAMILY,
	BR_VERSION,
	BR_TYPE,
	BR_RENDERENGINE,
	BR_LANG,
	BR_FEATURES_PDF,
	BR_FEATURES_FLASH,
	BR_FEATURES_JAVA,
	BR_FEATURES_DIRECTOR,
	BR_FEATURES_QUICKTIME,
	BR_FEATURES_REALPLAYER,
	BR_FEATURES_WINDOWSMEDIA,
	BR_FEATURES_GEARS,
	BR_FEATURES_SILVERLIGHT,
	BR_COOKIES,
	BR_COLORDEPTH,
	BR_VIEWWIDTH,
	BR_VIEWHEIGHT,
	OS_NAME,
	OS_FAMILY,
	OS_MANUFACTURER,
	OS_TIMEZONE,
	DVCE_TYPE,
	DVCE_ISMOBILE,
	DVCE_SCREENWIDTH,
	DVCE_SCREENHEIGHT,
	DOC_CHARSET,
	DOC_WIDTH,
	DOC_HEIGHT,
	TR_CURRENCY,
	TR_TOTAL_BASE,
	TR_TAX_BASE,
	TR_SHIPPING_BASE,
	TI_CURRENCY,
	TI_PRICE_BASE,
	BASE_CURRENCY,
	GEO_TIMEZONE,
	MKT_CLICKID,
	MKT_NETWORK,
	ETL_TAGS,
	DVCE_SENT_TSTAMP,
	REFR_DOMAIN_USERID,
	REFR_DVCE_TSTAMP,
	DOMAIN_SESSIONID,
	DERIVED_TSTAMP,
	EVENT_VENDOR,
	EVENT_NAME,
	EVENT_FORMAT,
	EVENT_VERSION,
	EVENT_FINGERPRINT,
	TRUE_TSTAMP,
	LOAD_TSTAMP,
	FROM_JSON(REPLACE(REPLACE(CONTEXTS_COM_SNOWPLOWANALYTICS_SNOWPLOW_UA_PARSER_CONTEXT_1,'\"', ''),'''','\"'), 'array<struct<device_family:string, os_family:string, os_major:string, os_minor: string, os_patch:string, os_patch_minor:string, os_version:string, useragent_family:string, useragent_major:string, useragent_minor:string, useragent_patch: string, useragent_version:string>>') as CONTEXTS_COM_SNOWPLOWANALYTICS_SNOWPLOW_UA_PARSER_CONTEXT_1,
	FROM_JSON(REPLACE(REPLACE(CONTEXTS_COM_SNOWPLOWANALYTICS_SNOWPLOW_WEB_PAGE_1,'\"', ''),'''','\"'), 'array<struct<id:string>>') as CONTEXTS_COM_SNOWPLOWANALYTICS_SNOWPLOW_WEB_PAGE_1,
	FROM_JSON(REPLACE(REPLACE(CONTEXTS_COM_IAB_SNOWPLOW_SPIDERS_AND_ROBOTS_1,'\"', ''),'''','\"'), 'array<struct<category:string, primary_impact:string, reason:string, spider_or_robot:string>>') as CONTEXTS_COM_IAB_SNOWPLOW_SPIDERS_AND_ROBOTS_1,
	FROM_JSON(REPLACE(REPLACE(CONTEXTS_NL_BASJES_YAUAA_CONTEXT_1,'\"', ''),'''','\"'), 'array<struct<agent_class:string, agent_name:string, agent_name_version:string, agent_name_version_major:string, agent_version:string, agent_version_major:string, device_brand:string, device_class:string, device_firmware_version:string, device_name:string, device_version:string, layout_engine_class:string, layout_engine_name:string, layout_engine_name_version:string, layout_engine_name_version_major:string, layout_engine_version:string, layout_engine_version_major:string, operating_system_class:string, operating_system_name:string, operating_system_name_version:string, operating_system_name_major:string, operating_system_version:string, operating_system_version_major:string>>') as CONTEXTS_NL_BASJES_YAUAA_CONTEXT_1

FROM ATOMIC.SAMPLE_EVENTS_BASE )

```

***

#### **Step 4:**  Drop the **SAMPLE_EVENTS_BASE** table

```sql
DROP TABLE ATOMIC.SAMPLE_EVENTS_BASE
```
You will now have the ATOMIC.SAMPLE_EVENTS created and loaded with sample data.
