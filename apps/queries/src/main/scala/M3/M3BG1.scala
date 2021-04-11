


import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator


object M3BG1 {

    def main(args: Array[String]) {

        val session =
            SparkSession.
            builder().
            appName("M3-B-G1").
            config("spark.serializer", classOf[KryoSerializer].getName).
            config("spark.kryo.registrator", classOf[GeoSparkVizKryoRegistrator].getName).
            getOrCreate()

        GeoSparkSQLRegistrator.registerAll(session)

        def lineorderTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"a"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"string"},
                    |
                    |"line_order_order_number_pk":      {"cf":"a", "col":"aa", "type":"int"},
                    |"line_order_line_number_pk":       {"cf":"a", "col":"ab", "type":"int"},
                    |"line_order_customer_fk":          {"cf":"a", "col":"ac", "type":"string"},
                    |"line_order_part_fk":              {"cf":"a", "col":"ad", "type":"string"},
                    |"line_order_supplier_fk":          {"cf":"a", "col":"ae", "type":"string"},
                    |"line_order_order_date_fk":        {"cf":"a", "col":"af", "type":"string"},
                    |"line_order_order_priority":       {"cf":"a", "col":"ag", "type":"string"},
                    |"line_order_shipping_priority":    {"cf":"a", "col":"ah", "type":"string"},
                    |"line_order_quantity":             {"cf":"a", "col":"ai", "type":"int"},
                    |"line_order_extended_price":       {"cf":"a", "col":"aj", "type":"int"},
                    |"line_order_order_total_price":    {"cf":"a", "col":"ak", "type":"int"},
                    |"line_order_discount":             {"cf":"a", "col":"al", "type":"int"},
                    |"line_order_revenue":              {"cf":"a", "col":"am", "type":"int"},
                    |"line_order_supply_cost":          {"cf":"a", "col":"an", "type":"int"},
                    |"line_order_tax":                  {"cf":"a", "col":"ao", "type":"int"},
                    |"line_order_commit_date_fk":       {"cf":"a", "col":"ap", "type":"string"},
                    |"line_order_shipping_mode":        {"cf":"a", "col":"aq", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val lineorderTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, lineorderTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        lineorderTableDataFrame.createOrReplaceTempView("a")

        def dateTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"b"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"string"},
                    |
                    |"date_pk":                         {"cf":"b", "col":"ba", "type":"int"},
                    |"date":                            {"cf":"b", "col":"bb", "type":"string"},
                    |"day_of_week":                     {"cf":"b", "col":"bc", "type":"string"},
                    |"month":                           {"cf":"b", "col":"bd", "type":"string"},
                    |"year":                            {"cf":"b", "col":"be", "type":"int"},
                    |"year_month_num":                  {"cf":"b", "col":"bf", "type":"int"},
                    |"year_month":                      {"cf":"b", "col":"bg", "type":"string"},
                    |"day_num_in_week":                 {"cf":"b", "col":"bh", "type":"int"},
                    |"day_num_in_month":                {"cf":"b", "col":"bi", "type":"int"},
                    |"day_num_in_year":                 {"cf":"b", "col":"bj", "type":"int"},
                    |"month_num_in_year":               {"cf":"b", "col":"bk", "type":"int"},
                    |"week_num_in_year":                {"cf":"b", "col":"bl", "type":"int"},
                    |"selling_season":                  {"cf":"b", "col":"bm", "type":"string"},
                    |"last_day_in_week_fl":             {"cf":"b", "col":"bn", "type":"boolean"},
                    |"last_day_in_month_fl":            {"cf":"b", "col":"bo", "type":"boolean"},
                    |"holiday_fl":                      {"cf":"b", "col":"bp", "type":"boolean"},
                    |"weekday_fl":                      {"cf":"b", "col":"bq", "type":"boolean"},
                    |"customer_pk":                     {"cf":"c", "col":"ca", "type":"int"},
                    |"customer_name":                   {"cf":"c", "col":"cb", "type":"string"},
                    |"customer_address":                {"cf":"c", "col":"cc", "type":"string"},
                    |"customer_city":                   {"cf":"c", "col":"cd", "type":"string"},
                    |"customer_nation":                 {"cf":"c", "col":"ce", "type":"string"},
                    |"customer_region":                 {"cf":"c", "col":"cf", "type":"string"},
                    |"customer_phone":                  {"cf":"c", "col":"cg", "type":"string"},
                    |"customer_marketing_segment":      {"cf":"c", "col":"ch", "type":"string"},
                    |"customer_address_fk":             {"cf":"c", "col":"ci", "type":"string"},
                    |"customer_city_fk":                {"cf":"c", "col":"cj", "type":"string"},
                    |"customer_nation_fk":              {"cf":"c", "col":"ck", "type":"string"},
                    |"customer_region_fk":              {"cf":"c", "col":"cl", "type":"string"},
                    |"supplier_pk":                     {"cf":"d", "col":"da", "type":"int"},
                    |"supplier_name":                   {"cf":"d", "col":"db", "type":"string"},
                    |"supplier_address":                {"cf":"d", "col":"dc", "type":"string"},
                    |"supplier_city":                   {"cf":"d", "col":"dd", "type":"string"},
                    |"supplier_nation":                 {"cf":"d", "col":"de", "type":"string"},
                    |"supplier_region":                 {"cf":"d", "col":"df", "type":"string"},
                    |"supplier_phone":                  {"cf":"d", "col":"dg", "type":"string"},
                    |"supplier_address_fk":             {"cf":"d", "col":"dh", "type":"string"},
                    |"supplier_city_fk":                {"cf":"d", "col":"di", "type":"string"},
                    |"supplier_nation_fk":              {"cf":"d", "col":"dj", "type":"string"},
                    |"supplier_region_fk":              {"cf":"d", "col":"dk", "type":"string"},
                    |"part_part_pk":                    {"cf":"e", "col":"ea", "type":"int"},
                    |"part_name":                       {"cf":"e", "col":"eb", "type":"string"},
                    |"part_mfgr":                       {"cf":"e", "col":"ec", "type":"string"},
                    |"part_category":                   {"cf":"e", "col":"ed", "type":"string"},
                    |"part_brand":                      {"cf":"e", "col":"ee", "type":"string"},
                    |"part_color":                      {"cf":"e", "col":"ef", "type":"string"},
                    |"part_type":                       {"cf":"e", "col":"eg", "type":"string"},
                    |"part_size":                       {"cf":"e", "col":"eh", "type":"int"},
                    |"part_container":                  {"cf":"e", "col":"ei", "type":"string"},
                    |"customer_addr_pk":                {"cf":"f", "col":"fa", "type":"int"},
                    |"customer_addr_geom":              {"cf":"f", "col":"fb", "type":"string"},
                    |"supplier_addr_pk":                {"cf":"g", "col":"ga", "type":"int"},
                    |"supplier_addr_geom":              {"cf":"g", "col":"gb", "type":"string"},
                    |"city_pk":                         {"cf":"h", "col":"ha", "type":"int"},
                    |"city_geom":                       {"cf":"h", "col":"hb", "type":"string"},
                    |"nation_pk":                       {"cf":"i", "col":"ia", "type":"int"},
                    |"nation_geom":                     {"cf":"i", "col":"ib", "type":"string"},
                    |"region_pk":                       {"cf":"j", "col":"ja", "type":"int"},
                    |"region_geom":                     {"cf":"j", "col":"jb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val dateTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, dateTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        dateTableDataFrame.createOrReplaceTempView("b")

        var dateMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |date_pk,
                |date,
                |day_of_week,
                |month,
                |year,
                |year_month_num,
                |year_month,
                |day_num_in_week,
                |day_num_in_month,
                |day_num_in_year,
                |month_num_in_year,
                |week_num_in_year,
                |selling_season,
                |last_day_in_week_fl,
                |last_day_in_month_fl,
                |holiday_fl,
                |weekday_fl,
                |customer_pk,
                |customer_name,
                |customer_address,
                |customer_city,
                |customer_nation,
                |customer_region,
                |customer_phone,
                |customer_marketing_segment,
                |customer_address_fk,
                |customer_city_fk,
                |customer_nation_fk,
                |customer_region_fk,
                |supplier_pk,
                |supplier_name,
                |supplier_address,
                |supplier_city,
                |supplier_nation,
                |supplier_region,
                |supplier_phone,
                |supplier_address_fk,
                |supplier_city_fk,
                |supplier_nation_fk,
                |supplier_region_fk,
                |part_part_pk,
                |part_name,
                |part_mfgr,
                |part_category,
                |part_brand,
                |part_color,
                |part_type,
                |part_size,
                |part_container,
                |customer_addr_pk,
                |ST_GeomFromWKT(customer_addr_geom) AS customer_addr_geom,
                |supplier_addr_pk,
                |ST_GeomFromWKT(supplier_addr_geom) AS supplier_addr_geom,
                |city_pk,
                |ST_GeomFromWKT(city_geom) AS city_geom,
                |nation_pk,
                |ST_GeomFromWKT(nation_geom) AS nation_geom,
                |region_pk,
                |ST_GeomFromWKT(region_geom) AS region_geom
            |FROM b
            """.stripMargin

        var dateSpatialTableDataFrame = session.sql(dateMakeGeomQuery)
        dateSpatialTableDataFrame.createOrReplaceTempView("b")

        var Q1 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_region,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE region_pk IS NOT NULL) j,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Contains(j.region_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   j.id = c.customer_region_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_region
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_region
            |
            """.stripMargin

        var Q2 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE nation_pk IS NOT NULL) i,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Contains(i.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   i.id = c.customer_nation_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id 
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_nation
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_nation
            |
            """.stripMargin

        var Q3 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE city_pk IS NOT NULL) h,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Contains(h.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   h.id = c.customer_city_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_city
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_city
            |
            """.stripMargin

        var Q4 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE customer_addr_pk IS NOT NULL) f,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = c.customer_address_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_address
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_address
            |
            """.stripMargin

        var Q5 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE nation_pk IS NOT NULL) i,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Contains(i.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   i.id = c.customer_nation_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation
            |
            """.stripMargin

        var Q6 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE city_pk IS NOT NULL) h,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Contains(h.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   h.id = c.customer_city_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city
            |
            """.stripMargin

        var Q7 = 
            s"""
            |
            | SELECT 
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city,
            |   c.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   (SELECT * FROM b WHERE customer_pk IS NOT NULL) c,
            |   (SELECT * FROM b WHERE customer_addr_pk IS NOT NULL) f,
            |   a,
            |   (SELECT * FROM b WHERE part_part_pk IS NOT NULL) e
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = c.customer_address_fk AND
            |   c.id = a.line_order_customer_fk AND
            |   a.line_order_part_fk = e.id
            |
            | GROUP BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city,
            |   c.customer_address
            |
            | ORDER BY
            |
            |   e.part_category,
            |   c.customer_region,
            |   c.customer_nation,
            |   c.customer_city,
            |   c.customer_address
            |
            """.stripMargin

        for ( a <- 1 to 50 ) {

            println("TIME Q1 " + a)
            session.time(session.sql(Q1).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q1-" + a))

            println("TIME Q2 " + a)
            session.time(session.sql(Q2).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q2-" + a))

            println("TIME Q3 " + a)
            session.time(session.sql(Q3).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q3-" + a))

            println("TIME Q4 " + a)
            session.time(session.sql(Q4).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q4-" + a))

            println("TIME Q5 " + a)
            session.time(session.sql(Q5).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q5-" + a))

            println("TIME Q6 " + a)
            session.time(session.sql(Q6).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q6-" + a))

            println("TIME Q7 " + a)
            session.time(session.sql(Q7).coalesce(1).write.mode("overwrite").format("csv").save("/user/mateus/results/Q7-" + a))

        }

        session.stop()

    }

}

