#
# Cookbook Name:: pig
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "pig" do
  action :install
end

directory "/etc/pig/conf.chef" do
  owner node.hortonworks_hdp.hdfs.user
  group node.hortonworks_hdp.hadoop.group
  mode "0755"
  action :create
end

execute "alternatives configured confdir" do
  command "alternatives --install /etc/pig/conf pig-conf /etc/pig/conf.chef 90"
  not_if do
    ::File.readlink("/etc/alternatives/pig-conf") == "/etc/pig/conf.chef"
  end
end

%w'pig-env.sh
pig.properties
log4j.properties'.each do | f |
    template "/etc/pig/conf.chef/#{f}" do
	source "#{f}.erb"
	mode 0755
	user node.hortonworks_hdp.hdfs.user
	group node.hortonworks_hdp.hadoop.group
	only_if do
	    not ::File.exists?("/etc/pig/conf.chef/#{f}")
	end
    end
end

