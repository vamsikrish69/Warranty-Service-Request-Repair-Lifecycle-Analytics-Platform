/*
Purpose:
This script creates a pipeline health summary view for the warranty service
request and repair lifecycle analytics platform.

Business Value:
The view provides a single operational summary showing whether source loads
completed successfully and whether the data quality checks passed.
*/

USE DATABASE WARRANTY_SERVICE_ANALYTICS_DB;
USE SCHEMA MONITORING;

CREATE OR REPLACE VIEW PIPELINE_HEALTH_CHECKS AS

WITH LOAD_HEALTH AS (

    SELECT
        COUNT(*) AS TOTAL_LOADS,

        COUNT(
            CASE
                WHEN LOAD_STATUS = 'SUCCESS'
                THEN 1
            END
        ) AS SUCCESSFUL_LOADS,

        COUNT(
            CASE
                WHEN LOAD_STATUS <> 'SUCCESS'
                THEN 1
            END
        ) AS FAILED_LOADS,

        SUM(RECORDS_PROCESSED) AS TOTAL_RECORDS_PROCESSED,

        MAX(LOAD_COMPLETED_AT) AS LAST_LOAD_COMPLETED_AT

    FROM MONITORING.INCREMENTAL_LOAD_AUDIT

),

QUALITY_HEALTH AS (

    SELECT
        COUNT(*) AS TOTAL_QUALITY_CHECKS,

        COUNT(
            CASE
                WHEN STATUS = 'PASS'
                THEN 1
            END
        ) AS PASSED_QUALITY_CHECKS,

        COUNT(
            CASE
                WHEN STATUS = 'FAIL'
                THEN 1
            END
        ) AS FAILED_QUALITY_CHECKS,

        MAX(TEST_EXECUTED_AT) AS LAST_QUALITY_CHECK_AT

    FROM MONITORING.DATA_QUALITY_RESULTS

)

SELECT
    'WARRANTY_SERVICE_REQUEST_REPAIR_LIFECYCLE_PIPELINE' AS PIPELINE_NAME,

    l.TOTAL_LOADS,
    l.SUCCESSFUL_LOADS,
    l.FAILED_LOADS,
    l.TOTAL_RECORDS_PROCESSED,
    l.LAST_LOAD_COMPLETED_AT,

    q.TOTAL_QUALITY_CHECKS,
    q.PASSED_QUALITY_CHECKS,
    q.FAILED_QUALITY_CHECKS,
    q.LAST_QUALITY_CHECK_AT,

    CASE
        WHEN l.FAILED_LOADS = 0
             AND q.FAILED_QUALITY_CHECKS = 0
        THEN 'HEALTHY'

        WHEN l.FAILED_LOADS = 0
             AND q.FAILED_QUALITY_CHECKS > 0
        THEN 'WARNING_DATA_QUALITY_ISSUES'

        WHEN l.FAILED_LOADS > 0
        THEN 'FAILED_LOAD_ISSUES'

        ELSE 'UNKNOWN'
    END AS PIPELINE_HEALTH_STATUS,

    CURRENT_TIMESTAMP AS HEALTH_CHECK_EXECUTED_AT

FROM LOAD_HEALTH l

CROSS JOIN QUALITY_HEALTH q;
