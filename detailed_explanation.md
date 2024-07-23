# Project Overview:

This document provides a detailed explanation of the Chef configuration used in my project, including command usage and configurations for automating software installation and management.

# System Information:

Device: MacBook

Chef Workstation Version: 0.4.2

Chef Infra Client Version: 15.0.300


**Chef Workstation Installation**:

You can download Chef Workstation for Amazon Linux from the following link:

https://packages.chef.io/files/stable/chef-workstation/0.4.2/el/7/chef-workstation-0.4.2-1.el6.x86_64.rpm

**Creating an Organization:**

To create an organization, visit Chef Manage. I established an organization named "sharmatushar" and downloaded the starter kit. I then used Cyberduck to transfer the starter kit to a Linux machine.

# Commands Used:

**1.) Generating Cookbooks and Recipes:**

   **chef generate cookbook httpd_cookbook:** Creates a cookbook named httpd_cookbook.

**chef generate recipe httpd_recipe:** Creates a recipe named httpd_recipe within the httpd_cookbook.

**2.) Syntax Checking:**

**chef exec ruby -c httpd_cookbook/recipes/httpd_recipe.rb:** Checks the syntax of the recipe code.

**3.) Bootstrapping Nodes:**

**knife bootstrap 172.31.41.79 --ssh-user ec2-user --sudo -i node1.pem -N node2:** Connects the Chef server with the node and installs the Chef Infra Client.

**knife:** The command line tool for interacting with a chef-server

**bootstrap:** A subcommand of "knife" used to install the chef Infra client on a target node and configure it to communicate with a chef server.

**--ssh-user ec2-user:** Specifies the SSH user.

**--sudo:** Uses sudo to run commands.

**-i node1.pem:** Specifies the SSH key.

**-N node2:** Sets the node name.

**4.) Setting Run-Lists:**

**knife node run-list set node2 "recipe[httpd_cookbook::httpd_recipe]":** Adds the httpd_recipe to the node's run-list.

**run-list:** List of recipes to apply.

**set:** Action to perform.

**node2:** The node being modified.

**"recipe[httpd_cookbook::httpd_recipe]":** Recipe to add.


# Recipe Code:

The code below is written in Ruby and defines how to set up the HTTPD server:

#Installs the HTTPD package.

package "httpd" do

action :install

end

#Ensures the HTTPD service is enabled and started.

service "httpd" do

action [:enable, :start]

end

#Creates a file to verify the HTTPD server installation.

file "/var/www/html/index.html" do

content "This file is to make sure that my httpd server has been installed properly"
  
action :create
  
end


# Automation Script:

To automate configuration on a new machine, I used the following script:

**#!/bin/bash**

**sudo su**

**yum update -y**

**echo " * * * * * root chef-client" >> /etc/crontab**

**Explanation:**

**sudo su:** Switches to the root user.

**yum update -y:** Updates all packages on the system.

**echo " * * * * * root chef-client" >> /etc/crontab:** Schedules the chef-client command to run every minute.
