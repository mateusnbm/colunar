--c_address
ALTER TABLE c_address DROP COLUMN city_name;

ALTER TABLE c_address ADD PRIMARY KEY (c_address_pk);

ALTER TABLE customer ADD COLUMN c_address_fk integer;

UPDATE customer SET c_address_fk = c_address_pk FROM c_address WHERE c_address.c_custkey = customer.c_custkey;

ALTER TABLE c_address DROP COLUMN c_custkey;

ALTER TABLE customer ADD CONSTRAINT c_address_fk FOREIGN KEY (c_address_fk) REFERENCES c_address (c_address_pk) MATCH SIMPLE;


--s_address
ALTER TABLE s_address DROP COLUMN city_name;

ALTER TABLE s_address ADD PRIMARY KEY (s_address_pk);

ALTER TABLE supplier ADD COLUMN s_address_fk integer;

UPDATE supplier SET s_address_fk = s_address_pk FROM s_address WHERE s_address.s_suppkey = supplier.s_suppkey;

ALTER TABLE s_address DROP COLUMN s_suppkey;

ALTER TABLE supplier ADD CONSTRAINT s_address_fk FOREIGN KEY (s_address_fk) REFERENCES s_address (s_address_pk) MATCH SIMPLE;


--city
ALTER TABLE city DROP COLUMN nation_name;

ALTER TABLE city ADD PRIMARY KEY (city_pk);

ALTER TABLE customer ADD COLUMN c_city_fk integer;

UPDATE customer SET c_city_fk = city_pk FROM city WHERE city.city_name = customer.c_city;

ALTER TABLE customer ADD CONSTRAINT c_city_fk FOREIGN KEY (c_city_fk) REFERENCES city (city_pk) MATCH SIMPLE;

ALTER TABLE supplier ADD COLUMN s_city_fk integer;

UPDATE supplier SET s_city_fk = city_pk FROM city WHERE city.city_name = supplier.s_city;

ALTER TABLE supplier ADD CONSTRAINT s_city_fk FOREIGN KEY (s_city_fk) REFERENCES city (city_pk) MATCH SIMPLE;

ALTER TABLE city DROP COLUMN city_name;


--nation
ALTER TABLE nation DROP COLUMN region_name;

ALTER TABLE nation ADD PRIMARY KEY (nation_pk);

ALTER TABLE customer ADD COLUMN c_nation_fk integer;

UPDATE customer SET c_nation_fk = nation_pk FROM nation WHERE nation.nation_name = customer.c_nation;

ALTER TABLE customer ADD CONSTRAINT c_nation_fk FOREIGN KEY (c_nation_fk) REFERENCES nation (nation_pk) MATCH SIMPLE;

ALTER TABLE supplier ADD COLUMN s_nation_fk integer;

UPDATE supplier SET s_nation_fk = nation_pk FROM nation WHERE nation.nation_name = supplier.s_nation;

ALTER TABLE supplier ADD CONSTRAINT s_nation_fk FOREIGN KEY (s_nation_fk) REFERENCES nation (nation_pk) MATCH SIMPLE;

ALTER TABLE nation DROP COLUMN nation_name;


--region
ALTER TABLE region ADD PRIMARY KEY (region_pk);

ALTER TABLE customer ADD COLUMN c_region_fk integer;

UPDATE customer SET c_region_fk = region_pk FROM region WHERE region.region_name = customer.c_region;

ALTER TABLE customer ADD CONSTRAINT c_region_fk FOREIGN KEY (c_region_fk) REFERENCES region (region_pk) MATCH SIMPLE;

ALTER TABLE supplier ADD COLUMN s_region_fk integer;

UPDATE supplier SET s_region_fk = region_pk FROM region WHERE region.region_name = supplier.s_region;

ALTER TABLE supplier ADD CONSTRAINT s_region_fk FOREIGN KEY (s_region_fk) REFERENCES region (region_pk) MATCH SIMPLE;

ALTER TABLE region DROP COLUMN region_name;


--defining constraints
ALTER TABLE lineorder ADD PRIMARY KEY (lo_orderkey, lo_linenumber);

ALTER TABLE lineorder ADD CONSTRAINT commitdate_fk FOREIGN KEY (lo_commitdate) REFERENCES date (d_datekey) MATCH SIMPLE;

ALTER TABLE lineorder ADD CONSTRAINT orderdate_fk FOREIGN KEY (lo_orderdate) REFERENCES date (d_datekey) MATCH SIMPLE;

ALTER TABLE lineorder ADD CONSTRAINT customer_fk FOREIGN KEY (lo_custkey) REFERENCES customer (c_custkey) MATCH SIMPLE;

ALTER TABLE lineorder ADD CONSTRAINT part_fk FOREIGN KEY (lo_partkey) REFERENCES part (p_partkey) MATCH SIMPLE;

ALTER TABLE lineorder ADD CONSTRAINT supplier_fk FOREIGN KEY (lo_suppkey) REFERENCES supplier (s_suppkey) MATCH SIMPLE;
