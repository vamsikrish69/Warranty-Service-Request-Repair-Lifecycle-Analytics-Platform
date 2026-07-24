/*
Business Question:
How many service requests are being created across support channels, regions, and issue categories?

Purpose:
This query helps operations teams understand service request demand patterns by channel,
region, country, and issue category.
*/

SELECT
    CONTACT_CHANNEL,
    REGION,
    COUNTRY,
    ISSUE_CATEGORY,

    COUNT(DISTINCT CONTACT_ID) AS TOTAL_CONTACTS,
    COUNT(DISTINCT SERVICE_REQUEST_ID) AS TOTAL_SERVICE_REQUESTS,

    ROUND(
        COUNT(DISTINCT SERVICE_REQUEST_ID) * 100.0
        / NULLIF(COUNT(DISTINCT CONTACT_ID), 0),
        2
    ) AS CONTACT_TO_SERVICE_CONVERSION_RATE

FROM MARTS.MART_SERVICE_REQUEST_LIFECYCLE

GROUP BY
    CONTACT_CHANNEL,
    REGION,
    COUNTRY,
    ISSUE_CATEGORY

ORDER BY
    TOTAL_SERVICE_REQUESTS DESC;
