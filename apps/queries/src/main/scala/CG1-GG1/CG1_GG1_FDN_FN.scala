//
// CG1-GG1-FDN-FN
//


import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator


object CG1_GG1_FDN_FN {

    def main(args: Array[String]) {

        val session =
            SparkSession.
            builder().
            appName("CG1-GG1-FDN-FN").
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
                    |"line_order_customer_fk":          {"cf":"a", "col":"ac", "type":"int"},
                    |"line_order_part_fk":              {"cf":"a", "col":"ad", "type":"int"},
                    |"line_order_supplier_fk":          {"cf":"a", "col":"ae", "type":"int"},
                    |"line_order_order_date_fk":        {"cf":"a", "col":"af", "type":"int"},
                    |"line_order_order_priority":       {"cf":"a", "col":"ag", "type":"string"},
                    |"line_order_shipping_priority":    {"cf":"a", "col":"ah", "type":"string"},
                    |"line_order_quantity":             {"cf":"a", "col":"ai", "type":"int"},
                    |"line_order_extended_price":       {"cf":"a", "col":"aj", "type":"int"},
                    |"line_order_order_total_price":    {"cf":"a", "col":"ak", "type":"int"},
                    |"line_order_discount":             {"cf":"a", "col":"al", "type":"int"},
                    |"line_order_revenue":              {"cf":"a", "col":"am", "type":"int"},
                    |"line_order_supply_cost":          {"cf":"a", "col":"an", "type":"int"},
                    |"line_order_tax":                  {"cf":"a", "col":"ao", "type":"int"},
                    |"line_order_commit_date_fk":       {"cf":"a", "col":"ap", "type":"int"},
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
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
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
                    |"weekday_fl":                      {"cf":"b", "col":"bq", "type":"boolean"}
                    |
                |}
            |}""".stripMargin

        val dateTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, dateTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        dateTableDataFrame.createOrReplaceTempView("b")

        def customerTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"c"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"customer_name":                   {"cf":"c", "col":"cb", "type":"string"},
                    |"customer_address":                {"cf":"c", "col":"cc", "type":"string"},
                    |"customer_city":                   {"cf":"c", "col":"cd", "type":"string"},
                    |"customer_nation":                 {"cf":"c", "col":"ce", "type":"string"},
                    |"customer_region":                 {"cf":"c", "col":"cf", "type":"string"},
                    |"customer_phone":                  {"cf":"c", "col":"cg", "type":"string"},
                    |"customer_marketing_segment":      {"cf":"c", "col":"ch", "type":"string"},
                    |"customer_addr_fk":                {"cf":"f", "col":"fa", "type":"int"},
                    |"customer_addr_geom":              {"cf":"f", "col":"fb", "type":"string"},
                    |"customer_city_fk":                {"cf":"h", "col":"ha", "type":"int"},
                    |"customer_city_geom":              {"cf":"h", "col":"hb", "type":"string"},
                    |"customer_nation_fk":              {"cf":"i", "col":"ia", "type":"int"},
                    |"customer_nation_geom":            {"cf":"i", "col":"ib", "type":"string"},
                    |"customer_region_fk":              {"cf":"j", "col":"ja", "type":"int"},
                    |"customer_region_geom":            {"cf":"j", "col":"jb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val customerTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, customerTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        customerTableDataFrame.createOrReplaceTempView("c")

        var customerMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |customer_name,
                |customer_address,
                |customer_city,
                |customer_nation,
                |customer_region,
                |customer_phone,
                |customer_marketing_segment,
                |customer_addr_fk,
                |ST_GeomFromWKT(customer_addr_geom) AS customer_addr_geom,
                |customer_city_fk,
                |ST_GeomFromWKT(customer_city_geom) AS customer_city_geom,
                |customer_nation_fk,
                |ST_GeomFromWKT(customer_nation_geom) AS customer_nation_geom,
                |customer_region_fk,
                |ST_GeomFromWKT(customer_region_geom) AS customer_region_geom
            |FROM c
            """.stripMargin

        var customerSpatialTableDataFrame = session.sql(customerMakeGeomQuery)
        customerSpatialTableDataFrame.createOrReplaceTempView("c")

        def supplierTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"d"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"supplier_name":                   {"cf":"d", "col":"db", "type":"string"},
                    |"supplier_address":                {"cf":"d", "col":"dc", "type":"string"},
                    |"supplier_city":                   {"cf":"d", "col":"dd", "type":"string"},
                    |"supplier_nation":                 {"cf":"d", "col":"de", "type":"string"},
                    |"supplier_region":                 {"cf":"d", "col":"df", "type":"string"},
                    |"supplier_phone":                  {"cf":"d", "col":"dg", "type":"string"},
                    |"supplier_addr_fk":                {"cf":"g", "col":"ga", "type":"int"},
                    |"supplier_addr_geom":              {"cf":"g", "col":"gb", "type":"string"},
                    |"supplier_city_pk":                {"cf":"h", "col":"ha", "type":"int"},
                    |"supplier_city_geom":              {"cf":"h", "col":"hb", "type":"string"},
                    |"supplier_nation_pk":              {"cf":"i", "col":"ia", "type":"int"},
                    |"supplier_nation_geom":            {"cf":"i", "col":"ib", "type":"string"},
                    |"supplier_region_pk":              {"cf":"j", "col":"ja", "type":"int"},
                    |"supplier_region_geom":            {"cf":"j", "col":"jb", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val supplierTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, supplierTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        supplierTableDataFrame.createOrReplaceTempView("d")

        var supplierMakeGeomQuery = 
            s"""
            |SELECT
                |id,
                |supplier_name,
                |supplier_address,
                |supplier_city,
                |supplier_nation,
                |supplier_region,
                |supplier_phone,
                |supplier_addr_fk,
                |ST_GeomFromWKT(supplier_addr_geom) AS supplier_addr_geom,
                |supplier_city_pk,
                |ST_GeomFromWKT(supplier_city_geom) AS supplier_city_geom,
                |supplier_nation_pk,
                |ST_GeomFromWKT(supplier_nation_geom) AS supplier_nation_geom,
                |supplier_region_pk,
                |ST_GeomFromWKT(supplier_region_geom) AS supplier_region_geom
            |FROM d
            """.stripMargin

        var supplierSpatialTableDataFrame = session.sql(supplierMakeGeomQuery)
        supplierSpatialTableDataFrame.createOrReplaceTempView("d")

        def partTableCatalog =
            s"""{
                |"table":{
                    |"namespace":"default",
                    |"name":"e"
                |},
                |"rowkey":"key",
                |"columns":{
                    |
                    |"id":                              {"cf":"rowkey", "col":"key", "type":"int"},
                    |
                    |"part_name":                       {"cf":"e", "col":"eb", "type":"string"},
                    |"part_mfgr":                       {"cf":"e", "col":"ec", "type":"string"},
                    |"part_category":                   {"cf":"e", "col":"ed", "type":"string"},
                    |"part_brand":                      {"cf":"e", "col":"ee", "type":"string"},
                    |"part_color":                      {"cf":"e", "col":"ef", "type":"string"},
                    |"part_type":                       {"cf":"e", "col":"eg", "type":"string"},
                    |"part_size":                       {"cf":"e", "col":"eh", "type":"int"},
                    |"part_container":                  {"cf":"e", "col":"ei", "type":"string"}
                    |
                |}
            |}""".stripMargin

        val partTableDataFrame = 
            session.
            read.option(HBaseTableCatalog.tableCatalog, partTableCatalog).
            format("org.apache.spark.sql.execution.datasources.hbase").
            load()

        partTableDataFrame.createOrReplaceTempView("e")
        

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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Contains(c.customer_region_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Contains(c.customer_nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Contains(c.customer_city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Distance(c.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Contains(c.customer_nation_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Contains(c.customer_city_geom, ST_GeomFromText('POINT(-87.42 41.24)')) AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
            |   c,
            |   a,
            |   e
            |
            | WHERE
            |
            |   ST_Distance(c.customer_addr_geom, ST_GeomFromText('POINT(-87.42 41.24)')) <= 0.18 AND
            |   c.id = a.line_order_customer_fk AND
            |   e.id = a.line_order_part_fk
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
