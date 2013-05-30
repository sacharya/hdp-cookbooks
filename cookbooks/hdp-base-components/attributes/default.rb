default[:hortonworks_hdp][:hdfs][:user] = "hdfs"
default[:hortonworks_hdp][:hadoop][:group] = "hadoop"

default[:hortonworks_hdp][:manage_all_config_files] = false
default[:hortonworks_hdp][:nofiles] = 32768
default[:hortonworks_hdp][:swapfile_location] = "/swapfile"

default[:hortonworks_hdp][:namenode][:port] = 8020
default[:hortonworks_hdp][:namenode][:safemode_min_datanodes] = 3
default[:hortonworks_hdp][:namenode][:num_dfs_replicas] = 3

default[:hortonworks_hdp][:jobtracker][:port] = 8021
