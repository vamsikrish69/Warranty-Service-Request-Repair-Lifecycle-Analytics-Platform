/*
Business Question:
Which product models and issue categories are creating the highest support demand?

Purpose:
This query identifies recurring product issues, high-volume issue categories,
and product models with higher service request conversion, repeat request,
or escalation rates.
*/

SELECT
    PRODUCT_LINE,
    PRODUCT_MODEL,
    ISSUE_CATEGORY,

    TOTAL_ISSUE_CONTACTS,
    TOTAL_SERVICE_REQUESTS,
    REPEAT_SERVICE_REQUESTS,
    ESCALATED_SERVICE_REQUESTS,

    ISSUE_RANK,

    ISSUE_TO_SERVICE_REQUEST_RATE,
    REPEAT_SERVICE_REQUEST_RATE,
    ESCALATION_RATE

FROM MARTS.MART_PRODUCT_ISSUE_TRENDS

ORDER BY
    PRODUCT_LINE,
    PRODUCT_MODEL,
    ISSUE_RANK;
