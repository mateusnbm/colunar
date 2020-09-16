#
# zqueries.py
#


import os
import sys
import json
import time

tf_path = './models/roberio/M4-B-G1.json'
tf_file = open(tf_path, 'r')
tf_data = json.load(tf_file)
tf_file.close()

print(tf_path + '\n')

for transform_i, transform in enumerate(tf_data):

    scala_tables = {}

    transform_id = transform['transform_id']
    transform_path = ('./data_hbase/' + transform_id + '/')
    transform_tables = transform['transform_tables']

    for table_i, table in enumerate(transform_tables):

        table_name = table['table_name']
        table_name_ssb = table['table_name_ssb']
        table_column_families_data = table['table_column_families_data']
        table_rk_surrogate = table['table_row_key']['surrogate']

        if table_name not in scala_tables:

            scala_tables[table_name] = {'ssb_name': table_name_ssb, 'columns': {}}

        for cf_i, cf in enumerate(table_column_families_data):

            cf_name = cf['column_f_name']
            cf_columns = cf['column_f_columns']

            for c_i, c in enumerate(cf_columns):

                c_disposable = False
                c_name = c['column_name']
                c_desc = c['column_desc']
                c_datatype = c['column_datatype']
                c_ssb_table_name = c['ssb_table_name']
                c_ssb_column_index = c['ssb_column_index']

                if 'column_disposable' not in c or c['column_disposable'] == False:

                    if c_name not in scala_tables[table_name]['columns']:

                        scala_tables[table_name]['columns'][c_name] = [c_desc, cf_name, c_name, c_datatype]


    schema_path = ('./data_hbase/' + transform_id + '/queries.txt')
    schema_file = open(schema_path, 'w+')

    schema_file.write('import spark.implicits._\n')
    schema_file.write('import org.apache.spark.sql.functions._\n')
    schema_file.write('import org.apache.spark.sql.SparkSession\n')
    schema_file.write('import org.apache.spark.serializer.KryoSerializer\n')
    schema_file.write('import org.apache.hadoop.hbase.spark.datasources.HBaseTableCatalog\n')
    schema_file.write('import org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator\n')
    schema_file.write('import org.datasyslab.geosparkviz.core.Serde.GeoSparkVizKryoRegistrator\n\n')
    schema_file.write('val session =\n    SparkSession.\n    builder().\n    appName("GeosparkSample").\n    config("spark.serializer", classOf[KryoSerializer].getName).\n    config("spark.kryo.registrator", classOf[GeoSparkVizKryoRegistrator].getName).\n    getOrCreate()\n\n')
    schema_file.write('GeoSparkSQLRegistrator.registerAll(session)\n\n')

    for name, data in scala_tables.items():

        has_geo_cols = False
        columns_checklist = []

        table_name_ssb = data['ssb_name']

        schema_file.write('def ' + table_name_ssb + 'TableCatalog =\n')
        schema_file.write('    s"""{\n')
        schema_file.write('        |"table":{\n')
        schema_file.write('            |"namespace":"default",\n')
        schema_file.write('            |"name":"' + name + '"\n')
        schema_file.write('        |},\n')
        schema_file.write('        |"rowkey":"key",\n')
        schema_file.write('        |"columns":{\n')
        schema_file.write('            |\n')
        schema_file.write('            |"id":' + (' ' * 30) + '{"cf":"rowkey", "col":"key", "type":"string"},\n')
        schema_file.write('            |\n')

        for column in data['columns'].values():

            col_new_name = column[0]
            col_cf_name  = column[1]
            col_raw_name = column[2]
            col_datatype = column[3]

            l = 32 - len(col_new_name)

            schema_file.write('            |"' + col_new_name + '":')
            schema_file.write(' ' * l)
            schema_file.write('{"cf":"' + col_cf_name + '", "col":"' + col_raw_name +'", "type":"' + col_datatype + '"}')

            if col_new_name != list(data['columns'].values())[-1][0]:

                schema_file.write(',')

            schema_file.write('\n')

            if col_new_name[-4:] == 'geom':
                has_geo_cols = True
                columns_checklist.append([col_new_name, True])
            else:
                columns_checklist.append([col_new_name, False])


        schema_file.write('            |\n')
        schema_file.write('        |}\n')
        schema_file.write('    |}""".stripMargin\n')
        schema_file.write('\n')

        schema_file.write('val ' + table_name_ssb + 'TableDataFrame = \n')
        schema_file.write('    session.\n')
        schema_file.write('    read.option(HBaseTableCatalog.tableCatalog, ' + table_name_ssb + 'TableCatalog).\n')
        schema_file.write('    format("org.apache.spark.sql.execution.datasources.hbase").\n')
        schema_file.write('    load()\n\n')

        schema_file.write(table_name_ssb + 'TableDataFrame.createOrReplaceTempView("' + name + '")\n')
        schema_file.write(table_name_ssb + 'TableDataFrame.show()\n\n')

        if has_geo_cols == True:

            schema_file.write('var ' + table_name_ssb + 'MakeGeomQuery = \n')
            schema_file.write('    s"""\n')
            schema_file.write('    |SELECT\n')

            for col_new_name, is_geo in columns_checklist:

                if is_geo == True:
                    schema_file.write('        |ST_GeomFromWKT(' + col_new_name + ') AS ' + col_new_name)
                else:
                    schema_file.write('        |' + col_new_name)

                if col_new_name != columns_checklist[-1][0]:
                    schema_file.write(',')
                schema_file.write('\n')

            schema_file.write('    |FROM ' + name + '\n')
            schema_file.write('    """.stripMargin\n')
            schema_file.write('\n')

            schema_file.write('var ' + table_name_ssb + 'SpatialTableDataFrame = session.sql(' + table_name_ssb + 'MakeGeomQuery)\n')
            schema_file.write(table_name_ssb + 'SpatialTableDataFrame.createOrReplaceTempView("' + name + '")\n')
            schema_file.write(table_name_ssb + 'SpatialTableDataFrame.printSchema()\n')
            schema_file.write(table_name_ssb + 'SpatialTableDataFrame.show()\n\n')

    schema_file.close()
