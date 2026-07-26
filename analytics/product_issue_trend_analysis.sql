/*
Business Question:
Which product models and issue categories are creating the highest support demand?

Purpose:
This query identifies recurring product issues, high-volume issue categories,
and product models with higher service request conversion, repeat request,
or escalation rates.
*/

SELECT *
FROM MARTS.MART_PRODUCT_ISSUE_TRENDS
ORDER BY
    PRODUCT_LINE,
    PRODUCT_MODEL,
    ISSUE_RANK;
