
import spark.implicits._
import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog

val spark = SparkSession.
  builder().
  appName("HBaseSourceExample").
  getOrCreate()

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
      |"BIRTH_LON":{"cf":"cf", "col":"BIRTH_LON", "type":"string"}
      |}
      |}""".stripMargin

val df = spark.read.option(HBaseTableCatalog.tableCatalog, catalog).format("org.apache.spark.sql.execution.datasources.hbase").load()

df.show()
