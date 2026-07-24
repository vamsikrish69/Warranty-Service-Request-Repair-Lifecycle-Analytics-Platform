/*
Business Question:
Whe*e are escalations happening most f*equently across channels, regions,*issue categories, and priorities?
*Purpose:
This query identifies esc*lation-heavy operational areas and*helps support leaders
find bottlen*cks in the service request lifecyc*e.
*/

SELECT
    CONTACT_CHANNEL,*    REGION,
    COUNTRY,
    ISSUE*CATEGORY,
    PRIORITY,

    COUNT*DISTINCT SERVICE_REQUEST_ID) AS TO*AL_SERVICE_REQUESTS,

    COUNT(
 *      CASE
            WHEN ESCALA*ION_FLAG = TRUE
            THEN S*RVICE_REQUEST_ID
        END
    )*AS ESCALATED_SERVICE_REQUESTS,

    ROUND(
        COUNT(
            CASE
                WHEN ESCALATION_FLAG = TRUE
                THEN SERVICE_REQUEST_ID
            END
        ) * 100.0 / NULLIF(COUNT(DISTINCT SERVICE_REQUEST_ID), 0),
        2
    ) AS ESCALATION_RATE,

    ROUND(
        AVG(TOTAL_LIFECYCLE_HOURS),
        2
    ) AS AVG_LIFECYCLE_HOURS

FROM MARTS.MART_SERVICE_REQUEST_LIFECYCLE

WHERE SERVICE_REQUEST_ID IS NOT NULL

GROUP BY
    CONTACT_CHANNEL,
    REGION,
    COUNTRY,
    ISSUE_CATEGORY,
    PRIORITY

ORDER BY
    ESCALATION_RATE DESC,
    ESCALATED_SERVICE_REQUESTS DESC;
