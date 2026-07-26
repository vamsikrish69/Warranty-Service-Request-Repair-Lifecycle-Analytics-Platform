/*
Business Question:
What percentage of service requests are meeting SLA expectations?

Purpose:
This query tracks SLA adherence, SLA breaches, open or pending requests,
and average lifecycle time by priority and service type.
*/

SELECT
    PRIORITY,
    SLA_STATUS,

    COUNT(*) AS TOTAL_REQUESTS,

    ROUND(
        AVG(TOTAL_LIFECYCLE_HOURS),
        2
    ) AS AVG_LIFECYCLE_HOURS

FROM MARTS.MART_SLA_ADHERENCE

GROUP BY
    PRIORITY,
    SLA_STATUS

ORDER BY
    PRIORITY;
