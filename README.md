# Warranty Service Request Repair Lifecycle Analytics Platform

## Project Overview

The Warranty Service Request Repair Lifecycle Analytics Platform is an end-to-end analytics solution designed to track customer support requests from initial customer contact through warranty validation, service request creation, repair fulfillment, and final case closure.

The platform simulates a Fivetran-style ELT architecture using semi-structured JSON source data, Snowflake data warehousing, and advanced SQL transformations to build business-ready analytical datasets.

The solution integrates customer contacts, product assets, warranty entitlements, service requests, repair events, and case closure records into a unified lifecycle model that supports operational reporting, service performance monitoring, warranty utilization analysis, repair efficiency tracking, SLA compliance measurement, and escalation analysis.

---

## Business Problem

Customer support organizations generate large volumes of operational data across multiple systems including support channels, warranty systems, repair operations, and service management platforms.

Without a centralized analytics platform, it becomes difficult to answer important business questions such as:

- Which support channels generate the highest number of service requests?
- How efficiently are repairs being completed?
- Are service requests meeting SLA targets?
- Which products generate recurring support issues?
- How effectively are warranty entitlements being utilized?
- What operational bottlenecks exist across the service lifecycle?
- Which request types generate the highest escalation rates?
- How frequently are customers contacting support for repeat issues?

This platform addresses these challenges by creating an integrated lifecycle analytics framework spanning the complete customer support journey.

---

## Architecture

### High-Level Data Flow

```text
Voice Support
Chat Support
Social Media Support
Warranty Systems
Repair Systems
Case Management Systems
            │
            ▼
Fivetran-Style Ingestion Layer
            │
            ▼
Raw JSON Source Data
            │
            ▼
Snowflake RAW Schema
            │
            ▼
Snowflake STAGING Schema
            │
            ▼
Snowflake INTERMEDIATE Schema
            │
            ▼
Snowflake MARTS Schema
            │
            ▼
Business Analytics & Reporting
```

---

## Technology Stack

### Data Ingestion

```text
Fivetran-Style ELT Architecture
JSON Source Files
```

### Data Warehouse

```text
Snowflake
```

### Data Processing

```text
SQL
Window Functions
Aggregations
Ranking Logic
Lifecycle Analytics
```

### Data Modeling

```text
RAW Layer
STAGING Layer
INTERMEDIATE Layer
MART Layer
```

### Monitoring

```text
Incremental Load Tracking
Data Quality Monitoring
Pipeline Health Monitoring
```

---

## Supported Support Channels

The platform supports customer interactions received through:

```text
Voice Support
Chat Support
Facebook Support
Social Media Support
```

---

## Supported Regions

The analytics platform supports multiple service regions including:

```text
North America
    ├── United States
    └── Canada

United Kingdom

India
```

---

## Warranty Coverage Models

### Mail-In Warranty

Default warranty coverage provided during purchase.

```text
1 Year Mail-In Warranty
```

Customers ship devices to a repair center where diagnosis and repair activities are performed.

### Onsite Warranty

Extended warranty options providing technician visits at customer locations.

```text
1 Year Onsite Warranty
2 Year Onsite Warranty
3 Year Onsite Warranty
```

---

## Supported Issue Categories

```text
NO_POWER
NO_POST
NO_VIDEO
NO_BOOT
OSRI
WINDOWS_ISSUE
HARDWARE_FAILURE
BATTERY_ISSUE
DISPLAY_ISSUE
KEYBOARD_TOUCHPAD_ISSUE
NETWORK_ISSUE
OTHER
```

---

## Source Datasets

### Customers

Stores customer profile information.

```text
customers.json
```

### Product Assets

Stores device ownership and asset information.

```text
product_assets.json
```

### Customer Contacts

Stores incoming support interactions.

```text
customer_contacts.json
```

### Warranty Entitlements

Stores warranty coverage details.

```text
warranty_entitlements.json
```

### Service Requests

Stores requests generated during support interactions.

```text
service_requests.json
```

### Repair Events

Stores repair execution activities.

```text
repair_events.json
```

### Case Closures

Stores final case resolution information.

```text
case_closures.json
```

---

## Snowflake Architecture

### RAW Schema

Purpose:

```text
Stores semi-structured JSON source records exactly as received.
```

### STAGING Schema

Purpose:

```text
Extracts and standardizes JSON fields into relational structures.
```

### INTERMEDIATE Schema

Purpose:

```text
Builds integrated lifecycle models connecting contacts,
service requests, warranty records, repairs, and closures.
```

### MARTS Schema

Purpose:

```text
Provides business-ready datasets optimized for reporting,
analytics, and KPI measurement.
```

### MONITORING Schema

Purpose:

```text
Tracks incremental loads,
data quality results,
and pipeline health metrics.
```

---

## Lifecycle Analytics Model

The core business model tracks the complete customer support journey.

```text
Customer Contact
        ↓
Troubleshooting
        ↓
Warranty Validation
        ↓
Service Request Creation
     
