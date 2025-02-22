create table if not exists dds.restaurants(
id serial primary key,
restaurant_id text  not null unique,
restaurant_name text  not null
);

create table if not exists dds.couriers(
id serial primary key,
courier_id text  not null unique,
courier_name text  not null 
);

create table if not exists dds.deliveries(
id serial primary key,
order_id text  unique not null,
order_ts timestamp  not null,
delivery_id text  not null,
courier_id text  not null,
address text  not null, 
delivery_ts timestamp  not null,
rate integer  not null check(rate>=0),
"sum" integer  not null check(rate>= 0),
tip_sum integer  not null check(rate>=0) 
);

create table dds.timestamps (
id serial primary key,
ts timestamp unique not null ,
"year" smallint check ("year" >= 2022 and "year"<2500) not null,
"month" smallint check("month" >=1 and "month" <=12) not null,
"day" smallint check("day" >=1 and "day" <= 31) not null,
"time" time  not null,
"date" date  not null
);

ALTER TABLE dds.deliveries  ADD CONSTRAINT couriers_fk FOREIGN KEY(courier_id) REFERENCES dds.couriers(courier_id);
ALTER TABLE dds.deliveries  ADD CONSTRAINT timestamp_fk FOREIGN KEY(delivery_ts) REFERENCES dds.timestamps(ts);