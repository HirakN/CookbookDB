#
# Cookbook:: db
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# apt_package 'mongodb-org' do
# 	version '3.2'
# end

service 'mongod' do
	action [:stop]
end

apt_repository 'mongodb' do
  uri "http://repo.mongodb.org/apt/ubuntu"
  distribution 'xenial/mongodb-org/3.2'
  components ['multiverse']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key 'EA312927'
end

apt_package 'mongodb-org' do
	action :upgrade
end

apt_update

service 'mongod' do
	action [:start, :enable]
end

template '/etc/mongod.conf' do
	source	'mongod.conf.erb'
	owner	'mongodb'
	group	'mongodb'
	mode	'0750'
	notifies :restart, "service[mongod]"
end

template '/lib/systemd/system/mongod.service' do
	source	'mongod.service.erb'
	owner	'mongodb'
	group	'mongodb'
	mode	'0750'
	notifies :restart, "service[mongod]"
end
