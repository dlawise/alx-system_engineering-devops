#!/usr/bin/env bash
#Install Nginx with puppet with the following configurations:
#Ensure Nginx is installed and running
class { 'nginx':
  ensure => 'installed',
  enable => true,
  require => Package['nginx'],
}

#Define a custom fact to retrieve the hostname
facts::custom_fact { 'custom_hostname_fact':
  fact_content => $::hostname,
}

#Create an Nginx config file to set the custom header
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => 'file',
  content => "server {
    listen 80 default_server;
    server_name _;

    location / {
        add_header X-Served-By \"$facts['custom_hostname_fact']\";
        # Your other Nginx configuration directives go here
    }
  }",
  require => Class['nginx'],
}

#Notify Nginx to reload its configuration when the file changes
service { 'nginx':
  ensure  => 'running',
  require => File['/etc/nginx/conf.d/custom_headers.conf'],
  notify  => Service['nginx'],
}
