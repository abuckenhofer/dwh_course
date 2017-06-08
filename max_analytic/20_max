-- author      =     Andreas Buckenhofer 
-- description =     Code to retrieve latest rows from a table containing 
--                   a valid from date but no valid to date

---------------------------------
-- 01
---------------------------------
SELECT s.*
FROM   S_CUSTOMER s
JOIN (SELECT i.customer_key,
             max(i.valid_from) as max_valid_from
      FROM S_CUSTOMER i
      GROUP BY i.customer_key) b
ON s.customer_key = b.customer_key 
AND s.valid_from = b.max_valid_from;
---------------------------------

---------------------------------
-- 02
---------------------------------
SELECT s.*
FROM   S_CUSTOMER s
WHERE NOT EXISTS (SELECT 1
                  FROM   S_CUSTOMER i
                  WHERE  s.customer_key = i.customer_key
                  AND    s.valid_from < i.valid_from);
                  
SELECT s.*
FROM   S_CUSTOMER s
WHERE  s.valid_from = (SELECT MAX(i.valid_from)
                       FROM S_CUSTOMER i
                       WHERE s.customer_key = i.customer_key);                  
---------------------------------

---------------------------------
-- 03
---------------------------------
SELECT *
FROM  (SELECT coalesce ((SELECT min (i.valid_from)
                         FROM   S_CUSTOMER i
                         WHERE  s.customer_key = i.customer_key
                         AND    s.valid_from < i.valid_from
                           ), to_date ('31.12.9999', 'DD.MM.YYYY')) as end_ts,
               s.*
       FROM S_CUSTOMER s)
WHERE end_ts = to_date ('31.12.9999', 'DD.MM.YYYY');
---------------------------------
                       
---------------------------------
-- 04
---------------------------------
WITH max_cust as (
   SELECT i.customer_key,
          max(i.valid_from) as max_valid_from
   FROM S_CUSTOMER i
   GROUP BY i.customer_key)
SELECT s.*
FROM   S_CUSTOMER s
JOIN   max_cust b ON s.customer_key = b.customer_key
                  AND s.valid_from = b.max_valid_from;
---------------------------------

