-- INSERT into Link 
INSERT INTO L_BOOKING (L_BOOKING_KEY, H_RENTAL_ZONE_KEY_START, H_RENTAL_ZONE_KEY_END, H_VEHICLE_KEY, H_CUSTOMER_KEY, H_BOOKING_KEY, LOAD_DATE, RECORD_SOURCE)
SELECT DISTINCT standard_hash(f.START_RENTAL_ZONE_HAL_ID || '#' || f.RENTAL_ZONE_HAL_SRC || '#' || 
                              f.END_RENTAL_ZONE_HAL_ID   || '#' || f.RENTAL_ZONE_HAL_SRC || '#' || 
                              v.VIN || '#' || 
                              f.CUSTOMER_HAL_ID || '#' || 
							  f.BOOKING_HAL_ID, 'MD5')
     , standard_hash(f.START_RENTAL_ZONE_HAL_ID || '#' || f.RENTAL_ZONE_HAL_SRC, 'MD5')
     , standard_hash(f.END_RENTAL_ZONE_HAL_ID   || '#' || f.RENTAL_ZONE_HAL_SRC, 'MD5')
     , standard_hash(v.VIN, 'MD5')
     , standard_hash(f.CUSTOMER_HAL_ID, 'MD5')
     , standard_hash(f.BOOKING_HAL_ID, 'MD5')
     , current_date
     , 'Flinkster'
FROM   STG_BOOKING_CARSHARING f JOIN STG_VEHICLE_CARSHARING v ON f.VEHICLE_HAL_ID = v.VEHICLE_HAL_ID
WHERE  (standard_hash(f.START_RENTAL_ZONE_HAL_ID || '#' || f.RENTAL_ZONE_HAL_SRC, 'MD5')
     , standard_hash(f.END_RENTAL_ZONE_HAL_ID   || '#' || f.RENTAL_ZONE_HAL_SRC, 'MD5')
     , standard_hash(v.VIN, 'MD5')
     , standard_hash(f.CUSTOMER_HAL_ID, 'MD5')
     , standard_hash(f.BOOKING_HAL_ID, 'MD5')) NOT in (SELECT H_RENTAL_ZONE_KEY_START, H_RENTAL_ZONE_KEY_END, H_VEHICLE_KEY, H_CUSTOMER_KEY, H_BOOKING_KEY FROM L_BOOKING v);
