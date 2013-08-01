default[:hortonworks_hdp][:hive][:user] = "hive"

default[:hive][:javax_jdo_option_ConnectionURL] = "jdbc:mysql://localhost:3306/hivedb?createDatabaseIfNotExist=true"
default[:hive][:javax_jdo_option_ConnectionDriverName] = "com.mysql.jdbc.Driver"
default[:hive][:javax_jdo_option_ConnectionUserName] = "myusername"
default[:hive][:javax_jdo_option_ConnectionPassword] = "mypassword"
default[:hive][:hive_metastore_uris] = "thrift://localhost:9083"
