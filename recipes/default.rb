#
# Cookbook Name:: hortonworks-hdp
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# System tweaks. 

# Increase Filesystem limits.
# Strips out any open files limits and replaces it with a big number
hortonworks_configmunge "increase open files limit" do
  config_file "/etc/security/limits.conf"
  filter /^[^#].*nofile/ 
  appended_configs ["*  hard  nofile  #{node[:hortonworks_hdp][:nofiles]}\n"]
end
=begin
ruby_block "increase open files limit" do
  block do
    security_file = Array.new
    File.open("/etc/security/limits.conf", "r") do | f |
      while line = f.gets
        if line =~ /^[^#].*nofile/
          next
        else
          security_file << line
        end
      end
    end
    security_file << "*  hard  nofile  #{node[:hortonworks_hdp][:nofiles]}\n"
    File.open("/etc/security/limits.conf", "w") do | f |
      security_file.each do | line |
        f.write(line)
      end
    end
  end
end
=end

