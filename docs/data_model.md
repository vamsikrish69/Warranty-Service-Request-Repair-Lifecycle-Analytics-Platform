# Data Model

## Overview

The platform integrates multiple operational datasets into a unified service lifecycle analytics model.

## Core Source Entities

### Customers

Stores customer profile information.

```text
CUSTOMER_ID
CUSTOMER_NAME
CUSTOMER_TYPE
EMAIL
PHONE
REGION
COUNTRY
CITY
```

### Product Assets

Stores product ownership and asset information.

```text
ASSET_ID
CUSTOMER_ID
SERVICE_TAG
PRODUCT_LINE
PRODUCT_MODEL
PURCHASE_DATE
SHIP_DATE
```

### Customer Contacts

Stores customer support interactions.

```text
CONTACT_ID
CUSTOMER_ID
ASSET_ID
CONTACT_CHANNEL
CONTACT_TIMESTAMP
ISSUE_CATEGORY
ISSUE_DESCRIPTION
AGENT_ID
```

### Warranty Entitlements

Stores warranty coverage information.

```text
WARRANTY_ID
ASSET_ID
CUSTOMER_ID
WARRANTY_TYPE
ENTITLEMENT_LEVEL
WARRANTY_STATUS
```

### Service Requests

Stores service request records.

```text
SERVICE_REQUEST_ID
CONTACT_ID
CUSTOMER_ID
ASSET_ID
SERVICE_TYPE
SERVICE_STATUS
PRIORITY
```

### Repair Events

Stores repair execution details.

```text
REPAIR_EVENT_ID
SERVICE_REQUEST_ID
REPAIR_TYPE
REPAIR_STATUS
REPAIR_OUTCOME
```

### Case Closures

Stores case resolution information.

```text
CLOSURE_ID
SERVICE_REQUEST_ID
RESOLUTION_STATUS
CASE_CLOSED_AT
```

## Relationship Diagram

```text
CUSTOMERS
    |
    |
PRODUCT_ASSETS
    |
    |
CUSTOMER_CONTACTS
    |
    |
SERVICE_REQUESTS
    |
    |
REPAIR_EVENTS
    |
    |
CASE_CLOSURES

WARRANTY_ENTITLEMENTS
        |
        |
PRODUCT_ASSETS
```

## Primary Lifecycle Path

```text
Customer Contact
      ↓
Service Request
      ↓
Warranty Validation
      ↓
Repair Fulfillment
      ↓
Case Closure
```

This lifecycle serves as the foundation for all operational KPI reporting and business analytics.
