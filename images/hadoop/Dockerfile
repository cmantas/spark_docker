FROM bde2020/hadoop-base:1.1.0-hadoop2.7.1-java8
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data


VOLUME ["/hadoop/dfs/name", "/hadoop/dfs/data", "/hadoop/logs"]

ADD run_namenode.sh /run_namenode.sh
ADD run_datanode.sh /run_datanode.sh

RUN chmod a+x /run_*node.sh

EXPOSE 50070
