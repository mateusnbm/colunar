# COMBINAR SSB COM GEO

1. Rodar o dbgen do SSB com o fator de escala desejado.

2. Colocar as tabelas do SSB na pasta "data_ssb".

3. Baixar os scripts SQL que geram cidades, nações e regiões no portal do Spadawan e colocar os arquivos na pasta "scripts".

4. Executar o programa "format.py" converter os scripts SQL em tabelas no formato CSV. As tabelas são salvas na pasta "data_geo".

5. Executar o programa "addresses.py". Para cada cliente e consumidor, ele escolhe um ponto qualquer dentro da geometria da cidade relacionada e gera uma lista relacionamento a entidade com o ponto. São geradas duas tabelas intituladas "customer_addr.tbl" e "supplier_addr.tbl" dentro da pasta "data_geo".

6. Executar o programa "merge.py". Ele imita os comandos do script "scripts/alter_hybrid.sql". São removidos dados descritivos de tabelas geoespaciais e as tabelas de clientes e fornecedores são alteradas para terem chaves estrangeiras para as tabelas de endereços, cidades, nações e regiões. Os dados finais são salvos na pasta "data_ssb_geo".

# GERAR MODELOS

1. Especificar transformações em arquivos JSON (exemplos na pasta "models").

2. Especificar o caminho do arquivo de transformações no programa "transform.py".

3. Executar o programa "transform.py".

4. Os arquivos prontos para inserção direta no HBase serão armazenados na pasta "data_hbase".
