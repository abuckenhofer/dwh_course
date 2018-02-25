-- Which 3 customers drove the longest distances?

SELECT c.last_name
     , SUM(b.distance) AS dist
FROM   stg_booking_carsharing b
JOIN   stg_customer c ON c.customer_id = b.customer_hal_id
GROUP BY c.customer_id, c.last_name
ORDER BY sum(b.distance) desc
FETCH FIRST 3 ROWS ONLY
;

/*

SELECT MAX(c.last_name)
     , SUM(b.distance) AS dist
FROM   stg_booking_carsharing b
JOIN   stg_customer c ON c.customer_id = b.customer_hal_id
GROUP BY c.customer_id
ORDER BY sum(b.distance) desc
FETCH FIRST 3 ROWS ONLY
;

*/

/*

WRONG !!!

SELECT c.last_name
     , SUM(b.distance) AS dist
FROM   stg_booking_carsharing b
JOIN   stg_customer c ON c.customer_id = b.customer_hal_id
GROUP BY c.last_name
ORDER BY sum(b.distance) desc
FETCH FIRST 3 ROWS ONLY
;

*/
