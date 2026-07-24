/*
Business Question:
Are onsite repairs completed faster than mail-in repairs?

Purpose:
This query compares repair turnaround performance across repair types and identifies
repair fulfillment efficiency patterns.
*/

SELECT
    REPAIR_TYPE,
    SERVICE_TYPE,

    SUM(TOTAL_REPAIR_EVENTS) AS TOTAL_REPAIR_EVENTS,
    SUM(COMPLETED_REPAIRS) AS COMPLETED_REPAIRS,

    ROUND(
        AVG(AVG_REPAIR_TURNAROUND_HOURS),
        2
    ) AS AVG_REPAIR_TURNAROUND_HOURS,

    ROUND(
        AVG(MEDIAN_REPAIR_TURNAROUND_HOURS),
        2
    ) AS MEDIAN_REPAIR_TURNAROUND_HOURS,

    ROUND(
        SUM(COMPLETED_REPAIRS) * 100.0
        / NULLIF(SUM(TOTAL_REPAIR_EVENTS), 0),
        2
    ) AS REPAIR_COMPLETION_RATE,

    ROUND(
        SUM(REPAIRS_WITH_PART_DELAY) * 100.0
        / NULLIF(SUM(TOTAL_REPAIR_EVENTS), 0),
        2
    ) AS PART_DELAY_RATE

FROM MARTS.MART_REPAIR_TURNAROUND_PERFORMANCE

GROUP BY
    REPAIR_TYPE,
    SERVICE_TYPE

ORDER BY
    AVG_REPAIR_TURNAROUND_HOURS DESC;
