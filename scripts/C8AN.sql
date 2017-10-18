/*==============================================================*/
/* Table: H_BOOKING                                             */
/*==============================================================*/
create table H_BOOKING (
   H_BOOKING_KEY        VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   BOOKING_ID           NUMBER                not null,
   constraint PK_H_BOOKING primary key (H_BOOKING_KEY)
);

/*==============================================================*/
/* Index: H_BOOKING_BID_UIX                                     */
/*==============================================================*/
create unique index H_BOOKING_BID_UIX on H_BOOKING (
   BOOKING_ID ASC
);

/*==============================================================*/
/* Table: H_CUSTOMER                                            */
/*==============================================================*/
create table H_CUSTOMER (
   H_CUSTOMER_KEY       VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   CUSTOMER_ID          VARCHAR2(255)         not null,
   constraint PK_H_CUSTOMER primary key (H_CUSTOMER_KEY)
);

/*==============================================================*/
/* Index: H_CUSTOMER_CID_UIX                                    */
/*==============================================================*/
create unique index H_CUSTOMER_CID_UIX on H_CUSTOMER (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: H_RENTAL_ZONE                                         */
/*==============================================================*/
create table H_RENTAL_ZONE (
   H_RENTAL_ZONE_KEY    VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   RENTAL_ZONE_ID       NUMBER                not null,
   RENTAL_ZONE_SRC      VARCHAR2(30)          not null,
   constraint PK_H_RENTAL_ZONE primary key (H_RENTAL_ZONE_KEY)
);

/*==============================================================*/
/* Index: H_RENTAL_ZONE_RZ_UIX                                  */
/*==============================================================*/
create unique index H_RENTAL_ZONE_RZ_UIX on H_RENTAL_ZONE (
   RENTAL_ZONE_ID ASC,
   RENTAL_ZONE_SRC ASC
);

/*==============================================================*/
/* Table: H_VEHICLE                                             */
/*==============================================================*/
create table H_VEHICLE (
   H_VEHICLE_KEY        VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   VIN                  VARCHAR2(30)          not null,
   constraint PK_H_VEHICLE primary key (H_VEHICLE_KEY)
);

/*==============================================================*/
/* Index: H_VEHICLE_FIN_UIX                                     */
/*==============================================================*/
create unique index H_VEHICLE_FIN_UIX on H_VEHICLE (
   VIN ASC
);

/*==============================================================*/
/* Table: L_BOOKING                                             */
/*==============================================================*/
create table L_BOOKING (
   L_BOOKING_KEY        VARCHAR2(32)          not null,
   H_RENTAL_ZONE_KEY_START VARCHAR2(32),
   H_RENTAL_ZONE_KEY_END VARCHAR2(32),
   H_VEHICLE_KEY        VARCHAR2(32),
   H_CUSTOMER_KEY       VARCHAR2(32),
   H_BOOKING_KEY        VARCHAR2(32),
   LOAD_DATE            TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   constraint PK_L_BOOKING primary key (L_BOOKING_KEY)
);

/*==============================================================*/
/* Table: R_CATEGORY                                            */
/*==============================================================*/
create table R_CATEGORY (
   CATEGORY_HAL_ID      NUMBER                not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   CATEGORY             VARCHAR2(255)         not null,
   COMPANY              VARCHAR2(30),
   COMPANY_GROUP        VARCHAR2(30),
   constraint PK_R_CATEGORY primary key (CATEGORY_HAL_ID)
);

/*==============================================================*/
/* Index: H_VEHICLE_FIN_UIX5                                    */
/*==============================================================*/
create unique index H_VEHICLE_FIN_UIX5 on R_CATEGORY (
   CATEGORY ASC
);

/*==============================================================*/
/* Table: S_BOOKING_FLK                                         */
/*==============================================================*/
create table S_BOOKING_FLK (
   H_BOOKING_KEY        VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   CATEGORY_HAL_ID      NUMBER,
   DATE_BOOKING         VARCHAR2(30),
   DATE_FROM            VARCHAR2(30),
   DATE_UNTIL           VARCHAR2(30),
   COMPUTE_EXTRA_BOOKING_FEE VARCHAR2(30),
   TRAVERSE_USE         VARCHAR2(30),
   DISTANCE             NUMBER,
   START_RENTAL_ZONE    VARCHAR2(255),
   END_RENTAL_ZONE      VARCHAR2(255),
   CITY_RENTAL_ZONE     VARCHAR2(30),
   TECHNICAL_INCOME_CHANNEL VARCHAR2(30),
   constraint PK_S_BOOKING_FLK primary key (H_BOOKING_KEY, LOADDATE)
);

/*==============================================================*/
/* Table: S_CUSTOMER_CRM                                        */
/*==============================================================*/
create table S_CUSTOMER_CRM (
   H_CUSTOMER_KEY       VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   FIRST_NAME           VARCHAR2(100),
   LAST_NAME            VARCHAR2(100),
   GENDER               VARCHAR2(6),
   BIRTHDAY             VARCHAR2(10),
   STREET               VARCHAR2(50),
   CITY                 VARCHAR2(50),
   STATE                VARCHAR2(2),
   ZIP                  NUMBER,
   CCNUMBER             NUMBER,
   EMAIL                VARCHAR2(250),
   constraint PK_S_CUSTOMER_CRM primary key (H_CUSTOMER_KEY, LOADDATE)
);

/*==============================================================*/
/* Table: S_RENTAL_ZONE_FLK                                     */
/*==============================================================*/
create table S_RENTAL_ZONE_FLK (
   H_RENTAL_ZONE_KEY    VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   NAME                 VARCHAR2(255),
   CODE                 VARCHAR2(255),
   TYPE                 VARCHAR2(30),
   CITY                 VARCHAR2(255),
   COUNTRY              VARCHAR2(30),
   LATITUDE             VARCHAR2(30),
   LONGITUDE            VARCHAR2(30),
   POI_AIRPORT_X        VARCHAR2(30),
   POI_LONG_DISTANCE_TRAINS_X VARCHAR2(30),
   POI_SUBURBAN_TRAINS_X VARCHAR2(30),
   POI_UNDERGROUND_X    VARCHAR2(30),
   ACTIVE_X             VARCHAR2(30),
   COMPANY              VARCHAR2(30),
   COMPANY_GROUP        VARCHAR2(30),
   constraint PK_S_RENTAL_ZONE_FLK primary key (H_RENTAL_ZONE_KEY, LOADDATE, H_RENTAL_ZONE_KEY, LOADDATE)
);

/*==============================================================*/
/* Table: S_VEHICLE_FLK                                         */
/*==============================================================*/
create table S_VEHICLE_FLK (
   H_VEHICLE_KEY        VARCHAR2(32)          not null,
   LOADDATE             TIMESTAMP             not null,
   RECORD_SOURCE        VARCHAR2(10)          not null,
   VEHICLE_MODEL_TYPE   VARCHAR2(30),
   VEHICLE_MANUFACTURER_NAME VARCHAR2(30),
   VEHICLE_MODEL_NAME   VARCHAR2(30),
   VEHICLE_TYPE_NAME    VARCHAR2(255),
   REGISTRATION_PLATE   VARCHAR2(30),
   SERIAL_NUMBER        VARCHAR2(30),
   KW                   NUMBER,
   FUEL_TYPE_NAME       VARCHAR2(30),
   OWNERSHIP_TYPE       VARCHAR2(30),
   CAPACITY_AMOUNT      VARCHAR2(30),
   ACCESS_CONTROL_COMPONENT_TYPE VARCHAR2(30),
   COMPANY              VARCHAR2(30),
   COMPANY_GROUP        VARCHAR2(30),
   constraint PK_S_VEHICLE_FLK primary key (H_VEHICLE_KEY, LOADDATE)
);

alter table L_BOOKING
   add constraint FK_L_BOOKIN_REFERENCE_H_BOOKIN foreign key (H_BOOKING_KEY)
      references H_BOOKING (H_BOOKING_KEY);

alter table L_BOOKING
   add constraint FK_L_BOOKIN_REFERENCE_H_RENTAL foreign key (H_RENTAL_ZONE_KEY_START)
      references H_RENTAL_ZONE (H_RENTAL_ZONE_KEY);

alter table L_BOOKING
   add constraint FK_L_BOOKIN_REFERENCE_H_RENTAL foreign key (H_RENTAL_ZONE_KEY_END)
      references H_RENTAL_ZONE (H_RENTAL_ZONE_KEY);

alter table L_BOOKING
   add constraint FK_L_BOOKIN_REFERENCE_H_VEHICL foreign key (H_VEHICLE_KEY)
      references H_VEHICLE (H_VEHICLE_KEY);

alter table L_BOOKING
   add constraint FK_L_BOOKIN_REFERENCE_H_CUSTOM foreign key (H_CUSTOMER_KEY)
      references H_CUSTOMER (H_CUSTOMER_KEY);

alter table S_BOOKING_FLK
   add constraint FK_S_BOOKIN_REFERENCE_H_BOOKIN foreign key (H_BOOKING_KEY)
      references H_BOOKING (H_BOOKING_KEY);

alter table S_BOOKING_FLK
   add constraint FK_S_BOOKIN_REFERENCE_R_CATEGO foreign key (CATEGORY_HAL_ID)
      references R_CATEGORY (CATEGORY_HAL_ID);

alter table S_CUSTOMER_CRM
   add constraint FK_S_CUSTOM_REFERENCE_H_CUSTOM foreign key (H_CUSTOMER_KEY)
      references H_CUSTOMER (H_CUSTOMER_KEY);

alter table S_RENTAL_ZONE_FLK
   add constraint FK_S_RENTAL_REFERENCE_H_RENTAL foreign key (H_RENTAL_ZONE_KEY)
      references H_RENTAL_ZONE (H_RENTAL_ZONE_KEY);

alter table S_VEHICLE_FLK
   add constraint FK_S_VEHICL_REFERENCE_H_VEHICL foreign key (H_VEHICLE_KEY)
      references H_VEHICLE (H_VEHICLE_KEY);
