#
# Cookbook Name:: hadoop-namenode
# Recipe:: default
#
# Copyright 2012, chalupaul
#
# All rights reserved - Do Not Redistribute
#

package "hadoop-namenode" do
  action :install
end

execute "format hdfs" do
  command "su - hdfs -c '/usr/lib/hadoop/bin/hadoop namenode -format'"
  not_if do
    ::File.exists?('/var/lib/hadoop/cache/hadoop/dfs/name')
  end
end

service "hadoop-namenode" do
  action [ :enable, :start ]
end
