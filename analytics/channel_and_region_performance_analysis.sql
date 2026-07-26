/*
Business Question:
How are support channels and regions performing across contact volume,
service conversion, resolution effectiveness, escalation rate, and reopen rate?

Purpose:
This query provides a business-ready view of support performance across
voice, chat, social, region, and country.
*/

SELECT *
FROM MARTS.MART_CHANNEL_REGION_PERFORMANCE
ORDER BY
    TOTAL_CONTACTS DESC;
