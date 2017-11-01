/*==============================================================*/
/* Table: D_CATEGORY                                            */
/*==============================================================*/
create table D_CATEGORY (
   D_CATEGORY_ID        NUMBER                not null,
   CATEGORY             VARCHAR2(255)         not null,
   COMPANY              VARCHAR2(30),
   COMPANY_GROUP        VARCHAR2(30),
   constraint PK_D_CATEGORY primary key (D_CATEGORY_ID)
);

/*==============================================================*/
/* Index: D_CATEGORY_UIX5                                       */
/*==============================================================*/
create unique index D_CATEGORY_UIX5 on D_CATEGORY (
   CATEGORY ASC
);

/*==============================================================*/
/* Table: D_CUSTOMER                                            */
/*==============================================================*/
create table D_CUSTOMER (
   D_CUSTOMER_ID        NUMBER                not null,
   CUSTOMERID           VARCHAR2(255)         not null,
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
   constraint PK_D_CUSTOMER primary key (D_CUSTOMER_ID)
);

/*==============================================================*/
/* Table: D_DATE                                                */
/*==============================================================*/
create table D_DATE (
   DATE_KEY             DATE                  not null,
   DAY                  NUMBER                not null,
   MONTH                NUMBER                not null,
   YEAR                 NUMBER                not null,
   constraint PK_D_DATE primary key (DATE_KEY)
);

/*==============================================================*/
/* Table: D_EXTRA_BOOKING_FEE                                   */
/*==============================================================*/
create table D_EXTRA_BOOKING_FEE (
   D_EXTRA_BOOKING_FEE_ID NUMBER                not null,
   COMPUTE_EXTRA_BOOKING_FEE VARCHAR2(30)          not null,
   constraint PK_D_EXTRA_BOOKING_FEE primary key (D_EXTRA_BOOKING_FEE_ID)
);

/*==============================================================*/
/* Table: D_RENTAL_ZONE                                         */
/*==============================================================*/
create table D_RENTAL_ZONE (
   D_RENTAL_ZONE_ID     NUMBER                not null,
   RENTAL_ZONE_ID       NUMBER                not null,
   RENTAL_ZONE_SRC      VARCHAR2(30)          not null,
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
   constraint PK_D_RENTAL_ZONE primary key (D_RENTAL_ZONE_ID)
);

/*==============================================================*/
/* Table: D_TIME                                                */
/*==============================================================*/
create table D_TIME (
   TIME_ID              NUMBER                not null,
   SECONDS              NUMBER                not null,
   constraint PK_D_TIME primary key (TIME_ID)
);

/*==============================================================*/
/* Table: D_TRAVERSE_USE                                        */
/*==============================================================*/
create table D_TRAVERSE_USE (
   D_TRAVERSE_USE_ID    NUMBER                not null,
   TRAVERSE_USE         VARCHAR2(30)          not null,
   constraint PK_D_TRAVERSE_USE primary key (D_TRAVERSE_USE_ID)
);

/*==============================================================*/
/* Table: D_VEHICLE                                             */
/*==============================================================*/
create table D_VEHICLE (
   D_VEHICLE_ID         NUMBER                not null,
   VIN                  VARCHAR2(30)          not null,
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
   constraint PK_D_VEHICLE primary key (D_VEHICLE_ID)
);

/*==============================================================*/
/* Table: F_BOOKING                                             */
/*==============================================================*/
create table F_BOOKING (
   D_CATEGORY_ID        NUMBER,
   D_CUSTOMER_ID        NUMBER,
   D_VEHICLE_ID         NUMBER,
   D_RENTAL_ZONE_ID_FROM NUMBER,
   D_RENTAL_ZONE_ID_TO  NUMBER,
   DATE_KEY_BOOKING     DATE,
   DATE_KEY_FROM        DATE,
   DATE_KEY_UNTIL       DATE,
   TIME_ID_FROM         NUMBER,
   TIME_ID_UNTIL        NUMBER,
   D_EXTRA_BOOKING_FEE_ID NUMBER,
   D_TRAVERSE_USE_ID    NUMBER,
   DISTANCE             NUMBER,
   COUNT                 NUMBER
);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_FROM_D_DATE foreign key (DATE_KEY_FROM)
      references D_DATE (DATE_KEY);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_FROM_D_RENTAL foreign key (D_RENTAL_ZONE_ID_FROM)
      references D_RENTAL_ZONE (D_RENTAL_ZONE_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_FROM_D_TIME foreign key (TIME_ID_FROM)
      references D_TIME (TIME_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_EXTRA_ foreign key (D_EXTRA_BOOKING_FEE_ID)
      references D_EXTRA_BOOKING_FEE (D_EXTRA_BOOKING_FEE_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_TRAVER foreign key (D_TRAVERSE_USE_ID)
      references D_TRAVERSE_USE (D_TRAVERSE_USE_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_CATEGO foreign key (D_CATEGORY_ID)
      references D_CATEGORY (D_CATEGORY_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_CUSTOM foreign key (D_CUSTOMER_ID)
      references D_CUSTOMER (D_CUSTOMER_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_VEHICL foreign key (D_VEHICLE_ID)
      references D_VEHICLE (D_VEHICLE_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_REFERENCE_D_DATE foreign key (DATE_KEY_BOOKING)
      references D_DATE (DATE_KEY);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_TO_D_RENTAL foreign key (D_RENTAL_ZONE_ID_TO)
      references D_RENTAL_ZONE (D_RENTAL_ZONE_ID);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_UNTIL_D_DATE foreign key (DATE_KEY_UNTIL)
      references D_DATE (DATE_KEY);

alter table F_BOOKING
   add constraint FK_F_BOOKIN_UNTIL_D_TIME foreign key (TIME_ID_UNTIL)
      references D_TIME (TIME_ID);
