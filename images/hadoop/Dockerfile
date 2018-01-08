FROM debian:9

RUN apt-get update && DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yqq --no-install-recommends openjdk-8-jdk net-tools curl

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV HADOOP_VERSION 2.7.5
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz
RUN curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc
RUN tar -xvf /tmp/hadoop.tar.gz -C /opt/
RUN rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data


VOLUME ["/hadoop/dfs/name", "/hadoop/dfs/data", "/hadoop/logs"]

ADD run_namenode.sh /run_namenode.sh
ADD run_datanode.sh /run_datanode.sh
ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh
RUN chmod a+x /run_*node.sh

EXPOSE 50070


ENV HDFS_REPLICATION 1
ENV HDFS_BLOCKSIZE 128m
