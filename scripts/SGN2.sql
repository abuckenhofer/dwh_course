-- check staging tables for missing FKs

select count(*) from stg_booking_carsharing where vehicle_hal_id not in (select vehicle_hal_id from STG_VEHICLE_CARSHARING);
select count(*) from stg_booking_carsharing where CATEGORY_HAL_ID not in (select CATEGORY_HAL_ID from STG_CATEGORY_CARSHARING);
select count(*) from stg_booking_carsharing where CUSTOMER_HAL_ID not in (select customer_ID from stg_customer);

select count(*) from stg_booking_carsharing 
     where (START_RENTAL_ZONE_HAL_ID, RENTAL_ZONE_HAL_SRC) not in (select RENTAL_ZONE_HAL_ID, RENTAL_ZONE_HAL_SRC from STG_RENTAL_ZONE_CARSHARING);
select count(*) from stg_booking_carsharing 
     where (end_RENTAL_ZONE_HAL_ID, RENTAL_ZONE_HAL_SRC) not in (select RENTAL_ZONE_HAL_ID, RENTAL_ZONE_HAL_SRC from stg_RENTAL_ZONE_CARSHARING);
