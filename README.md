# Warranty Service Request Repair Lifecycle Analytics Platform

## Project Overview

The Warranty Service Request Repair Lifecycle Analytics Platform is an end-to-end analytics solution designed to track customer support requests from initial customer contact through warranty validation, service request creation, repair fulfillment, and final case closure.

The platform simulates a modern ELT architecture using JSON source data, Snowflake data warehousing, SQL-based transformation layers, business marts, operational monitoring, and lifecycle analytics models.

The solution integrates customer contacts, product assets, warranty entitlements, service requests, repair events, and case closure records into a unified analytical framework that supports operational reporting, warranty utilization analysis, repair efficiency tracking, SLA monitoring, escalation analysis, and product issue trend analysis.

---

# Business Problem

Customer support organizations generate large volumes of operational data across multiple systems including support channels, warranty systems, repair operations, and service management platforms.

Without a centralized analytics platform, it becomes difficult to answer important business questions such as:

- Which support channels generate the highest number of service requests?
- How efficiently are repairs being completed?
- Are service requests meeting SLA targets?
- Which products generate recurring support issues?
- How effectively are warranty entitlements being utilized?
- What operational bottlenecks exist across the service lifecycle?
- Which request types generate the highest escalation rates?
- How frequently do customers generate repeat service requests?

This platform addresses these challenges by providing a complete lifecycle analytics solution that spans the entire customer support journey.

---

# Solution Architecture

## High-Level Data Flow

```text
Google Drive JSON Files
           │
           ▼
Fivetran-Style Ingestion Architecture
           │
           ▼
Snowflake RAW Layer
           │
           ▼
Snowflake STAGING Layer
           │
           ▼
Snowflake INTERMEDIATE Layer
           │
           ▼
Snowflake MARTS Layer
           │
           ▼
Analytics Layer
           │
           ▼
Monitoring Layer
```

---

# Technology Stack

## Data Ingestion

- Google Drive JSON Files
- Fivetran-Style ELT Architecture
- Snowflake Internal Stage

## Data Warehouse

- Snowflake

## Data Transformation

- SQL
- Snowflake Views
- Window Functions
- Lifecycle Modeling
- Business KPI Aggregations

## Monitoring

- Data Quality Framework
- Incremental Load Auditing
- Pipeline Health Monitoring

## Documentation

- GitHub
- README Documentation
- Architecture Documentation
- Implementation Screenshots

---

# Supported Support Channels

The platform supports customer support interactions received through:

- Voice Support
- Chat Support
- Facebook Support
- Social Media Support

---

# Supported Regions

## North America

- United States
- Canada

## United Kingdom

- United Kingdom

## India

- India

---

# Warranty Coverage Models

## Mail-In Warranty

Customers ship devices to repair centers where diagnosis and repair activities are performed.

Examples:

- 1 Year Mail-In Warranty

## Onsite Warranty

Technician visits are performed at customer locations.

Examples:

- 1 Year Onsite Warranty
- 2 Year Onsite Warranty
- 3 Year Onsite Warranty

---

# Supported Issue Categories

- NO_POWER
- NO_POST
- NO_VIDEO
- NO_BOOT
- OSRI
- WINDOWS_ISSUE
- HARDWARE_FAILURE
- BATTERY_ISSUE
- DISPLAY_ISSUE
- KEYBOARD_TOUCHPAD_ISSUE
- NETWORK_ISSUE
- OTHER

---

# Source Datasets

## Customers

```text
customers.json
```

Stores customer profile information.

## Product Assets

```text
product_assets.json
```

Stores customer-owned product and asset information.

## Customer Contacts

```text
customer_contacts.json
```

Stores customer support interactions.

## Warranty Entitlements

```text
warranty_entitlements.json
```

Stores warranty coverage and entitlement information.

## Service Requests

```text
service_requests.json
```

Stores support-generated service requests.

## Repair Events

```text
repair_events.json
```

Stores repair execution and fulfillment information.

## Case Closures

```text
case_closures.json
```

Stores final support case outcomes and closure details.

---

# Snowflake Data Architecture

## RAW Layer

Purpose:

Stores semi-structured JSON source records exactly as received.

### RAW Tables

- CUSTOMERS_RAW
- PRODUCT_ASSETS_RAW
- CUSTOMER_CONTACTS_RAW
- WARRANTY_ENTITLEMENTS_RAW
- SERVICE_REQUESTS_RAW
- REPAIR_EVENTS_RAW
- CASE_CLOSURES_RAW

---

## STAGING Layer

Purpose:

Extracts fields from JSON records and converts them into structured relational datasets.

### Staging Views

- STG_CUSTOMERS
- STG_PRODUCT_ASSETS
- STG_CUSTOMER_CONTACTS
- STG_WARRANTY_ENTITLEMENTS
- STG_SERVICE_REQUESTS
- STG_REPAIR_EVENTS
- STG_CASE_CLOSURES

---

## INTERMEDIATE Layer

Purpose:

Builds integrated lifecycle models connecting contacts, service requests, warranty records, repairs, and case closures.

### Intermediate Models

- INT_CONTACT_SERVICE_LIFECYCLE
- INT_WARRANTY_VALIDATION
- INT_REPAIR_FULFILLMENT
- INT_CASE_RESOLUTION
- INT_REPEAT_SERVICE_REQUESTS

---

## MARTS Layer

Purpose:

Provides business-ready analytical datasets optimized for reporting and KPI measurement.

### Business Marts

- MART_SERVICE_REQUEST_LIFECYCLE
- MART_REPAIR_TURNAROUND_PERFORMANCE
- MART_WARRANTY_UTILIZATION
- MART_SLA_ADHERENCE
- MART_CHANNEL_REGION_PERFORMANCE
- MART_PRODUCT_ISSUE_TRENDS

---

# Lifecycle Analytics Model

The platform tracks the complete customer service journey.

```text
Customer Contact
        │
        ▼
Troubleshooting
        │
        ▼
Warranty Validation
        │
        ▼
Service Request Creation
        │
        ▼
Repair Fulfillment
        │
        ▼
Case Resolution
        │
        ▼
Case Closure
```

---

# Analytics Layer

The project includes business-focused analytics for:

## Service Lifecycle Analysis

- Service request volume
- Resolution rates
- Lifecycle duration analysis

## Repair Turnaround Analysis

- Repair completion rates
- Part delay analysis
- Repair turnaround performance

## Warranty Utilization Analysis

- Active warranty utilization
- Expired warranty contacts
- Mail-in vs onsite service usage

## SLA Adherence Analysis

- SLA compliance tracking
- SLA breach analysis
- Priority-based performance monitoring

## Channel and Region Performance

- Contact channel performance
- Regional support trends
- Escalation analysis

## Product Issue Trend Analysis

- Product reliability trends
- Repeat issue analysis
- High-volume issue category identification

---

# Monitoring Layer

The project implements operational monitoring through:

## Data Quality Framework

Validates:

- Row counts
- Primary key completeness
- Duplicate records
- Relationship integrity
- Warranty date validity
- Channel value validation

## Incremental Load Audit

Tracks:

- Source file loads
- Batch processing history
- Records processed
- Load timestamps
- Load status

## Pipeline Health Monitoring

Provides centralized monitoring of:

- Load success rates
- Data quality status
- Record processing volumes
- Overall pipeline health

---

# Project Screenshots

Implementation screenshots are available under:

```text
/screenshots
```

Screenshot categories include:

- Fivetran Source Connector Setup
- Snowflake Database Architecture
- Staging Model Outputs
- Lifecycle Mart Outputs
- Repair Turnaround Analysis
- Warranty Utilization Analysis
- SLA Adherence Analysis
- Channel and Region Performance Analysis
- Product Issue Trend Analysis
- Data Quality Checks
- Incremental Load Audit
- Pipeline Health Monitoring

---

# Key Business Outcomes

The platform enables organizations to:

- Improve repair turnaround performance
- Monitor SLA compliance
- Analyze warranty utilization effectiveness
- Identify recurring product issues
- Track service request lifecycle performance
- Reduce operational bottlenecks
- Measure support channel effectiveness
- Monitor data quality and pipeline reliability

---
