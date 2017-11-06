-- initial load fact table
truncate table F_BOOKING;

insert into F_BOOKING (D_CATEGORY_ID, D_CUSTOMER_ID, D_VEHICLE_ID, D_RENTAL_ZONE_ID_FROM, D_RENTAL_ZONE_ID_TO, DATE_KEY_BOOKING
                      , DATE_KEY_FROM, DATE_KEY_UNTIL, TIME_ID_FROM, TIME_ID_UNTIL, D_EXTRA_BOOKING_FEE_ID, D_TRAVERSE_USE_ID, DISTANCE, COUNT)
select dr.d_category_id, dc.d_customer_id, dv.d_vehicle_id, db.D_RENTAL_ZONE_ID, de.D_RENTAL_ZONE_ID
     , trunc(to_date(DATE_BOOKING, 'YYYY-MM-DD HH24:MI:SS')), NULL, NULL, NULL, NULL, dx.D_EXTRA_BOOKING_FEE_ID, dy.D_TRAVERSE_USE_ID
     , DISTANCE, 1
from   s_booking_flk s 
JOIN l_booking l on s.h_booking_key = l.h_booking_key 
JOIN h_vehicle  hv on hv.h_vehicle_key  = l.h_vehicle_key    JOIN d_vehicle  dv on dv.vin = hv.vin
JOIN h_customer hc on hc.h_customer_key = l.h_customer_key   JOIN d_customer dc on dc.customerid= hc.customer_id

JOIN h_rental_zone hb on hb.h_rental_zone_key = l.H_RENTAL_ZONE_KEY_START JOIN d_rental_zone db on db.RENTAL_ZONE_ID= hb.RENTAL_ZONE_ID AND db.RENTAL_ZONE_SRC= hb.RENTAL_ZONE_SRC
JOIN h_rental_zone he on he.h_rental_zone_key = l.H_RENTAL_ZONE_KEY_END   JOIN d_rental_zone de on de.RENTAL_ZONE_ID= he.RENTAL_ZONE_ID AND de.RENTAL_ZONE_SRC= he.RENTAL_ZONE_SRC

JOIN r_category r  on r.category_hal_id = s.category_hal_id  JOIN d_category dr on dr.CATEGORY= r.CATEGORY

JOIN D_EXTRA_BOOKING_FEE dx on dx.COMPUTE_EXTRA_BOOKING_FEE= s.COMPUTE_EXTRA_BOOKING_FEE
JOIN D_TRAVERSE_USE dy on dy.TRAVERSE_USE= s.TRAVERSE_USE
;

