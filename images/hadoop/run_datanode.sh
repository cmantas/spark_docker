#!/bin/bash

datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

LOG=/hadoop/logs/datanode.log
echo Starting DataNode, output in $LOG
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode &>> $LOG
