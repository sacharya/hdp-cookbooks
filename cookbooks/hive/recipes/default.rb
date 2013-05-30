#
# Cookbook Name:: hive
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user node.hortonworks_hdp.hive.user do
  comment "hive user"
  home    "/usr/lib/hive"
  shell   "/bin/bash"
  action  :create
end

package "hcatalog" do
  action :install
end

package "hive" do
  action :install
end

directory "/etc/hive/conf.chef" do
  owner node.hortonworks_hdp.hive.user
  group node.hortonworks_hdp.hadoop.group
  mode "0755"
  action :create
end

execute "alternatives configured confdir" do
  command "alternatives --install /etc/hive/conf hive-conf /etc/hive/conf.chef 90"
  not_if do
    ::File.readlink("/etc/alternatives/hive-conf") == "/etc/hive/conf.chef"
  end
end

%w'hive-env.sh
hive-site.xml
hive-log4j.properties'.each do | f |
    template "/etc/hive/conf.chef/#{f}" do
	source "#{f}.erb"
	mode 0755
	user node.hortonworks_hdp.hive.user
	group node.hortonworks_hdp.hadoop.group
	only_if do
	    not ::File.exists?("/etc/hive/conf.chef/#{f}")
	end
    end
end

