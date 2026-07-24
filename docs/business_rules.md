# Business Rules

## Customer Contact Rules

- Each customer contact is assigned a unique CONTACT_ID.
- Contacts may originate from Voice, Chat, Facebook, or Social Support channels.
- Multiple contacts may exist for the same customer and asset.

## Service Request Rules

- Service requests are created when troubleshooting fails to resolve an issue.
- Each service request must be linked to a customer contact.
- Service requests may be escalated based on severity or operational constraints.

## Warranty Rules

### Mail-In Warranty

Default warranty coverage provided at purchase.

```text
1 Year Mail-In Warranty
```

Customer ships the system to a repair center.

### Onsite Warranty

Optional warranty coverage.

```text
1 Year Onsite
2 Year Onsite
3 Year Onsite
```

A technician performs repairs at the customer location.

## Repair Rules

- Mail-In repairs are processed through repair centers.
- Onsite repairs are assigned to field technicians.
- Repair completion time is measured from repair start to repair completion.

## SLA Rules

SLA targets vary based on request priority.

```text
LOW       = 120 Hours
MEDIUM    = 96 Hours
HIGH      = 72 Hours
CRITICAL  = 48 Hours
```

## Repeat Request Rules

A service request is considered a repeat request when:

```text
Same Customer
AND
Same Asset
AND
Previous Service Request Exists
```

## Closure Rules

Cases may be closed with outcomes such as:

- Repair Completed
- Issue Resolved
- Customer Cancelled
- System Exchanged
- Out Of Warranty

## Data Quality Rules

The platform validates:

- Row Counts
- Null Values
- Duplicate Records
- Relationship Integrity
- Warranty Date Validity
- Channel Validity
- Service Request Relationships
