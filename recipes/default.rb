#
# Cookbook Name:: ihs61
# Recipe:: default
#
#
include_recipe 'ihs61::base'
include_recipe 'ihs61::update_installer'
include_recipe 'ihs61::fixpack'
