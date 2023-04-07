-- 코드를 입력하세요
SELECT 
    C.CAR_ID,
    CASE WHEN A.CAR_ID IS NULL THEN '대여 가능' ELSE '대여중' END AS AVAILABILITY
FROM (SELECT DISTINCT CAR_ID 
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) AS C
LEFT OUTER JOIN 
    (SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE '2022-10-16' BETWEEN START_DATE AND END_DATE) AS A
ON C.CAR_ID = A.CAR_ID
ORDER BY C.CAR_ID DESC
