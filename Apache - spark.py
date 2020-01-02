Apache Spark is a fast (in memory) data processing engine which allows to:
- Data classification through Spark machine learning
- Streaming data through source via Spark Streaming
- Querying data in real time throgh Spark SQL

Spark is built on the top of Scala programming language, which runs on the Java Virtual Machine

Spark runs computations in memory

sc = SparkContext ("local[3]","word count") - Is the entrypoint to the spark core
spark app is named "word count"
local[3] - local box that can use up to 3 cores of our cpu
lines = sc.textFile("text file") - this is an rdd
