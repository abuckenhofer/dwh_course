-- author      =     Andreas Buckenhofer 
-- description =     Code to retrieve latest rows from a table containing 
--                   a valid from date but no valid to date

---------------------------------   
-- 01
---------------------------------   
WITH lead_cust as (
   SELECT lead (s.valid_from, 1) OVER (PARTITION BY s.customer_key 
                      ORDER BY s.valid_from ASC) as end_ts
         , s.*
   FROM s_customer s)               
SELECT * 
FROM   lead_cust b
WHERE  b.end_ts IS NULL;
---------------------------------                     

---------------------------------   
-- 02
---------------------------------   
WITH lead_cust as (
   SELECT row_number() OVER(PARTITION BY s.customer_key
              ORDER BY s.valid_from DESC) as rn
         , s.*
   FROM s_customer s)               
SELECT * 
FROM   lead_cust b
WHERE  b.rn = 1;                
---------------------------------  
