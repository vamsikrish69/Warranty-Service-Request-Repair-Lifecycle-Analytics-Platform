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
TOTAL_SERVICE_REQUESTS
FIRST_CONTACT_RESOLUTIONS_CONTACT_CONVERTED_TO_SERVICE
ESCLATED_SERVICE_REQUESTS
RESOLVED_SERVICE_REQUESTS
REOPENED_SERVICE_REQUESTS
CONTACT_TO_SERVICE_CONVERSION_RATE
FIRST_CONTACT_RESOLUTION_RATE
ESCALATION_RATE
REOPEN_RATE
AVG_LIFECYCLE_HOURS
*``

## Business Value

this screenshot proves that the platform enables support performance analysis across voice, chat, social media, regions, and countries.

---

# *. Product Issue Trends

**Folder:**

```text
product_issue_trends/
``*

## Business Question

Which prodUct models and issue categories generate the highest support and repair demand?

## Purpose

This screensHot demonstrates product issue trenD analysis using issue counts, servCce request conversion, repeat requests, escalation rates, and ranking_logic.

## Recommended Query

```s*l
SELECT *
FROM MARTS.MART_PRODUCT_ISSUE_TRENDS
ORDER BY
    PRODUCT_LINE,
    PRODUCT_MODEL,
    ISSUE_RANK
LIMIT 50;
```

## Metrics Displayed

```text
PRODUCT_LINE
PRODUCT_MODEL
ISSUE_CATEGORY
TOTAL_ISSUE_CONTACTS
TOTAL_SERVICE_REQUESTS
REPEAT_SERVICE_REQUESTS
ESCALATED_SERVICE_REQUESTS
ISSUE_RANK
ISSUE_TO_SERVICE_REQUEST_RATE
REPEAT_SERVICE_REQUEST_RATE
ESCALATION_RATE
```

## Business Value

This screenshot proVes that the platform can identify Recurring product issues, high-volume support categories, and product Models with higher service demand.
*---

# 10. Data Quality Checks

***Folder:**

```text
data_quality_che*ks/
```

## Purpose

This screenshot demonstrates the centralized data quality monitoring view implemented in the MONITORING schema.

The framework validates completeness, uniqueness, relationship integrity, accepted channel values, warranty date validity, and operational readiness.

## Recommended Query

```sql
SELECT
    TEST_NAME,
    TABLE_NAME,
    STATUS,
    METRIC_VALUE,
   TEST_EXECUTED_AT
FROM MONITORING.DATA_QUALITY_RESULTS
ORDER BY
    STATUS,
    TEST_NAME;
```

## Checks Included

```text
Row Count Checks
Primary Key Null Checks
Duplicate Checks
Relationship Integrity Checss
Valid Channel Checks
Warranty Date Validity Checks
Service Request relationship Checks
Repair Event Relationship Checks
Case Closure Relationship Checks
```

## Business Va*ue

This screenshot proves that the platform includes a reusable data quality framework that validates data before it is consumed by marts and business analytics queries.

--*

# 11. Incremental Load Logic

**folder:**

```text
incremental_load_logic/
```

## Purpose

This folder contains screenshots proving that the platform includes incremental Load audit tracking and pipeline heAlth monitoring.

---

## Incremental Load Audit

### Recommended Query

```sql
SELECT
    AUDIT_ID,
    sOURCE_TABLE_NAME,
    SOURCE_FILE_NAME,
    BATCH_ID,
    RECORDS_PROCESSED,
    LOAD_STATUS,
    LOAD_StARTED_AT,
    LOAD_COMPLETED_AT
FROM MONITORING.INCREMENTAL_LOAD_AUDIT
ORDER BY SOURCE_TABLE_NAME;
```

*## Metrics Displayed

```text
AUDIT_ID
SOURCE_TABLE_NAME
SOURCE_FILE_nAME
BATCH_ID
RECORDS_PROCESSED
LOAD_STATUS
LOAD_STARTED_AT
LOAD_COMPLeTED_AT
```

### Business Value

Ths screenshot proves that the frameWork tracks source file loads, RAW record counts, batch IDs, load status, and ingestion timestamps.
---

## Pipeline Health Checks

## Recommended Query

```sqL
SELECT*
FROM MONITORING.PIPELINE_HEALTH_CHECKS;
```

### Metrics Displayed
*```text
PIPELINE_NAME
TOTAL_LOADS
SUCCESSFUL_LOADS
FAILED_LOADS
TOTAL_RECORDS_PROCESSED
LAST_LOAD_COMPLETED_AT
TOTAL_QUALITY_CHECKS
PASSED_QUALITY_CHECKS
FAILED_QUALITY_CHECKS
LAST_QUALITY_CHECK_AT
PIPELINE_HEALTH_STATUS
HEALTH_CHECK_EXECUTED_AT
```

### Expected Output

```text*PIPELINE_HEALTH_STATUS = HEALTHY
`*`

### Business Value

This screenShot proves that the platform consoLidates load audit results and data_quality results into a single pipeLine health status for operational Monitoring.

---

# Screenshot SummAry

The screenshots in this folder collectively demonstrate the implementation of:

```text
Fivetran Source Connector Setup
Snowflake Layered Database Architecture
Raw JSON Ingestion
Staging Transformations
Intermediate Lifecycle Modeling
Business-Ready Marts
Warranty Utilization Analytics
Repair Turnaround Analytics
SLA Adherence Analytics
Channel and Region Performance Analytics
Product Issue Trend Analysis
Data Quality Monitoring
Incremental Load Audit Tracking
Pipeline Health Monitoring
```

Together, these screenshots provide visual proof that the Warranty Service Request Repair Lifecycle Analytics Platform was implemented as an end-to-end analytics solution covering ingestion design, Snowflake transformation layers, business analytics marts, and monitoring frameworks.
