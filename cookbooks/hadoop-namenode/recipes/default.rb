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
  notifies :create, "ruby_block[format hdfs run flag]", :immediately
  not_if do
    node[:hortonworks_hdp][:hdfs_format_complete] == true
  end
end

ruby_block "format hdfs run flag" do
  block do
    node.set[:hortonworks_hdp][:hdfs_format_complete] = true
    node.save
  end
  action :nothing
end

service "hadoop-namenode" do
  action [ :enable, :start ]
end
