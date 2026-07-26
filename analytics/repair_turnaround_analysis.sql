/*
Business Question:
Are onsite repairs completed faster than mail-in repairs?

Purpose:
This query compares repair turnaround performance across repair types and identifies
repair fulfillment efficiency patterns.
*/

SELECT *
FROM MARTS.MART_REPAIR_TURNAROUND_PERFORMANCE
ORDER BY
    REPAIR_COMPLETION_RATE DESC;
