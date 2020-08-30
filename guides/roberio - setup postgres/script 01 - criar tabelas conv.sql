CREATE TABLE part(
  p_partkey integer NOT NULL,
  p_name character varying(22),
  p_mfgr character(6),
  p_category character(7),
  p_brand1 character(9),
  p_color character varying(11),
  p_type character varying(25),
  p_size smallint,
  p_container character(10),
  atnull character varying(1),
  CONSTRAINT part_pk PRIMARY KEY (p_partkey)
);
copy part from '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb/part.tbl' with delimiter '|';
alter table part drop column atnull;


CREATE TABLE supplier(
  s_suppkey integer NOT NULL,
  s_name character(25),
  s_address character varying(25),
  s_city character(10),
  s_nation character(15),
  s_region character(12),
  s_phone character(15),
  atnull character(1),
  CONSTRAINT supplier_pk PRIMARY KEY (s_suppkey)
);
copy supplier from 'C/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb/supplier.tbl' with delimiter '|';
alter table supplier drop column atnull;


CREATE TABLE date(
  d_datekey integer NOT NULL,
  d_date character(18),
  d_dayofweek character(9),
  d_month character(9),
  d_year integer,
  d_yearmonthnum integer,
  d_yearmonth character(7),
  d_daynuminweek smallint,
  d_daynuminmonth smallint,
  d_daynuminyear smallint,
  d_monthnuminyear smallint,
  d_weeknuminyear smallint,
  d_sellingseason character varying(12),
  d_lastdayinweekfl boolean,
  d_lastdayinmonthfl boolean,
  d_holidayfl boolean,
  d_weekdayfl boolean,
  atnull character(1),
  CONSTRAINT date_pk PRIMARY KEY (d_datekey)
);
copy date from '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb/date.tbl' with delimiter '|';
alter table date drop column atnull;


CREATE TABLE customer(
  c_custkey integer NOT NULL,
  c_name character varying(25),
  c_address character varying(25),
  c_city character(10),
  c_nation character(15),
  c_region character(12),
  c_phone character(15),
  c_mktsegment character(10),
  atnull character(1),
  CONSTRAINT customer_pk PRIMARY KEY (c_custkey)
);
copy customer from '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb/customer.tbl' with delimiter '|';
alter table customer drop column atnull;


CREATE TABLE lineorder(
  lo_orderkey integer NOT NULL,
  lo_linenumber smallint NOT NULL,
  lo_custkey integer,
  lo_partkey integer,
  lo_suppkey integer,
  lo_orderdate integer,
  lo_orderpriority character(15),
  lo_shippriority character(1),
  lo_quantity smallint,
  lo_extendedprice double precision,
  lo_ordtotalprice double precision,
  lo_discount double precision,
  lo_revenue double precision,
  lo_supplycost double precision,
  lo_tax double precision,
  lo_commitdate integer,
  lo_shipmode character(10),
  atnull character(1)  
);
copy lineorder from '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb/lineorder.tbl' with delimiter '|';
ALTER TABLE lineorder DROP COLUMN atnull;

