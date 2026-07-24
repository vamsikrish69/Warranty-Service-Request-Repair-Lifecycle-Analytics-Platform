# Architecture

## Overview

The Warranty Service Request Repair Lifecycle Analytics Platform is an end-to-end analytics solution designed to track customer support interactions from initial contact through warranty validation, service request creation, repair fulfillment, and final case closure.

The platform follows a modern layered data warehouse architecture using Fivetran-style JSON ingestion and Snowflake-based transformations.

## Architecture Flow

```text
Raw JSON Source Files
        ↓
Fivetran-Style Ingestion
        ↓
RAW Schema
        ↓
STAGING Schema
        ↓
INTERMEDIATE Schema
        ↓
MARTS Schema
        ↓
Analytics & Reporting
```

## Source Systems

The platform simulates customer support and warranty management systems generating data from:

- Voice Support
- Chat Support
- Social Media Support
- Warranty Systems
- Repair Management Systems
- Case Management Systems

## Snowflake Schemas

### RAW

Stores source JSON records without modification.

### STAGING

Standardizes and flattens JSON structures into relational datasets.

### INTERMEDIATE

Integrates customer contacts, warranty records, service requests, repair events, and case closures into lifecycle models.

### MARTS

Contains business-ready datasets optimized for reporting and analytics.

### ANALYTICS

Stores operational and business analysis queries.

### MONITORING

Tracks pipeline health, data quality, and incremental load execution.

## Key Business Processes

- Customer Contact Lifecycle
- Warranty Validation
- Service Request Management
- Repair Fulfillment Tracking
- Case Resolution Monitoring
- SLA Performance Measurement
- Warranty Utilization Analysis
- Escalation Tracking
- Repeat Service Request Detection

## Technical Features

- Semi-Structured JSON Processing
- Snowflake VARIANT Data Type
- Incremental Processing Framework
- Data Quality Validation Layer
- Pipeline Health Monitoring
- Lifecycle Analytics
- Advanced SQL Transformations
