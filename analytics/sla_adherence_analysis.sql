/*
Business Question:
What percentage of service requests are meeting SLA expectations?

Purpose:
This query tracks SLA adherence, SLA breaches, open or pending requests,
and average lifecycle time by priority and service type.
*/

SELECT
    PRIORITY,
    SERVI*E_TYPE,
    SLA_STATUS,

    COUNT*DISTINCT SERVICE_REQUEST_ID) AS TO*AL_SERVICE_REQUESTS,

    COUNT(
 *      CASE
            WHEN SLA_ME*_FLAG = TRUE
            THEN SERV*CE_REQUEST_ID
        END
    ) AS*SLA_MET_REQUESTS,

    COUNT(
    *   CASE
            WHEN SLA_BREAC*ED_FLAG = TRUE
            THEN SE*VICE_REQUEST_ID
        END
    ) *S SLA_BREACHED_REQUESTS,

    ROUN*(
        COUNT(
            CASE
*               WHEN SLA_MET_FLAG =*TRUE
                THEN SERVICE_*EQUEST_ID
            END
        * * 100.0 / NULLIF(COUNT(DISTINCT S*RVICE_REQUEST_ID), 0),
        2
 *  ) AS SLA_ADHERENCE_RATE,

    RO*ND(
        AVG(TOTAL_LIFECYCLE_HO*RS),
        2
    ) AS AVG_TOTAL_*IFECYCLE_HOURS

FROM MARTS.MART_SL*_ADHERENCE

GROUP BY
    PRIORITY,*    SERVICE_TYPE,
    SLA_STATUS

*RDER BY
    SLA_BREACHED_REQUESTS *ESC,
    AVG_TOTAL_LIFECYCLE_HOURS*DESC;
