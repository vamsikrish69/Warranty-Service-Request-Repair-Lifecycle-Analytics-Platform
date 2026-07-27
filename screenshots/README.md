# Project Screenshots

This folder contains screenshots demonstrating the implementation of the **Warranty Service Request Repair Lifecycle Analytics Platform**.

The screenshots provide visual proof of the end-to-end analytics workflow, including Fivetran source setup, Snowflake database architecture, staging transformations, lifecycle marts, business analytics outputs, data quality checks, incremental load tracking, and pipeline health monitoring.

---

# 1. Fivetran Source Connector

**Folder:**

```text
fivetran/
```

## Purpose

This screenshot demonstrates the Fivetran source connector setup used as part of the ingestion architecture for the project.

The project used Google Drive as a source location for raw JSON datasets and configured a Fivetran source connector as part of the ELT ingestion workflow design.

## What the Screenshot Shows

The screenshot should show:

```text
Google Drive source connector
Fivetran connector setup
Snowflake destination setup flow
```

## Business Value

This screenshot proves that the project includes a Fivetran-based ingestion architecture component and demonstrates how operational source files can be connected to a cloud data warehouse pipeline.

---

# 2. Snowflake Database Structure

**Folder:**

```text
snowflake_database_structure/
```

## Purpose

This screenshot demonstrates the Snowflake database structure created for the project.

The platform follows a layered data warehouse architecture consisting of:

```text
RAW
STAGING
INTERMEDIATE
MARTS
ANALYTICS
MONITORING
```

## What the Screenshot Shows

The screenshot should show the database:

```text
WARRANTY_SERVICE_ANALYTICS_DB
```

and the main schemas:

```text
RAW
STAGING
INTERMEDIATE
MARTS
ANALYTICS
MONITORING
```

## Business Value

This screenshot proves that the project uses a clean, production-style Snowflake architecture where ingestion, transformation, analytics, and monitoring responsibilities are separated across schemas.

---

# 3. Staging Models

**Folder:**

```text
staging_models/
```

## Purpose

This screenshot demonstrates the staging layer where raw JSON records are transformed into structured relational views.

The staging models extract fields from Snowflake VARIANT columns and convert them into typed analytical columns.

## Example Models

```text
STG_CUSTOMERS
STG_PRODUCT_ASSETS
STG_CUSTOMER_CONTACTS
STG_WARRANTY_ENTITLEMENTS
STG_SERVICE_REQUESTS
STG_REPAIR_EVENTS
STG_CASE_CLOSURES
```

## What the Screenshot Shows

The screenshot should show flattened columns such as:

```text
CUSTOMER_ID
ASSET_ID
CONTACT_ID
SERVICE_REQUEST_ID
REPAIR_EVENT_ID
CLOSURE_ID
REGION
COUNTRY
CREATED_AT
UPDATED_AT
```

## Business Value

This screenshot proves that semi-structured JSON data was successfully transformed into clean relational staging models for downstream analytics.

---

# 4. Lifecycle Mart Outputs

**Folder:**

```text
lifecycle_mart_outputs/
```

## Purpose

This screenshot demonstrates the main lifecycle mart created for the project.

The lifecycle mart tracks the full journey from customer contact to service request, warranty validation, repair fulfillment, and final case closure.

## Recommended Query

```sql
SELECT *
FROM MARTS.MART_SERVICE_REQUEST_LIFECYCLE
LIMIT 10;
```

## What the Screenshot Shows

The screenshot should show lifecycle fields such as:

```text
CONTACT_ID
SERVICE_REQUEST_ID
WARRANTY_ID
REPAIR_EVENT_ID
CLOSURE_ID
CONTACT_TO_SERVICE_HOURS
REPAIR_TURNAROUND_HOURS
TOTAL_LIFECYCLE_HOURS
SERVICE_CREATED_FLAG
REPAIR_COMPLETED_FLAG
CASE_RESOLVED_FLAG
```

## Business Value

This screenshot proves that the platform integrates customer contact, service request, warranty, repair, and closure data into a unified analytical lifecycle model.

---

# 5. Repair Turnaround Analysis

**Folder:**

```text
repair_turnaround_analysis/
```

## Business Question

Are onsite repairs and mail-in repairs being completed efficiently?

## Purpose

This screenshot demonstrates repair fulfillment performance across repair types, repair statuses, repair outcomes, and part-delay scenarios.

## Recommended Query

```sql
SELECT *
FROM MARTS.MART_REPAIR_TURNAROUND_PERFORMANCE
ORDER BY AVG_REPAIR_TURNAROUND_HOURS DESC;
```

## Metrics Displayed

```text
REPAIR_TYPE
SERVICE_TYPE
TOTAL_REPAIR_EVENTS
COMPLETED_REPAIRS
OPEN_REPAIRS
REPAIRS_REQUIRING_PARTS
REPAIRS_WITH_PART_DELAY
AVG_REPAIR_WAIT_TIME_HOURS
AVG_REPAIR_TURNAROUND_HOURS
MEDIAN_REPAIR_TURNAROUND_HOURS
REPAIR_COMPLETION_RATE
PART_DELAY_RATE
```

## Business Value

This screenshot proves that the platform supports analysis of repair efficiency, repair completion rates, part delays, and operational repair bottlenecks.

---

# 6. Warranty Utilization Analysis

**Folder:**

```text
warranty_utilization_analysis/
```

## Business Question

How are warranty entitlements being used across mail-in and onsite repair options?

## Purpose

This screenshot demonstrates warranty utilization across warranty type, entitlement level, warranty status, and repair coverage type.

## Recommended Query

```sql
SELECT
    WARRANTY_TYPE,
    ENTITLEMENT_LEVEL,
    WARRANTY_STATUS,
    REPAIR_COVERAGE_TYPE,
    TOTAL_ASSETS,
    TOTAL_CUSTOMERS,
    TOTAL_SUPPORT_CONTACTS,
    TOTAL_SERVICE_REQUESTS,
    MAIL_IN_SERVICE_REQUESTS,
    ONSITE_SERVICE_REQUESTS,
    ACTIVE_WARRANTY_CONTACTS,
    EXPIRED_WARRANTY_CONTACTS,
    CONTACT_TO_SERVICE_CONVERSION_RATE
FROM MARTS.MART_WARRANTY_UTILIZATION
ORDER BY TOTAL_SERVICE_REQUESTS DESC;
```

## Metrics Displayed

```text
WARRANTY_TYPE
ENTITLEMENT_LEVEL
WARRANTY_STATUS
REPAIR_COVERAGE_TYPE
TOTAL_ASSETS
TOTAL_CUSTOMERS
TOTAL_SUPPORT_CONTACTS
TOTAL_SERVICE_REQUESTS
MAIL_IN_SERVICE_REQUESTS
ONSITE_SERVICE_REQUESTS
ACTIVE_WARRANTY_CONTACTS
EXPIRED_WARRANTY_CONTACTS
CONTACT_TO_SERVICE_CONVERSION_RATE
```

## Business Value

This screenshot proves that the platform can measure how warranty coverage is being used across service requests, support contacts, mail-in repair, and onsite repair operations.

---

# 7. SLA Adherence Analysis

**Folder:**

```text
sla_adherence_analysis/
```

## Business Question

Are service requests being resolved within SLA targets?

## Purpose

This screenshot demonstrates SLA performance across priorities and service lifecycle outcomes.

## Recommended Query

```sql
SELECT
    PRIORITY,
    SLA_STATUS,
    COUNT(*) AS TOTAL_REQUESTS,
    ROUND(AVG(TOTAL_LIFECYCLE_HOURS), 2) AS AVG_LIFECYCLE_HOURS
FROM MARTS.MART_SLA_ADHERENCE
GROUP BY
    PRIORITY,
    SLA_STATUS
ORDER BY
    PRIORITY,
    SLA_STATUS;
```

## Metrics Displayed

```text
PRIORITY
SLA_STATUS
TOTAL_REQUESTS
AVG_LIFECYCLE_HOURS
```

## Business Value

This screenshot proves that the platform supports SLA adherence tracking, SLA breach analysis, and lifecycle time measurement across service priorities.

---

# 8. Channel Region Performance

**Folder:**

```text
channel_region_performance/
```

## Business Question

How are support channels and regions performing across service volume, resolution, escalation, and reopen rates?

## Purpose

This screenshot demonstrates operational performance across contact channels, regions, and countries.

## Recommended Query

```sql
SELECT *
FROM MARTS.MART_CHANNEL_REGION_PERFORMANCE
ORDER BY TOTAL_CONTACTS DESC;
```

## Metrics Displayed

```text
CONTACT_CHANNEL
REGION
COUNTRY
TOTAL_CONTACTS
TOTAL_SERVICE*REQUESTS
FIRST_CONTACT_RESOLUTIONS*CONTACT*_CONVERTED_TO_SERVICE
ESC*L*TED_SERVICE_REQUESTS
RES*L*ED_SERVICE_REQUESTS
RE*PEN*D_SERVICE_REQUESTS
*ONTACT*TO_SERVICE_CONVERSION_RATE
FIRST*CONTACT*RESOLUTION_RATE
*SCALATION_RATE
*EOPEN_RATE
*VG_LIFECYCLE_HOURS
*``

## Business Value

*his*screenshot proves that the platfor* enables support performance analy*is across voice, chat, social medi*, regions, and countries.

---

# *. Product Issue Trends

**Folder:**

```text
product_issue_trends/
``*

## Business Question

Which prod*ct models and issue categories gen*rate the highest support and repai* demand?

## Purpose

This screens*ot demonstrates product issue tren* analysis using issue counts, serv*ce request conversion, repeat requ*sts, escalation rates, and ranking*logic.

## Recommended Query

```s*l
SELECT *
FROM MARTS.MART_PRODUCT*ISSUE_TRENDS
ORDER BY
    PRODUCT_*INE,
    PRODUCT_MODEL,
    ISSUE_*ANK
LIMIT 50;
```

## Metrics Disp*ayed

```text
PRODUCT_LINE
PRODUCT*MODEL
ISSUE_CATEGORY
TOTAL_ISSUE_C*NTACTS
TOTAL_SERVICE_REQUESTS
REPE*T_SERVICE_REQUESTS
ESCALATED_SERVI*E_REQUESTS
ISSUE_RANK
ISSUE_TO_SER*ICE_REQUEST_RATE
REPEAT_SERVICE_RE*UEST_RATE
ESCALATION_RATE
```

## *usiness Value

This screenshot pro*es that the platform can identify *ecurring product issues, high-volu*e support categories, and product *odels with higher service demand.
*---

# 10. Data Quality Checks

***older:**

```text
data_quality_che*ks/
```

## Purpose

This screensh*t demonstrates the centralized dat* quality monitoring view implement*d in the MONITORING schema.

The f*amework validates completeness, un*queness, relationship integrity, a*cepted channel values, warranty da*e validity, and operational readin*ss.

## Recommended Query

```sql
*ELECT
    TEST_NAME,
    TABLE_NAM*,
    STATUS,
    METRIC_VALUE,
  * TEST_EXECUTED_AT
FROM MONITORING.*ATA_QUALITY_RESULTS
ORDER BY
    S*ATUS,
    TEST_NAME;
```

## Check* Included

```text
Row Count Check*
Primary Key Null Checks
Duplicate*Checks
Relationship Integrity Chec*s
Valid Channel Checks
Warranty Da*e Validity Checks
Service Request *elationship Checks
Repair Event Re*ationship Checks
Case Closure Rela*ionship Checks
```

## Business Va*ue

This screenshot proves that th* platform includes a reusable data*quality framework that validates d*ta before it is consumed by marts *nd business analytics queries.

--*

# 11. Incremental Load Logic

*****der:**

```text
incremental_load*logic/
```

## Purpose

This folde* contains screenshots proving that*the platform includes incremental *oad audit tracking and pipeline he*lth monitoring.

---

## Increment*l Load Audit

### Recommended Quer*

```sql
SELECT
    AUDIT_ID,
    *OURCE_TABLE_NAME,
    SOURCE_FILE_*AME,
    BATCH_ID,
    RECORDS_PRO*ESSED,
    LOAD_STATUS,
    LOAD_S*ARTED_AT,
    LOAD_COMPLETED_AT
FR*M MONITORING.INCREMENTAL_LOAD_AUDI*
ORDER BY SOURCE_TABLE_NAME;
```

*## Metrics Displayed

```text
AUDI*_ID
SOURCE_TABLE_NAME
SOURCE_FILE_*AME
BATCH_ID
RECORDS_PROCESSED
LOA*_STATUS
LOAD_STARTED_AT
LOAD_COMPL*TED_AT
```

### Business Value

Th*s screenshot proves that the frame*ork tracks source file loads, RAW *able record counts, batch IDs, loa* status, and ingestion timestamps.*
---

## Pipeline Health Checks

#*# Recommended Query

```sql
SELECT**
FROM MONITORING.PIPELINE_HEALTH_*HECKS;
```

### Metrics Displayed
*```text
PIPELINE_NAME
TOTAL_LOADS
*UCCESSFUL_LOADS
FAILED_LOADS
TOTAL*RECORDS_PROCESSED
LAST_LOAD_COMPLE*ED_AT
TOTAL_QUALITY_CHECKS
PASSED_*UALITY_CHECKS
FAILED_QUALITY_CHECK*
LAST_QUALITY_CHECK_AT
PIPELINE_HE*LTH_STATUS
HEALTH_CHECK_EXECUTED_A*
```

### Expected Output

```text*PIPELINE_HEALTH_STATUS = HEALTHY
`*`

### Business Value

This screen*hot proves that the platform conso*idates load audit results and data*quality results into a single pipe*ine health status for operational *onitoring.

---

# Screenshot Summ*ry

The screenshots in this folder*collectively demonstrate the imple*entation of:

```text
Fivetran Sou*ce Connector Setup
Snowflake Layer*d Database Architecture
Raw JSON I*gestion
Staging Transformations
In*ermediate Lifecycle Modeling
Busin*ss-Ready Marts
Warranty Utilizatio* Analytics
Repair Turnaround Analytics
SLA Adherence Analytics
Channel and Region Performance Analytics
Product Issue Trend Analysis
Data Quality Monitoring
Incremental Load Audit Tracking
Pipeline Health Monitoring
```

Together, these screenshots provide visual proof that the Warranty Service Request Repair Lifecycle Analytics Platform was implemented as an end-to-end analytics solution covering ingestion design, Snowflake transformation layers, business analytics marts, and monitoring frameworks.
