//
// CG2-GG1-FDD-F1
//


import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator


object CG2_GG1_FDD_F1 {

    def main(args: Array[String]) {

        val session =
            SparkSession.
            builder().
            appName("CG2-GG1-FDD-F1").
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
                    |"line_order_order_priority":       {"cf":"a", "col":"ag", "type":"string"},
                    |"line_order_shipping_priority":    {"cf":"a", "col":"ah", "type":"string"},
                    |"line_order_quantity":             {"cf":"a", "col":"ai", "type":"int"},
                    |"line_order_extended_price":       {"cf":"a", "col":"aj", "type":"int"},
                    |"line_order_order_total_price":    {"cf":"a", "col":"ak", "type":"int"},
                    |"line_order_discount":             {"cf":"a", "col":"al", "type":"int"},
                    |"line_order_revenue":              {"cf":"a", "col":"am", "type":"int"},
                    |"line_order_supply_cost":          {"cf":"a", "col":"an", "type":"int"},
                    |"line_order_tax":                  {"cf":"a", "col":"ao", "type":"int"},
                    |"line_order_shipping_mode":        {"cf":"a", "col":"aq", "type":"string"},
                    |"order_date_date_pk":              {"cf":"a", "col":"ba", "type":"int"},
                    |"order_date_date":                 {"cf":"a", "col":"bb", "type":"string"},
                    |"order_date_day_of_week":          {"cf":"a", "col":"bc", "type":"string"},
                    |"order_date_month":                {"cf":"a", "col":"bd", "type":"string"},
                    |"order_date_year":                 {"cf":"a", "col":"be", "type":"int"},
                    |"order_date_year_month_num":       {"cf":"a", "col":"bf", "type":"int"},
                    |"order_date_year_month":           {"cf":"a", "col":"bg", "type":"string"},
                    |"order_date_day_num_in_week":      {"cf":"a", "col":"bh", "type":"int"},
                    |"order_date_day_num_in_month":     {"cf":"a", "col":"bi", "type":"int"},
                    |"order_date_day_num_in_year":      {"cf":"a", "col":"bj", "type":"int"},
                    |"order_date_month_num_in_year":    {"cf":"a", "col":"bk", "type":"int"},
                    |"order_date_week_num_in_year":     {"cf":"a", "col":"bl", "type":"int"},
                    |"order_date_selling_season":       {"cf":"a", "col":"bm", "type":"string"},
                    |"order_date_last_day_in_week_fl":  {"cf":"a", "col":"bn", "type":"boolean"},
                    |"order_date_last_day_in_month_fl": {"cf":"a", "col":"bo", "type":"boolean"},
                    |"order_date_holiday_fl":           {"cf":"a", "col":"bp", "type":"boolean"},
                    |"order_date_weekday_fl":           {"cf":"a", "col":"bq", "type":"boolean"},
                    |"commit_date_date_pk":             {"cf":"a", "col":"ca", "type":"int"},
                    |"commit_date_date":                {"cf":"a", "col":"cb", "type":"string"},
                    |"commit_date_day_of_week":         {"cf":"a", "col":"cc", "type":"string"},
                    |"commit_date_month":               {"cf":"a", "col":"cd", "type":"string"},
                    |"commit_date_year":                {"cf":"a", "col":"ce", "type":"int"},
                    |"commit_date_year_month_num":      {"cf":"a", "col":"cf", "type":"int"},
                    |"commit_date_year_month":          {"cf":"a", "col":"cg", "type":"string"},
                    |"commit_date_day_num_in_week":     {"cf":"a", "col":"ch", "type":"int"},
                    |"commit_date_day_num_in_month":    {"cf":"a", "col":"ci", "type":"int"},
                    |"commit_date_day_num_in_year":     {"cf":"a", "col":"cj", "type":"int"},
                    |"commit_date_month_num_in_year":   {"cf":"a", "col":"ck", "type":"int"},
                    |"commit_date_week_num_in_year":    {"cf":"a", "col":"cl", "type":"int"},
                    |"commit_date_selling_season":      {"cf":"a", "col":"cm", "type":"string"},
                    |"commit_date_last_day_in_week_fl": {"cf":"a", "col":"cn", "type":"boolean"},
                    |"commit_date_last_day_in_month_fl":{"cf":"a", "col":"co", "type":"boolean"},
                    |"commit_date_holiday_fl":          {"cf":"a", "col":"cp", "type":"boolean"},
                    |"commit_date_weekday_fl":          {"cf":"a", "col":"cq", "type":"boolean"},
                    |"customer_pk":                     {"cf":"a", "col":"da", "type":"int"},
                    |"customer_name":                   {"cf":"a", "col":"db", "type":"string"},
                    |"customer_address":                {"cf":"a", "col":"dc", "type":"string"},
                    |"customer_city":                   {"cf":"a", "col":"dd", "type":"string"},
                    |"customer_nation":                 {"cf":"a", "col":"de", "type":"string"},
                    |"customer_region":                 {"cf":"a", "col":"df", "type":"string"},
                    |"customer_phone":                  {"cf":"a", "col":"dg", "type":"string"},
                    |"customer_marketing_segment":      {"cf":"a", "col":"dh", "type":"string"},
                    |"customer_address_fk":             {"cf":"a", "col":"di", "type":"int"},
                    |"customer_city_fk":                {"cf":"a", "col":"dj", "type":"int"},
                    |"customer_nation_fk":              {"cf":"a", "col":"dk", "type":"int"},
                    |"customer_region_fk":              {"cf":"a", "col":"dl", "type":"int"},
                    |"supplier_pk":                     {"cf":"a", "col":"ea", "type":"int"},
                    |"supplier_name":                   {"cf":"a", "col":"eb", "type":"string"},
                    |"supplier_address":                {"cf":"a", "col":"ec", "type":"string"},
                    |"supplier_city":                   {"cf":"a", "col":"ed", "type":"string"},
                    |"supplier_nation":                 {"cf":"a", "col":"ee", "type":"string"},
                    |"supplier_region":                 {"cf":"a", "col":"ef", "type":"string"},
                    |"supplier_phone":                  {"cf":"a", "col":"eg", "type":"string"},
                    |"supplier_address_fk":             {"cf":"a", "col":"eh", "type":"int"},
                    |"supplier_city_fk":                {"cf":"a", "col":"ei", "type":"int"},
                    |"supplier_nation_fk":              {"cf":"a", "col":"ej", "type":"int"},
                    |"supplier_region_fk":              {"cf":"a", "col":"ek", "type":"int"},
                    |"part_part_pk":                    {"cf":"a", "col":"fa", "type":"int"},
                    |"part_name":                       {"cf":"a", "col":"fb", "type":"string"},
                    |"part_mfgr":                       {"cf":"a", "col":"fc", "type":"string"},
                    |"part_category":                   {"cf":"a", "col":"fd", "type":"string"},
                    |"part_brand":                      {"cf":"a", "col":"fe", "type":"string"},
                    |"part_color":                      {"cf":"a", "col":"ff", "type":"string"},
                    |"part_type":                       {"cf":"a", "col":"fg", "type":"string"},
                    |"part_size":                       {"cf":"a", "col":"fh", "type":"int"},
                    |"part_container":                  {"cf":"a", "col":"fi", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val lineorderTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, lineorderTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        lineorderTableDataFrame.createOrReplaceTempView("a")

        def customer_addrTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"f"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"customer_addr_geom":              {"cf":"f", "col":"fb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val customer_addrTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, customer_addrTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        customer_addrTableDataFrame.createOrReplaceTempView("f")

        var customer_addrMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |ST_GeomFromWKT(customer_addr_geom) AS customer_addr_geom
            |FROM f
            """.stripMargin

        var customer_addrSpatialTableDataFrame = session.sql(customer_addrMakeGeomQuery)
        customer_addrSpatialTableDataFrame.createOrReplaceTempView("f")

        def supplier_addrTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"g"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"supplier_addr_geom":              {"cf":"g", "col":"gb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val supplier_addrTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, supplier_addrTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        supplier_addrTableDataFrame.createOrReplaceTempView("g")

        var supplier_addrMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |ST_GeomFromWKT(supplier_addr_geom) AS supplier_addr_geom
            |FROM g
            """.stripMargin

        var supplier_addrSpatialTableDataFrame = session.sql(supplier_addrMakeGeomQuery)
        supplier_addrSpatialTableDataFrame.createOrReplaceTempView("g")

        def cityTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"h"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"city_geom":                       {"cf":"h", "col":"hb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val cityTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, cityTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        cityTableDataFrame.createOrReplaceTempView("h")

        var cityMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |ST_GeomFromWKT(city_geom) AS city_geom
            |FROM h
            """.stripMargin

        var citySpatialTableDataFrame = session.sql(cityMakeGeomQuery)
        citySpatialTableDataFrame.createOrReplaceTempView("h")

        def nationTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"i"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"nation_geom":                     {"cf":"i", "col":"ib", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val nationTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, nationTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        nationTableDataFrame.createOrReplaceTempView("i")

        var nationMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |ST_GeomFromWKT(nation_geom) AS nation_geom
            |FROM i
            """.stripMargin

        var nationSpatialTableDataFrame = session.sql(nationMakeGeomQuery)
        nationSpatialTableDataFrame.createOrReplaceTempView("i")

        def regionTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"j"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"region_geom":                     {"cf":"j", "col":"jb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val regionTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, regionTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        regionTableDataFrame.createOrReplaceTempView("j")

        var regionMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |ST_GeomFromWKT(region_geom) AS region_geom
            |FROM j
            """.stripMargin

        var regionSpatialTableDataFrame = session.sql(regionMakeGeomQuery)
        regionSpatialTableDataFrame.createOrReplaceTempView("j")

        var Q1 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_region,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   j,
            |   a
            |
            | WHERE
            |
            |   ST_Contains(j.region_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   j.id = a.customer_region_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_region
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_region
            |
            """.stripMargin

        var Q2 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   i,
            |   a
            |
            | WHERE
            |
            |   ST_Contains(i.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   i.id = a.customer_nation_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_nation
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_nation
            |
            """.stripMargin

        var Q3 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   h,
            |   a
            |
            | WHERE
            |
            |   ST_Contains(h.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   h.id = a.customer_city_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_city
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_city
            |
            """.stripMargin

        var Q4 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = a.customer_address_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_address
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_address
            |
            """.stripMargin

        var Q5 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   i,
            |   a
            |
            | WHERE
            |
            |   ST_Contains(i.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   i.id = a.customer_nation_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation
            |
            """.stripMargin

        var Q6 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   h,
            |   a
            |
            | WHERE
            |
            |   ST_Contains(h.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   h.id = a.customer_city_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city
            |
            """.stripMargin

        var Q7 = 
            s"""
            |
            | SELECT 
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city,
            |   a.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = a.customer_address_fk
            |
            | GROUP BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city,
            |   a.customer_address
            |
            | ORDER BY
            |
            |   a.part_category,
            |   a.customer_region,
            |   a.customer_nation,
            |   a.customer_city,
            |   a.customer_address
            |
            """.stripMargin

        for ( a <- 1 to 5 ) {

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

