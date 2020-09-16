

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION address_standardizer;
CREATE EXTENSION address_standardizer_data_us;
CREATE EXTENSION postgis_tiger_geocoder;


CREATE TABLE lineorder (
  lo_orderkey       integer NOT NULL,
  lo_linenumber     smallint NOT NULL,
  lo_custkey        integer,
  lo_partkey        integer,
  lo_suppkey        integer,
  lo_orderdate      integer,
  lo_orderpriority  character(15),
  lo_shippriority   character(1),
  lo_quantity       smallint,
  lo_extendedprice  double precision,
  lo_ordtotalprice  double precision,
  lo_discount       double precision,
  lo_revenue        double precision,
  lo_supplycost     double precision,
  lo_tax            double precision,
  lo_commitdate     integer,
  lo_shipmode       character(10),
  atnull            character(1),
  CONSTRAINT lineorder_pk PRIMARY KEY (lo_orderkey, lo_linenumber)
  );

CREATE TABLE date (
  d_datekey           integer NOT NULL,
  d_date              character(18),
  d_dayofweek         character(9),
  d_month             character(9),
  d_year              integer,
  d_yearmonthnum      integer,
  d_yearmonth         character(7),
  d_daynuminweek      smallint,
  d_daynuminmonth     smallint,
  d_daynuminyear      smallint,
  d_monthnuminyear    smallint,
  d_weeknuminyear     smallint,
  d_sellingseason     character varying(12),
  d_lastdayinweekfl   boolean,
  d_lastdayinmonthfl  boolean,
  d_holidayfl         boolean,
  d_weekdayfl         boolean,
  atnull              character(1),
  CONSTRAINT date_pk PRIMARY KEY (d_datekey)
  );

CREATE TABLE customer (
  c_custkey     integer NOT NULL,
  c_name        character varying(25),
  c_address     character varying(25),
  c_city        character(10),
  c_nation      character(15),
  c_region      character(12),
  c_phone       character(15),
  c_mktsegment  character(10),
  c_address_fk  integer NOT NULL,
  c_city_fk     integer NOT NULL,
  c_nation_fk   integer NOT NULL,
  c_region_fk   integer NOT NULL,
  atnull        character(1),
  CONSTRAINT customer_pk PRIMARY KEY (c_custkey)
  );

CREATE TABLE supplier (
  s_suppkey     integer NOT NULL,
  s_name        character(25),
  s_address     character varying(25),
  s_city        character(10),
  s_nation      character(15),
  s_region      character(12),
  s_phone       character(15),
  s_address_fk  integer NOT NULL,
  s_city_fk     integer NOT NULL,
  s_nation_fk   integer NOT NULL,
  s_region_fk   integer NOT NULL,
  atnull        character(1),
  CONSTRAINT supplier_pk PRIMARY KEY (s_suppkey)
  );

CREATE TABLE part (
  p_partkey   integer NOT NULL,
  p_name      character varying(22),
  p_mfgr      character(6),
  p_category  character(7),
  p_brand1    character(9),
  p_color     character varying(11),
  p_type      character varying(25),
  p_size      smallint,
  p_container character(10),
  atnull      character varying(1),
  CONSTRAINT part_pk PRIMARY KEY (p_partkey)
  );

CREATE TABLE c_address (
  c_address_pk        integer NOT NULL,
  c_address_city_fk   integer NOT NULL,
  c_address_nation_fk integer NOT NULL,
  c_address_region_fk integer NOT NULL,
  CONSTRAINT c_address_pk_c PRIMARY KEY (c_address_pk)
  );

CREATE TABLE s_address (
  s_address_pk        integer NOT NULL,
  s_address_city_fk   integer NOT NULL,
  s_address_nation_fk integer NOT NULL,
  s_address_region_fk integer NOT NULL,
  CONSTRAINT s_address_pk_c PRIMARY KEY (s_address_pk)
  );

CREATE TABLE city (
  city_pk integer, 
  city_nation_fk  integer NOT NULL,
  CONSTRAINT city_pk_c PRIMARY KEY (city_pk)
  );

CREATE TABLE nation (
  nation_pk         integer, 
  nation_region_fk  integer NOT NULL,
  CONSTRAINT nation_pk_c PRIMARY KEY (nation_pk)
  ); 

CREATE TABLE region (
  region_pk integer,
  CONSTRAINT region_pk_c PRIMARY KEY (region_pk)
  );

SELECT AddGeometryColumn('c_address', 'c_address_geo',  -1, 'GEOMETRY', 2);
SELECT AddGeometryColumn('s_address', 's_address_geo',  -1, 'GEOMETRY', 2);
SELECT AddGeometryColumn('city',      'city_geo',       -1, 'GEOMETRY', 2);
SELECT AddGeometryColumn('nation',    'nation_geo',     -1, 'GEOMETRY', 2);
SELECT AddGeometryColumn('region',    'region_geo',     -1, 'GEOMETRY', 2);

ALTER TABLE c_address ADD COLUMN atnull character varying(1);
ALTER TABLE s_address ADD COLUMN atnull character varying(1);
ALTER TABLE city ADD COLUMN atnull character varying(1);
ALTER TABLE nation ADD COLUMN atnull character varying(1);
ALTER TABLE region ADD COLUMN atnull character varying(1);

COPY lineorder  FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/lineorder.tbl'      WITH DELIMITER '|';
COPY date       FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/date.tbl'           WITH DELIMITER '|';
COPY customer   FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/customer.tbl'       WITH DELIMITER '|';
COPY supplier   FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/supplier.tbl'       WITH DELIMITER '|';
COPY part       FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/part.tbl'           WITH DELIMITER '|';

COPY c_address  FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/customer_addr.tbl'  WITH DELIMITER '|';
COPY s_address  FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/supplier_addr.tbl'  WITH DELIMITER '|';

COPY city       FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/city.tbl'           WITH DELIMITER '|';
COPY nation     FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/nation.tbl'         WITH DELIMITER '|';
COPY region     FROM '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_ssb_geo/region.tbl'         WITH DELIMITER '|';

ALTER TABLE lineorder   DROP COLUMN atnull;
ALTER TABLE date        DROP COLUMN atnull;
ALTER TABLE customer    DROP COLUMN atnull;
ALTER TABLE supplier    DROP COLUMN atnull;
ALTER TABLE part        DROP COLUMN atnull;
ALTER TABLE c_address   DROP COLUMN atnull;
ALTER TABLE s_address   DROP COLUMN atnull;
ALTER TABLE city        DROP COLUMN atnull;
ALTER TABLE nation      DROP COLUMN atnull;
ALTER TABLE region      DROP COLUMN atnull;

ALTER TABLE lineorder ADD CONSTRAINT commitdate_fk  FOREIGN KEY (lo_commitdate) REFERENCES date (d_datekey)     MATCH SIMPLE;
ALTER TABLE lineorder ADD CONSTRAINT orderdate_fk   FOREIGN KEY (lo_orderdate)  REFERENCES date (d_datekey)     MATCH SIMPLE;
ALTER TABLE lineorder ADD CONSTRAINT customer_fk    FOREIGN KEY (lo_custkey)    REFERENCES customer (c_custkey) MATCH SIMPLE;
ALTER TABLE lineorder ADD CONSTRAINT part_fk        FOREIGN KEY (lo_partkey)    REFERENCES part (p_partkey)     MATCH SIMPLE;
ALTER TABLE lineorder ADD CONSTRAINT supplier_fk    FOREIGN KEY (lo_suppkey)    REFERENCES supplier (s_suppkey) MATCH SIMPLE;

ALTER TABLE customer  ADD CONSTRAINT c_address_fk_c FOREIGN KEY (c_address_fk)  REFERENCES c_address (c_address_pk) MATCH SIMPLE;
ALTER TABLE customer  ADD CONSTRAINT c_city_fk_c    FOREIGN KEY (c_city_fk)     REFERENCES city (city_pk)           MATCH SIMPLE;
ALTER TABLE customer  ADD CONSTRAINT c_nation_fk_c  FOREIGN KEY (c_nation_fk)   REFERENCES nation (nation_pk)       MATCH SIMPLE;
ALTER TABLE customer  ADD CONSTRAINT c_region_fk_c  FOREIGN KEY (c_region_fk)   REFERENCES region (region_pk)       MATCH SIMPLE;

ALTER TABLE supplier  ADD CONSTRAINT s_address_fk_c FOREIGN KEY (s_address_fk)  REFERENCES s_address (s_address_pk) MATCH SIMPLE;
ALTER TABLE supplier  ADD CONSTRAINT s_city_fk_c    FOREIGN KEY (s_city_fk)     REFERENCES city (city_pk)           MATCH SIMPLE;
ALTER TABLE supplier  ADD CONSTRAINT s_nation_fk_c  FOREIGN KEY (s_nation_fk)   REFERENCES nation (nation_pk)       MATCH SIMPLE;
ALTER TABLE supplier  ADD CONSTRAINT s_region_fk_c  FOREIGN KEY (s_region_fk)   REFERENCES region (region_pk)       MATCH SIMPLE;

ALTER TABLE c_address ADD CONSTRAINT c_address_city_fk_c    FOREIGN KEY (c_address_city_fk)    REFERENCES city (city_pk)     MATCH SIMPLE;
ALTER TABLE c_address ADD CONSTRAINT c_address_nation_fk_c  FOREIGN KEY (c_address_nation_fk)  REFERENCES nation (nation_pk) MATCH SIMPLE;
ALTER TABLE c_address ADD CONSTRAINT c_address_region_fk_c  FOREIGN KEY (c_address_region_fk)  REFERENCES region (region_pk) MATCH SIMPLE;

ALTER TABLE s_address ADD CONSTRAINT s_address_city_fk_c    FOREIGN KEY (s_address_city_fk)    REFERENCES city (city_pk)     MATCH SIMPLE;
ALTER TABLE s_address ADD CONSTRAINT s_address_nation_fk_c  FOREIGN KEY (s_address_nation_fk)  REFERENCES nation (nation_pk) MATCH SIMPLE;
ALTER TABLE s_address ADD CONSTRAINT s_address_region_fk_c  FOREIGN KEY (s_address_region_fk)  REFERENCES region (region_pk) MATCH SIMPLE;

ALTER TABLE city    ADD CONSTRAINT city_nation_fk_c   FOREIGN KEY (city_nation_fk)    REFERENCES nation (nation_pk) MATCH SIMPLE;
ALTER TABLE nation  ADD CONSTRAINT nation_region_fk_c FOREIGN KEY (nation_region_fk)  REFERENCES region (region_pk) MATCH SIMPLE;

