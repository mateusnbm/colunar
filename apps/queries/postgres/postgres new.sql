

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q1
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_region, 
        sum(lo_quantity) 
    FROM 
        customer, 
        region, 
        lineorder, 
        part
    WHERE 
        ST_Contains(region_geo, ST_GeomFromText('POINT(-87.42 41.24)') ) AND
        region_pk = c_region_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_region
    ORDER BY
        p_category,
        c_region

) TO '/Users/mateusnbm/Desktop/results/Q1.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q2
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_nation, 
        sum(lo_quantity) 
    FROM 
        customer, 
        nation, 
        lineorder, 
        part
    WHERE 
        ST_Contains(nation_geo, ST_GeomFromText('POINT(-87.42 41.24)') ) AND
        nation_pk = c_nation_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_nation
    ORDER BY
        p_category,
        c_nation

) TO '/Users/mateusnbm/Desktop/results/Q2.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q3
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_city, 
        sum(lo_quantity) 
    FROM 
        customer, 
        city, 
        lineorder, 
        part
    WHERE 
        ST_Contains(city_geo, ST_GeomFromText('POINT(-87.42 41.24)') ) AND
        city_pk = c_city_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_city
    ORDER BY
        p_category,
        c_city

) TO '/Users/mateusnbm/Desktop/results/Q3.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q4
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_address, 
        sum(lo_quantity)
    FROM 
        customer, 
        c_address, 
        lineorder, 
        part
    WHERE 
        ST_Distance(c_address_geo, ST_MakePoint(-87.42, 41.24)) <= 0.18 AND
        c_address_pk = c_address_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_address
    ORDER BY
        p_category,
        c_address

) TO '/Users/mateusnbm/Desktop/results/Q4.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q5
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_region, 
        c_nation, 
        sum(lo_quantity) 
    FROM 
        customer, 
        nation, 
        lineorder, 
        part
    WHERE 
        ST_Contains(nation_geo, ST_GeomFromText('POINT(-87.42 41.24)') ) AND
        nation_pk = c_nation_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_region, 
        c_nation
    ORDER BY
        p_category,
        c_region, 
        c_nation

) TO '/Users/mateusnbm/Desktop/results/Q5.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q6
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_region, 
        c_nation, 
        c_city, 
        sum(lo_quantity) 
    FROM 
        customer, 
        city, 
        lineorder, 
        part
    WHERE 
        ST_Contains(city_geo, ST_GeomFromText('POINT(-87.42 41.24)') ) AND
        city_pk = c_city_fk AND
        c_custkey = lo_custkey AND
        lo_partkey = p_partkey
    GROUP BY 
        p_category, 
        c_region, 
        c_nation, 
        c_city
    ORDER BY
        p_category,
        c_region, 
        c_nation, 
        c_city

) TO '/Users/mateusnbm/Desktop/results/Q6.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- Q7
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        p_category, 
        c_region, 
        c_nation, 
        c_city, 
        c_address, 
        sum(lo_quantity) 
     FROM 
        customer, 
        c_address, 
        lineorder, 
        part
     WHERE 
       ST_Distance(c_address_geo, ST_MakePoint(-87.42, 41.24)) <= 0.18 AND
       c_address_pk = c_address_fk AND
       c_custkey = lo_custkey AND
       lo_partkey = p_partkey
    GROUP BY 
       p_category, 
       c_region, 
       c_nation, 
       c_city, 
       c_address
    ORDER BY
      p_category,
      c_region, 
      c_nation, 
      c_city, 
      c_address

) TO '/Users/mateusnbm/Desktop/results/Q7.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------- Query 1.1 (Q8)
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        d_year,
        sum(lo_revenue) 
    FROM
        lineorder, 
        date
    WHERE 
        d_datekey = lo_orderdate
    GROUP BY 
        d_year
    ORDER BY
        d_year

) TO '/Users/mateusnbm/Desktop/Q8.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
---------------------------------------------------------------------- Query 1.2 (Q9)
-------------------------------------------------------------------------------------

COPY (

    SELECT 
        d_year,
        p_category,
        sum(lo_revenue) 
    FROM
        lineorder, 
        date,
        part
    WHERE 
        d_datekey = lo_orderdate AND
        p_partkey = lo_partkey
    GROUP BY 
        d_year,
        p_category
    ORDER BY
        d_year,
        p_category

) TO '/Users/mateusnbm/Desktop/Q9.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 1.3 (Q10)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q10.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 1.4 (Q11)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q11.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 2.1 (Q12)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q12.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 2.2 (Q13)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q13.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 2.3 (Q14)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q14.csv' DELIMITER ',' CSV;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------- Query 2.4 (Q15)
-------------------------------------------------------------------------------------

COPY (

    //

) TO '/Users/mateusnbm/Desktop/Q15.csv' DELIMITER ',' CSV;




   