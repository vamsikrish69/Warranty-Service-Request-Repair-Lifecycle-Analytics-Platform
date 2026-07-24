/*
Business Qu*stion:
Which customers or assets a*e generating repeat service reques*s?

Purpose:
This query helps iden*ify recurring product issues, inef*ective resolutions,
and repeated s*rvice demand within the customer s*pport lifecycle.
*/

SELECT
    CU*TOMER_ID,
    ASSET_ID,

    COUNT*DISTINCT SERVICE_REQUEST_ID) AS TO*AL_SERVICE_REQUESTS,

    COUNT(
 *      CASE
            WHEN REPEAT*REQUEST_FLAG = TRUE
            TH*N SERVICE_REQUEST_ID
        END
 *  ) AS REPEAT_SERVICE_REQUESTS,

 *  ROUND(
        COUNT(
          * CASE
                WHEN REPEAT_*EQUEST_FLAG = TRUE
               *THEN SERVICE_REQUEST_ID
          * END
        ) * 100.0 / NULLIF(CO*NT(DISTINCT SERVICE_REQUEST_ID), 0*,
        2
    ) AS REPEAT_REQUES*_RATE,

    MIN(SERVICE_CREATED_AT* AS FIRST_SERVICE_REQUEST_DATE,
  * MAX(SERVICE_CREATED_AT) AS LATEST*SERVICE_REQUEST_DATE

FROM INTERME*IATE.INT_REPEAT_SERVICE_REQUESTS

*ROUP BY
    CUSTOMER_ID,
    ASSET*ID

HAVING
    COUNT(DISTINCT SERV*CE_REQUEST_ID) > 1

ORDER BY
    R*PEAT_SERVICE_REQUESTS DESC,
    TO*AL_SERVICE_REQUESTS DESC;
