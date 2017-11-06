-- load Mart layer 
-- initial load

delete from D_DATE;
delete from D_EXTRA_BOOKING_FEE;
delete from D_TRAVERSE_USE;
delete from D_CATEGORY;
delete from D_VEHICLE;
delete from D_RENTAL_ZONE;
delete from D_CUSTOMER;

insert into D_DATE (DATE_KEY, DAY, MONTH, YEAR)
with date_t as (
   select to_date('01.01.2013') + rownum - 1 as dt
   from dual  CONNECT BY ROWNUM < 731
)
select dt, extract(day from dt), extract(month from dt), extract(year from dt) from date_t;


insert into D_EXTRA_BOOKING_FEE (D_EXTRA_BOOKING_FEE_ID, COMPUTE_EXTRA_BOOKING_FEE)
values (1, 'Ja');
insert into D_EXTRA_BOOKING_FEE (D_EXTRA_BOOKING_FEE_ID, COMPUTE_EXTRA_BOOKING_FEE)
values (2, 'Nein');

insert into D_TRAVERSE_USE (D_TRAVERSE_USE_ID, TRAVERSE_USE)
values (1, 'Ja');
insert into D_TRAVERSE_USE (D_TRAVERSE_USE_ID, TRAVERSE_USE)
values (2, 'Nein');



INSERT INTO D_CATEGORY (D_CATEGORY_ID, CATEGORY, COMPANY, COMPANY_GROUP)
with max_t as (
   select rownum, category, company, company_group from r_category order by category_hal_id
)
select * from max_t;


INSERT INTO D_VEHICLE (D_VEHICLE_ID, VIN, VEHICLE_MODEL_TYPE, VEHICLE_MANUFACTURER_NAME, VEHICLE_MODEL_NAME, VEHICLE_TYPE_NAME, REGISTRATION_PLATE
                          , SERIAL_NUMBER, KW, FUEL_TYPE_NAME, OWNERSHIP_TYPE, CAPACITY_AMOUNT, ACCESS_CONTROL_COMPONENT_TYPE, COMPANY, COMPANY_GROUP)
with max_t as (
   SELECT row_number() OVER(PARTITION BY s.H_VEHICLE_KEY
              ORDER BY s.LOADDATE DESC) as rn
         , s.*
   FROM s_vehicle_flk s
)
select rownum, h.VIN, s.VEHICLE_MODEL_TYPE, s.VEHICLE_MANUFACTURER_NAME, s.VEHICLE_MODEL_NAME, s.VEHICLE_TYPE_NAME, s.REGISTRATION_PLATE
     , s.SERIAL_NUMBER, s.KW, s.FUEL_TYPE_NAME, s.OWNERSHIP_TYPE, s.CAPACITY_AMOUNT, s.ACCESS_CONTROL_COMPONENT_TYPE, s.COMPANY, s.COMPANY_GROUP
from max_t s JOIN h_vehicle h on s.H_VEHICLE_KEY= h.H_VEHICLE_KEY
WHERE  s.rn = 1;     



INSERT INTO D_CUSTOMER (D_CUSTOMER_ID, CUSTOMERID, FIRST_NAME, LAST_NAME, GENDER, BIRTHDAY, STREET, CITY, STATE, ZIP, CCNUMBER, EMAIL)
with max_t as (
   SELECT row_number() OVER(PARTITION BY s.H_CUSTOMER_KEY
              ORDER BY s.LOADDATE DESC) as rn
         , s.*
   FROM s_customer_crm s
)
select rownum, h.CUSTOMER_ID, s.FIRST_NAME, s.LAST_NAME, s.GENDER, s.BIRTHDAY, s.STREET, s.CITY, s.STATE, s.ZIP, s.CCNUMBER, s.EMAIL
from max_t s JOIN h_customer h on s.H_CUSTOMER_KEY= h.H_CUSTOMER_KEY
WHERE  s.rn = 1;     


INSERT INTO D_RENTAL_ZONE (D_RENTAL_ZONE_ID, RENTAL_ZONE_ID, RENTAL_ZONE_SRC, NAME, CODE, TYPE, CITY, COUNTRY, LATITUDE, LONGITUDE, POI_AIRPORT_X, POI_LONG_DISTANCE_TRAINS_X
                              , POI_SUBURBAN_TRAINS_X, POI_UNDERGROUND_X, ACTIVE_X, COMPANY, COMPANY_GROUP)
with max_t as (
   SELECT row_number() OVER(PARTITION BY s.H_RENTAL_ZONE_KEY
              ORDER BY s.LOADDATE DESC) as rn
         , s.*
   FROM s_rental_zone_flk s
)
select rownum, h.RENTAL_ZONE_ID, h.RENTAL_ZONE_SRC, s.NAME, s.CODE, s.TYPE, s.CITY, s.COUNTRY, s.LATITUDE, s.LONGITUDE, s.POI_AIRPORT_X, s.POI_LONG_DISTANCE_TRAINS_X
                              , s.POI_SUBURBAN_TRAINS_X, s.POI_UNDERGROUND_X, s.ACTIVE_X, s.COMPANY, s.COMPANY_GROUP
from max_t s JOIN h_rental_zone h on s.H_RENTAL_ZONE_KEY= h.H_RENTAL_ZONE_KEY
WHERE  s.rn = 1;     
    

