from pyspark.sql import SparkSession
# Adiciona o operador add
from operator import add
# importar o módulo regex
import re

sc = spark.sparkContext
file_in = sc.textFile('<file-path>/sherlock.txt')

# Contar quantas palavras temos
words = file_in.flatMap(lambda line: re.split('\W+', line.lower().strip()))
# Fazer com que cada palavra tenha o valor 1
words = words.map(lambda w: (w,1))
# Reduzir para o total
words = words.reduceByKey(add).map(lambda x: (x[1], x[0])).sortByKey(False)

for word in words.collect():
    print(word)

#Salva o resultado na pasta designada
words.saveAsTextFile("<output-path>")