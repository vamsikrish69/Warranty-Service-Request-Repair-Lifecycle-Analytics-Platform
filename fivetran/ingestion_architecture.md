# Ingestion Architecture

```text
Voice Support
Chat Support
Social Media Support
Warranty Systems
Repair Systems
Case Management Systems
```

↓

```text
Fivetran Connectors
```

↓

```text
Snowflake RAW Schema
```

↓

```text
STAGING
```

↓

```text
INTERMEDIATE
```

↓

```text
MARTS
```

↓

```text
Business Reporting
```

## Ingestion Strategy

The platform uses a Fivetran-style ELT pattern where operational source data is loaded into Snowflake before transformations are executed.

All source records are initially stored as semi-structured JSON data using Snowflake VARIANT columns.
