INSERT INTO H_BOOKING (H_BOOKING_KEY, LOADDATE, RECORD_SOURCE, BOOKING_ID)
SELECT DISTINCT standard_hash(f.BOOKING_HAL_ID, 'MD5')
     , current_date
     , 'Flinkster'
     , f.BOOKING_HAL_ID
FROM   STG_BOOKING_CARSHARING f
WHERE  f.BOOKING_HAL_ID NOT in (SELECT BOOKING_ID FROM H_BOOKING);

INSERT INTO H_CUSTOMER (H_CUSTOMER_KEY, LOADDATE, RECORD_SOURCE, CUSTOMER_ID)
SELECT DISTINCT standard_hash(f.CUSTOMER_ID, 'MD5')
     , current_date
     , 'CRM'
     , f.CUSTOMER_ID
FROM   STG_CUSTOMER f
WHERE  f.CUSTOMER_ID NOT in (SELECT CUSTOMER_ID FROM H_CUSTOMER);

INSERT INTO H_RENTAL_ZONE (H_RENTAL_ZONE_KEY, LOADDATE, RECORD_SOURCE, RENTAL_ZONE_ID, RENTAL_ZONE_SRC)
SELECT DISTINCT standard_hash(f.RENTAL_ZONE_HAL_ID || '#' || f.RENTAL_ZONE_HAL_SRC, 'MD5')
     , current_date
     , 'Flinkster'
     , f.RENTAL_ZONE_HAL_ID
     , f.RENTAL_ZONE_HAL_SRC
FROM   STG_RENTAL_ZONE_CARSHARING f
WHERE  (f.RENTAL_ZONE_HAL_ID, f.RENTAL_ZONE_HAL_SRC) NOT in (SELECT RENTAL_ZONE_ID, RENTAL_ZONE_SRC FROM H_RENTAL_ZONE);

INSERT INTO H_VEHICLE (H_VEHICLE_KEY, LOADDATE, RECORD_SOURCE, VIN)
SELECT DISTINCT standard_hash(f.VIN, 'MD5')
     , current_date
     , 'Flinkster'
     , f.VIN
FROM   STG_VEHICLE_CARSHARING f
WHERE  f.VIN NOT in (SELECT VIN FROM H_VEHICLE);
