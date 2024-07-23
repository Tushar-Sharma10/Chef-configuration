#
# Cookbook:: second_cookbook
# Recipe:: second_recipe

# installing the package tree and git

package "tree" do
  action :install
end

package "git" do
  action :install
end

file "/basicinfo" do
  content "basic info of the device/machine
  HOSTNAME: #{node["hostname"]}
  IPADDRESS: #{node["ipaddress"]}"
  action :create
end
# Copyright:: 2024, The Authors, All Rights Reserved.
