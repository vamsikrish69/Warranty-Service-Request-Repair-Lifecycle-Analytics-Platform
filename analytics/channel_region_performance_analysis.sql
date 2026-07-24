/*
Business Question:
How are support channels and regions performing across contact volume,
service conversion, resolution effectiveness, escalation rate, and reopen rate?

Purpose:
This query provides a business-ready view of support performance across
voice, chat, social, region, and country.
*/

SELECT
    CONTACT_CHANNEL,
    REGION,
    COUNTRY,

    TOTAL_CONTACTS,
    TOTAL_SERVICE_REQUESTS,
    FIRST_CONTACT_RESOLUTIONS,
    ESCALATED_SERVICE_REQUESTS,
    RESOLVED_SERVICE_REQUESTS,
    REOPENED_SERVICE_REQUESTS,

    CONTACT_TO_SERVICE_CONVERSION_RATE,
    FIRST_CONTACT_RESOLUTION_RATE,
    ESCALATION_RATE,
    REOPEN_RATE,
    AVG_LIFECYCLE_HOURS

FROM MARTS.MART_CHANNEL_REGION_PERFORMANCE

ORDER BY
    TOTAL_CONTACTS DESC,
    TOTAL_SERVICE_REQUESTS DESC;
