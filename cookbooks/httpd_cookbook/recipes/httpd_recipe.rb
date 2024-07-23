#
# Cookbook:: httpd_cookbook
# Recipe:: httpd_recipe

package "httpd" do
action :install
end

service "httpd" do
action [:enable, :start]
end

file "/var/www/html/index.html" do
content "This file is to make sure that my httpd server has been installed properly"
action :create
end

# Copyright:: 2024, The Authors, All Rights Reserved.
