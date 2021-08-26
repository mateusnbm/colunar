//
// CG2-GG2-FDH-F1
//


import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator


object CG2_GG2_FDH_F1 {

    def main(args: Array[String]) {

        val session =
            SparkSession.
            builder().
            appName("CG2-GG2-FDH-F1").
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
                    |"date_date_cust_supp_part":        {"cf":"a", "col":"ar", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val lineorderTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, lineorderTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        lineorderTableDataFrame.createOrReplaceTempView("a")

        def secondLineorderTableCatalog =
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
                    |"order_date_date_pk":              {"cf":"b", "col":"ba", "type":"int"},
                    |"order_date_date":                 {"cf":"b", "col":"bb", "type":"string"},
                    |"order_date_day_of_week":          {"cf":"b", "col":"bc", "type":"string"},
                    |"order_date_month":                {"cf":"b", "col":"bd", "type":"string"},
                    |"order_date_year":                 {"cf":"b", "col":"be", "type":"int"},
                    |"order_date_year_month_num":       {"cf":"b", "col":"bf", "type":"int"},
                    |"order_date_year_month":           {"cf":"b", "col":"bg", "type":"string"},
                    |"order_date_day_num_in_week":      {"cf":"b", "col":"bh", "type":"int"},
                    |"order_date_day_num_in_month":     {"cf":"b", "col":"bi", "type":"int"},
                    |"order_date_day_num_in_year":      {"cf":"b", "col":"bj", "type":"int"},
                    |"order_date_month_num_in_year":    {"cf":"b", "col":"bk", "type":"int"},
                    |"order_date_week_num_in_year":     {"cf":"b", "col":"bl", "type":"int"},
                    |"order_date_selling_season":       {"cf":"b", "col":"bm", "type":"string"},
                    |"order_date_last_day_in_week_fl":  {"cf":"b", "col":"bn", "type":"boolean"},
                    |"order_date_last_day_in_month_fl": {"cf":"b", "col":"bo", "type":"boolean"},
                    |"order_date_holiday_fl":           {"cf":"b", "col":"bp", "type":"boolean"},
                    |"order_date_weekday_fl":           {"cf":"b", "col":"bq", "type":"boolean"},
                    |"commit_date_date_pk":             {"cf":"b", "col":"ca", "type":"int"},
                    |"commit_date_date":                {"cf":"b", "col":"cb", "type":"string"},
                    |"commit_date_day_of_week":         {"cf":"b", "col":"cc", "type":"string"},
                    |"commit_date_month":               {"cf":"b", "col":"cd", "type":"string"},
                    |"commit_date_year":                {"cf":"b", "col":"ce", "type":"int"},
                    |"commit_date_year_month_num":      {"cf":"b", "col":"cf", "type":"int"},
                    |"commit_date_year_month":          {"cf":"b", "col":"cg", "type":"string"},
                    |"commit_date_day_num_in_week":     {"cf":"b", "col":"ch", "type":"int"},
                    |"commit_date_day_num_in_month":    {"cf":"b", "col":"ci", "type":"int"},
                    |"commit_date_day_num_in_year":     {"cf":"b", "col":"cj", "type":"int"},
                    |"commit_date_month_num_in_year":   {"cf":"b", "col":"ck", "type":"int"},
                    |"commit_date_week_num_in_year":    {"cf":"b", "col":"cl", "type":"int"},
                    |"commit_date_selling_season":      {"cf":"b", "col":"cm", "type":"string"},
                    |"commit_date_last_day_in_week_fl": {"cf":"b", "col":"cn", "type":"boolean"},
                    |"commit_date_last_day_in_month_fl":{"cf":"b", "col":"co", "type":"boolean"},
                    |"commit_date_holiday_fl":          {"cf":"b", "col":"cp", "type":"boolean"},
                    |"commit_date_weekday_fl":          {"cf":"b", "col":"cq", "type":"boolean"},
                    |"customer_pk":                     {"cf":"b", "col":"da", "type":"int"},
                    |"customer_name":                   {"cf":"b", "col":"db", "type":"string"},
                    |"customer_address":                {"cf":"b", "col":"dc", "type":"string"},
                    |"customer_city":                   {"cf":"b", "col":"dd", "type":"string"},
                    |"customer_nation":                 {"cf":"b", "col":"de", "type":"string"},
                    |"customer_region":                 {"cf":"b", "col":"df", "type":"string"},
                    |"customer_phone":                  {"cf":"b", "col":"dg", "type":"string"},
                    |"customer_marketing_segment":      {"cf":"b", "col":"dh", "type":"string"},
                    |"customer_address_fk":             {"cf":"b", "col":"di", "type":"int"},
                    |"supplier_pk":                     {"cf":"b", "col":"ea", "type":"int"},
                    |"supplier_name":                   {"cf":"b", "col":"eb", "type":"string"},
                    |"supplier_address":                {"cf":"b", "col":"ec", "type":"string"},
                    |"supplier_city":                   {"cf":"b", "col":"ed", "type":"string"},
                    |"supplier_nation":                 {"cf":"b", "col":"ee", "type":"string"},
                    |"supplier_region":                 {"cf":"b", "col":"ef", "type":"string"},
                    |"supplier_phone":                  {"cf":"b", "col":"eg", "type":"string"},
                    |"supplier_address_fk":             {"cf":"b", "col":"eh", "type":"int"},
                    |"part_part_pk":                    {"cf":"b", "col":"fa", "type":"int"},
                    |"part_name":                       {"cf":"b", "col":"fb", "type":"string"},
                    |"part_mfgr":                       {"cf":"b", "col":"fc", "type":"string"},
                    |"part_category":                   {"cf":"b", "col":"fd", "type":"string"},
                    |"part_brand":                      {"cf":"b", "col":"fe", "type":"string"},
                    |"part_color":                      {"cf":"b", "col":"ff", "type":"string"},
                    |"part_type":                       {"cf":"b", "col":"fg", "type":"string"},
                    |"part_size":                       {"cf":"b", "col":"fh", "type":"int"},
                    |"part_container":                  {"cf":"b", "col":"fi", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val secondLineorderTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, secondLineorderTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        secondLineorderTableDataFrame.createOrReplaceTempView("b")

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
                    |"customer_addr_geom":              {"cf":"f", "col":"fb", "type":"string"},
                    |"city_pk":                         {"cf":"f", "col":"ha", "type":"int"},
                    |"city_geom":                       {"cf":"f", "col":"hb", "type":"string"},
                    |"nation_pk":                       {"cf":"f", "col":"ia", "type":"int"},
                    |"nation_geom":                     {"cf":"f", "col":"ib", "type":"string"},
                    |"region_pk":                       {"cf":"f", "col":"ja", "type":"int"},
                    |"region_geom":                     {"cf":"f", "col":"jb", "type":"string"}
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
                |ST_GeomFromWKT(customer_addr_geom) AS customer_addr_geom,
                |city_pk,
                |ST_GeomFromWKT(city_geom) AS city_geom,
                |nation_pk,
                |ST_GeomFromWKT(nation_geom) AS nation_geom,
                |region_pk,
                |ST_GeomFromWKT(region_geom) AS region_geom
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
                    |"supplier_addr_geom":              {"cf":"g", "col":"gb", "type":"string"},
                    |"city_pk":                         {"cf":"g", "col":"ha", "type":"int"},
                    |"city_geom":                       {"cf":"g", "col":"hb", "type":"string"},
                    |"nation_pk":                       {"cf":"g", "col":"ia", "type":"int"},
                    |"nation_geom":                     {"cf":"g", "col":"ib", "type":"string"},
                    |"region_pk":                       {"cf":"g", "col":"ja", "type":"int"},
                    |"region_geom":                     {"cf":"g", "col":"jb", "type":"string"}
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
                |ST_GeomFromWKT(supplier_addr_geom) AS supplier_addr_geom,
                |city_pk,
                |ST_GeomFromWKT(city_geom) AS city_geom,
                |nation_pk,
                |ST_GeomFromWKT(nation_geom) AS nation_geom,
                |region_pk,
                |ST_GeomFromWKT(region_geom) AS region_geom
            |FROM g
            """.stripMargin

        var supplier_addrSpatialTableDataFrame = session.sql(supplier_addrMakeGeomQuery)
        supplier_addrSpatialTableDataFrame.createOrReplaceTempView("g")

        var Q1 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_region,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Contains(f.region_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_region
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_region
            |
            """.stripMargin

        var Q2 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Contains(f.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_nation
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_nation
            |
            """.stripMargin

        var Q3 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Contains(f.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_city
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_city
            |
            """.stripMargin

        var Q4 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_address
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_address
            |
            """.stripMargin

        var Q5 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Contains(f.nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation
            |
            """.stripMargin

        var Q6 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Contains(f.city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city
            |
            """.stripMargin

        var Q7 = 
            s"""
            |
            | SELECT 
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city,
            |   b.customer_address,
            |   SUM(a.line_order_quantity)
            |
            | FROM
            |
            |   f,
            |   a,
            |   b
            |
            | WHERE
            |
            |   ST_Distance(f.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   f.id = b.customer_address_fk AND
            |   b.id = a.date_date_cust_supp_part
            |
            | GROUP BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city,
            |   b.customer_address
            |
            | ORDER BY
            |
            |   b.part_category,
            |   b.customer_region,
            |   b.customer_nation,
            |   b.customer_city,
            |   b.customer_address
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

