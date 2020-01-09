FROM debian:9

RUN apt-get update && DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yqq --no-install-recommends openjdk-8-jdk net-tools curl

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.4
ENV HADOOP_VERSION=2.7

RUN apt-get install -yqq curl rsync ssh

RUN apt-get install -y wget

RUN wget -q http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark
RUN rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN cd /

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1

COPY start_slave.sh /

RUN wget -o /spark/jars/mariadb-java-client-2.2.1.jar https://downloads.mariadb.com/Connectors/java/connector-java-2.2.1/mariadb-java-client-2.2.1.jar

RUN cp /spark/conf/spark-defaults.conf.template /spark/conf/spark-defaults.conf
RUN echo 'spark.driver.extraClassPath /spark/jars/mariadb-java-client-2.2.1.jar' >> /spark/conf/spark-defaults.conf
RUN echo 'spark.executor.extraClassPath /spark/jars/mariadb-java-client-2.2.1.jar' >> /spark/conf/spark-defaults.conf
