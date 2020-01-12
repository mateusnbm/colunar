
import spark.implicits._
import org.apache.spark.sql.functions._
import org.apache.spark.sql.SparkSession
import org.apache.spark.serializer.KryoSerializer
import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog
import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator
import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator

val session = 
    SparkSession.
    builder().
    appName("GeosparkSample").
    config("spark.serializer", classOf[KryoSerializer].getName).
    config("spark.kryo.registrator", classOf[GeoSparkVizKryoRegistrator].getName).
    getOrCreate()

GeoSparkSQLRegistrator.registerAll(session)

def peopleCatalog =
    s"""{
        |"table":{
            |"namespace":"default", 
            |"name":"people"
        |},
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

def countriesCatalog =
    s"""{
        |"table":{
            |"namespace":"default", 
            |"name":"countries"
        |},
        |"rowkey":"key",
        |"columns":{
            |"ID":{"cf":"rowkey", "col":"key", "type":"string"},
            |"ISO":{"cf":"cf", "col":"ISO", "type":"string"},
            |"NAME":{"cf":"cf", "col":"NAME", "type":"string"},
            |"GEOM":{"cf":"cf", "col":"GEOM", "type":"string"}
        |}
    |}""".stripMargin

def statesCatalog =
    s"""{
        |"table":{
            |"namespace":"default", 
            |"name":"states"
        |},
        |"rowkey":"key",
        |"columns":{
            |"ID":{"cf":"rowkey", "col":"key", "type":"string"},
            |"NAME":{"cf":"cf", "col":"NAME", "type":"string"},
            |"COUNTRY_ISO":{"cf":"cf", "col":"COUNTRY_ISO", "type":"string"},
            |"COUNTRY_NAME":{"cf":"cf", "col":"COUNTRY_NAME", "type":"string"},
            |"GEOM":{"cf":"cf", "col":"GEOM", "type":"string"}
        |}
    |}""".stripMargin

val peopleDataframe = 
    session.
    read.option(HBaseTableCatalog.tableCatalog, peopleCatalog).
    format("org.apache.spark.sql.execution.datasources.hbase").
    load()

val countriesDataframe = 
    session.
    read.option(HBaseTableCatalog.tableCatalog, countriesCatalog).
    format("org.apache.spark.sql.execution.datasources.hbase").
    load()

val statesDataframe = 
    session.
    read.option(HBaseTableCatalog.tableCatalog, statesCatalog).
    format("org.apache.spark.sql.execution.datasources.hbase").
    load()

peopleDataframe.createOrReplaceTempView("peopleDataframe")
countriesDataframe.createOrReplaceTempView("countriesDataframe")
statesDataframe.createOrReplaceTempView("statesDataframe")

peopleDataframe.show()
countriesDataframe.show()
statesDataframe.show()

var peopleMakeGeomQuery = 
    s"""
    |SELECT 
        |PID, 
        |NAME, 
        |SURNAME, 
        |BIRTHDAY, 
        |BIRTH_LAT, 
        |BIRTH_LON, 
        |ST_GeomFromWKT(BIRTH_POINT) AS BIRTH_POINT
    |FROM peopleDataframe
    """.stripMargin

var countriesMakeGeomQuery = 
    s"""
    |SELECT 
        |ID, 
        |ISO, 
        |NAME, 
        |ST_GeomFromWKT(GEOM) AS GEOM
    |FROM countriesDataframe
    """.stripMargin

var statesMakeGeomQuery = 
    s"""
    |SELECT 
        |ID, 
        |NAME, 
        |COUNTRY_ISO, 
        |COUNTRY_NAME, 
        |ST_GeomFromWKT(GEOM) AS GEOM
    |FROM statesDataframe
    """.stripMargin

var spatialPeopleDataframe = session.sql(peopleMakeGeomQuery)
var spatialCountriesDataframe = session.sql(countriesMakeGeomQuery)
var spatialStatesDataframe = session.sql(statesMakeGeomQuery)

spatialPeopleDataframe.createOrReplaceTempView("spatialPeopleDataframe")
spatialPeopleDataframe.printSchema()
spatialPeopleDataframe.show()

spatialCountriesDataframe.createOrReplaceTempView("spatialCountriesDataframe")
spatialCountriesDataframe.printSchema()
spatialCountriesDataframe.show()

spatialStatesDataframe.createOrReplaceTempView("spatialStatesDataframe")
spatialStatesDataframe.printSchema()
spatialStatesDataframe.show()

var birthsPerStateQuery = 
    s"""
    |SELECT 
        |S.COUNTRY_NAME,
        |S.NAME, 
        |COUNT(*) AS BIRTHS
    |FROM
        |spatialPeopleDataframe P,
        |spatialStatesDataframe S
    |WHERE
        |ST_Contains(S.GEOM, P.BIRTH_POINT)
    |GROUP BY
        |S.COUNTRY_NAME,
        |S.NAME
    |ORDER BY S.NAME ASC
    """.stripMargin

session.sql(birthsPerStateQuery).show()
