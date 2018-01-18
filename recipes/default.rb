#
# Cookbook Name:: tomskillerwebsite
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

#update apt
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

#install apache http server
package 'apache2'

#start ahttp services
service 'apache2' do
  supports status: true
  action [:enable, :start]
end

#create index page
template '/var/www/html/index.html' do 
  source 'index.html.erb'
end

#create css style
template '/var/www/html/style.css' do 
  source 'style.css.erb'
end

#create add smtp server
package 'mailutils'

#start postfix service
service 'postfix' do
  supports status: true
  action [:enable, :start]
end


#email shell
template '/tmp/emailsend.sh' do 
  source 'emailsend.sh.erb'
  mode '0440'
end

#execute email notification
  execute 'sendmail' do
      command 'bash /tmp/emailsend.sh'
  end


