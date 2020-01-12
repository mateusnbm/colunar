
import spark.implicits._
import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator

val spark = SparkSession.
    builder().
    appName("HBaseSourceExample").
    config("spark.serializer", classOf[KryoSerializer].getName).
    config("spark.kryo.registrator", classOf[GeoSparkVizKryoRegistrator].getName).
    getOrCreate()

GeoSparkSQLRegistrator.registerAll(spark)

def catalog =
  s"""{
      |"table":{"namespace":"default", "name":"people"},
      |"rowkey":"key",
      |"columns":{
      |"PID":{"cf":"rowkey", "col":"key", "type":"string"},
      |"NAME":{"cf":"cf", "col":"NAME", "type":"string"},
      |"SURNAME":{"cf":"cf", "col":"SURNAME", "type":"string"},
      |"BIRTHDAY":{"cf":"cf", "col":"BIRTHDAY", "type":"string"},
      |"BIRTH_LAT":{"cf":"cf", "col":"BIRTH_LAT", "type":"string"},
      |"BIRTH_LON":{"cf":"cf", "col":"BIRTH_LON", "type":"string"},
      |"BIRTH_POINT":{"cf":"cf", "col":"BIRTH_POINT", "type":"string"}
      |}
      |}""".stripMargin

val df = spark.read.option(HBaseTableCatalog.tableCatalog, catalog).format("org.apache.spark.sql.execution.datasources.hbase").load()
df.createOrReplaceTempView("df")
df.show()

var cq = 
    s"""
        |SELECT PID, NAME, SURNAME, BIRTHDAY, BIRTH_LAT, BIRTH_LON, ST_GeomFromWKT(BIRTH_POINT) AS BIRTH_POINT
        |FROM df
    """.stripMargin

var spatialDf = spark.sql(cq)
spatialDf.createOrReplaceTempView("spatialdf")
spatialDf.printSchema()
spatialDf.show()

var query_1 = "SELECT NAME, BIRTH_POINT, ST_Distance (BIRTH_POINT, ST_GeomFromWKT('POINT(-45.7780 -12.2368)')  ) AS DIST FROM spatialdf"
var query_1_df = spark.sql(query_1)
query_1_df.createOrReplaceTempView("query_1_df")
query_1_df.show()

